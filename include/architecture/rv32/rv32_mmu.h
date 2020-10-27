// EPOS-- RISC-V 32 MMU Mediator Declarations

#ifndef __riscv32_mmu_h
#define __riscv32_mmu_h

#include <system/memory_map.h>
#include <utility/string.h>
#include <utility/list.h>
#include <utility/debug.h>
#include <architecture/cpu.h>
#include <architecture/mmu.h>



__BEGIN_SYS

class MMU: public MMU_Common<0, 0, 0>
{
    friend class CPU;

private:
    typedef Grouping_List<unsigned int> List;

    static const unsigned int PHY_MEM = Memory_Map::PHY_MEM;

public:
    // Page Flags
    typedef MMU_Common<0, 0, 0>::Flags RISCV_Flags;
    typedef struct {
        unsigned int page_entry ;
    } entry;

    typedef struct {
        entry entries[512] ;
    } table;

    // Page_Table
    class Page_Table {
    public:
        Page_Table() {
            _root = calloc(1);
        }
        #define VALID 1 << 0
        #define	READ 1 << 1
        #define	WRITE 1 << 2
        #define	EXECUTE 1 << 3
        #define	USER 1 << 4
        #define	GLOBAL 1 << 5
        #define	ACCESS 1 << 6
        #define	DIRTY 1 << 7
        


        table* get_page_table() { return (table*)_root; }

        bool entry_is_valid(entry* e){
            return e->page_entry & VALID;
        }
        bool entry_is_invalid(entry* e){
            return !entry_is_valid(e);
        }
        bool entry_is_leaf(entry* e){
            return (e->page_entry & 0xe) !=0;
        }
        bool entry_is_branch(entry* e){
            return !entry_is_leaf(e);
        }

        int table_len(table* t){
            return sizeof(*t);
        }

        unsigned int align_val(unsigned int val, unsigned int order){
            unsigned int o = (1 << order) - 1;
            return(val + o) & ~o;
        }

        void map(table* t, unsigned int paddr, unsigned int vaddr, unsigned int bits, int level ){
            unsigned int vpn[] = {
                        // VPN[0] = vaddr[21:12]
                        (vaddr >> 12) & 0x1ff,
                        // VPN[1] = vaddr[31:22]
                        (vaddr >> 22) & 0x1ff,
            };
            unsigned int ppn[] = {
                        // PPN[0] = paddr[21:12]
                        (paddr >> 12) & 0x3ff,
                        // PPN[1] = paddr[33:22]
                        (paddr >> 22) & 0xfff,
            };

            entry* v = &t->entries[vpn[1]];
            for (int i = 1; i>=level; i--){
                if (!entry_is_valid(v)){
                    char* page = calloc(1);
                    v->page_entry = ((unsigned int)page >> 2) | VALID;
                    //alloca a pagina page = calloc(1)
                    //seta a pagina nas entries com os bits de valido com 1 v->page_entry = (page>>2) | VALID
                }
                v = (entry*) (((v->page_entry & ~0x3ff) << 2) + vpn[i]*sizeof(entry)); //proximo nivel
            }

            unsigned int entry = (ppn[1] << 20) |   // PPN[1] = [32:20]
                    (ppn[0] << 10) |              // PPN[0] = [20:10]
                    bits |                      // Specified bits, such as User, Read, Write, etc
                    VALID;     // Valid bit
                    // Set the entry. V should be set to the correct pointer by the loop
                    // above.
            v->page_entry = entry;
        }


        void map_contiguous(table* root, unsigned int start, unsigned int end, int bits)
        {
            unsigned int memaddr = start & ~(PAGE_SIZE - 1);
            int num_kb_pages = (align_val(end, 12) - memaddr)/ PAGE_SIZE;
            
            for (int i = 0; i<num_kb_pages; i++){
                map(root, memaddr, memaddr, bits, 0);
                memaddr += 1 << 12;
            }
        }

        void unmap(table* t){
            for (int lv1 = 0; lv1 < table_len(t); lv1++){
                entry* entry_lv1 = &t->entries[lv1];
                if (entry_is_valid(entry_lv1) && entry_is_branch(entry_lv1)){
                    unsigned int memaddr_lv0 = (entry_lv1->page_entry & ~0x3ff) << 2;
                    free((char*) memaddr_lv0);
                }
            }
        }
        
        unsigned int virt_to_phys(table* t, unsigned int vaddr){
            unsigned int vpn[] = {
                        // VPN[0] = vaddr[21:12]
                        (vaddr >> 12) & 0x1ff,
                        // VPN[1] = vaddr[31:22]
                        (vaddr >> 22) & 0x1ff,
            };

            entry* v = &t->entries[vpn[1]];
            for (int i = 1; i >= 0; i--) {
                if (entry_is_invalid(v)){
                    break;
                }else if(entry_is_leaf(v)){
                    unsigned int off_mask = (1 << (12 + i * 10)) - 1;
                    unsigned int vaddr_pgoff = vaddr & off_mask;
                    unsigned int addr = (v->page_entry << 2) & ~off_mask;
                    return addr | vaddr_pgoff;
                }
                v = (entry*) (((v->page_entry & ~0x3ff) << 2) + vpn[i-1]*sizeof(entry)); //proximo nivel
            }
            return 0;

        }

        private:
            void* _root;
    };

    // Chunk (for Segment)
    class Chunk
    {
    public:
        Chunk() {}
        Chunk(unsigned int bytes, Flags flags): _phy_addr(alloc(bytes)), _bytes(bytes), _flags(flags) {}
        Chunk(Phy_Addr phy_addr, unsigned int bytes, Flags flags): _phy_addr(phy_addr), _bytes(bytes), _flags(flags) {}

        ~Chunk() { free(_phy_addr, _bytes); }

        unsigned int pts() const { return 0; }
        Flags flags() const { return _flags; }
        Page_Table * pt() const { return 0; }
        unsigned int size() const { return _bytes; }
        Phy_Addr phy_address() const { return _phy_addr; } // always CT
        int resize(unsigned int amount) { return 0; } // no resize in CT

    private:
        Phy_Addr _phy_addr;
        unsigned int _bytes;
        RISCV_Flags _flags;
    };

    // Page Directory
    typedef Page_Table Page_Directory;

    // Directory (for Address_Space)
    class Directory
    {
    public:
        Directory() {}
        Directory(Page_Directory * pd) {}

        Page_Table * pd() const { return 0; }

        void activate() {}

        Log_Addr attach(const Chunk & chunk) { return chunk.phy_address(); }
        Log_Addr attach(const Chunk & chunk, Log_Addr addr) { return (addr == chunk.phy_address())? addr : Log_Addr(false); }
        void detach(const Chunk & chunk) {}
        void detach(const Chunk & chunk, Log_Addr addr) {}

        Phy_Addr physical(Log_Addr addr) { return addr; }
    };

    // DMA_Buffer (straightforward without paging)
    class DMA_Buffer: public Chunk
    {
    public:
        DMA_Buffer(unsigned int s): Chunk(s, Flags::CT) {
            db<MMU>(TRC) << "MMU::DMA_Buffer() => " << *this << endl;
        }

        Log_Addr log_address() const { return phy_address(); }

        friend Debug & operator<<(Debug & db, const DMA_Buffer & b) {
            db << "{phy=" << b.phy_address()
               << ",log=" << b.log_address()
               << ",size=" << b.size()
               << ",flags=" << b.flags() << "}";
            return db;
        }
    };

public:
    MMU() {}

    static Phy_Addr alloc(unsigned int bytes = 1) {
        Phy_Addr phy(false);
        if(bytes) {
            List::Element * e = _free.search_decrementing(bytes);
            if(e)
                phy = reinterpret_cast<unsigned int>(e->object()) + e->size();
            else
                db<MMU>(ERR) << "MMU::alloc() failed!" << endl;
        }
        db<MMU>(TRC) << "MMU::alloc(bytes=" << bytes << ") => " << phy << endl;

        return phy;
    };

    static Phy_Addr calloc(unsigned int bytes = 1) {
        Phy_Addr phy = alloc(bytes);
        memset(phy, 0, bytes);
        return phy;
    }

    static void free(Phy_Addr addr, unsigned int n = 1) {
        db<MMU>(TRC) << "MMU::free(addr=" << addr << ",n=" << n << ")" << endl;

        // No unaligned addresses if the CPU doesn't support it
        assert(Traits<CPU>::unaligned_memory_access || !(addr % 4));

        // Free blocks must be large enough to contain a list element
        assert(n > sizeof (List::Element));

        if(addr && n) {
            List::Element * e = new (addr) List::Element(addr, n);
            List::Element * m1, * m2;
            _free.insert_merging(e, &m1, &m2);
        }
    }

    static unsigned int allocable() { return _free.head() ? _free.head()->size() : 0; }

    static Page_Directory * volatile current() { return 0; }

    static Phy_Addr physical(Log_Addr addr) { return addr; }

    static void flush_tlb() {}
    static void flush_tlb(Log_Addr addr) {}

private:
    static void init();

private:
    static List _free;
};

__END_SYS

#endif
