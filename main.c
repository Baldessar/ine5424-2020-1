
#include "c/mmu.h"
#include "c/mem.h"
#include "c/kmem.h"
#include "c/cache.h"


extern char* KERNEL_TABLE;

extern "C" {
    int kinit() {
        page_init();
        kmem_init();
        table* root_ptr = get_page_table();
        u_int64_t root_size = sizeof(root_ptr);
        char* kheap_head = get_head();
        u_int64_t total_pages = get_num_allocations();
        id_map_range(root_ptr,(u_int64_t) kheap_head,(u_int64_t) kheap_head + total_pages * 4096, READ|WRITE);

        u_int64_t num_pages = HEAP_SIZE / PAGE_SIZE;
        id_map_range(root_ptr,(u_int64_t) HEAP_START,(u_int64_t) HEAP_START + num_pages, READ|WRITE);
        id_map_range(root_ptr,(u_int64_t) TEXT_START,(u_int64_t) TEXT_END, READ|EXECUTE);
        id_map_range(root_ptr,(u_int64_t) RODATA_START,(u_int64_t) RODATA_END, READ|EXECUTE);
        id_map_range(root_ptr,(u_int64_t) DATA_START,(u_int64_t) DATA_END, READ|WRITE);
        id_map_range(root_ptr,(u_int64_t) BSS_START,(u_int64_t) BSS_END, READ|WRITE);
        id_map_range(root_ptr,(u_int64_t) KERNEL_STACK_START,(u_int64_t) KERNEL_STACK_END, READ|WRITE);

        KERNEL_TABLE = (char*)root_ptr;

        return ((uint64_t)root_ptr >> 12)  | (8 << 60);
    }

    int kmain() {
        uint64_t x = virt_to_phys((table*)KERNEL_TABLE, HEAP_START);
        cache_enable_ways();
        return 0;
    }
}



int main() {

    return 0;
}
