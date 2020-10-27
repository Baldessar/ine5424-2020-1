// EPOS RISC-V 32 MMU Mediator Initialization

#include <architecture/mmu.h>

extern "C" void * __data_start;
extern "C" void * _edata;
extern "C" void * __bss_start;
extern "C" void * _end;

__BEGIN_SYS

void MMU::init()
{   
    
    db<Init, MMU>(TRC) << "MMU::init()" << endl;
    db<Init, MMU>(INF) << "MMU::init::dat.b=" << &__data_start << ",dat.e=" << &_edata << ",bss.b=" << &__bss_start << ",bss.e=" << &_end << endl;

    // Page_Table table = Page_Table();
    // MMU::table* mmu_root = table.get_page_table();
    // table.table_len(mmu_root); 
    // table.map_contiguous(mmu_root, __bss_start, _end, 0b1110)

    //unsigned int satp = mmu_root >> 10 | 1 << 31;
    unsigned int satp =  1 << 31;
    ASM("csrw satp, %0": "=r"(satp) :);
    ASM("sfence.vma");
    // For machines that do not feature a real MMU, frame size = 1 byte
    // TODO: The stack left at the top of the memory for INIT is freed at Thread::init()
    free(&_end, pages(Memory_Map::SYS_STACK - reinterpret_cast<unsigned int>(&_end)));
}

__END_SYS
