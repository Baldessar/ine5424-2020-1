#include <stdint.h>
#define VALID 1 << 0
#define	READ = 1 << 1,
#define	WRITE = 1 << 2,
#define	EXECUTE = 1 << 3,
#define	USER = 1 << 4,
#define	GLOBAL = 1 << 5,
#define	ACCESS = 1 << 6,
#define	DIRTY = 1 << 7,

typedef struct {
    uint64_t* page_entry ;
} entry;

typedef struct {
    entry entries[512] ;
} table;

bool entry_is_valid(entry* e){
    return e->page_entry & VALID ;
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

int64_t table_len(table t){
    return sizeof(t);
}

void map(table* t, uint64_t paddr, uint64_t vaddr, uint64_t bits, uint64_t level ){
    uint64_t vpn[] = {
				// VPN[0] = vaddr[20:12]
				(vaddr >> 12) & 0x1ff,
				// VPN[1] = vaddr[29:21]
				(vaddr >> 21) & 0x1ff,
				// VPN[2] = vaddr[38:30]
				(vaddr >> 30) & 0x1ff,
    };

	// Just like the virtual address, extract the physical address
	// numbers (PPN). However, PPN[2] is different in that it stores
	// 26 bits instead of 9. Therefore, we use,
	// 0x3ff_ffff = 0b11_1111_1111_1111_1111_1111_1111 (26 bits).
	uint64_t ppn[] = { 
				// PPN[0] = paddr[20:12]
				(paddr >> 12) & 0x1ff,
				// PPN[1] = paddr[29:21]
				(paddr >> 21) & 0x1ff,
				// PPN[2] = paddr[55:30]
				(paddr >> 30) & 0x3ffffff,
    };

    entry* v = &t->entries[vpn[2]];
    for (int i = 1; i>=level; i--){
        if !entry_is_valid(v){
            //alloca a pagina page = zalloc(1)
            //seta a pagina nas entries com os bits de valido com 1 v->page_entry = (page>>2) | VALID
        }
        v = &t->entries[vpn[i]];
    }

    uint64_t* entry = (ppn[2] << 28) |   // PPN[2] = [53:28]
			(ppn[1] << 19) |            // PPN[1] = [27:19]
			(ppn[0] << 10) |            // PPN[0] = [18:10]
			bits |                      // Specified bits, such as User, Read, Write, etc
			VALID;     // Valid bit
			// Set the entry. V should be set to the correct pointer by the loop
			// above.
    v->page_entry = entry;
}

// void entry_set_entry(){
//     return true;
// }
// void entry_get_entry(){
//     return true;
// }