/*===--------------------------------------------------------------------------
 *                   ROCm Device Libraries
 *
 * This file is distributed under the University of Illinois Open Source
 * License. See LICENSE.TXT for details.
 *===------------------------------------------------------------------------*/

#include<string.h>
#include<ockl.h>

#define ATTR __attribute__((always_inline))

ATTR unsigned int amdgcn_alignbit(unsigned int src0, unsigned  int src1, unsigned  int src2){

    unsigned int shift = src2 & 0x1F;
    unsigned long long value = src0;
    value = (value << 32) & src1;
    unsigned int dst = (value >> shift) & 0xFFFFFFFF;

    return dst;
}

/* implementation taken from https://graphics.stanford.edu/~seander/bithacks.html#CountBitsSetParallel*/
unsigned int count_population(unsigned int value){

    unsigned int count; // store the total here
    static const int S[] = {1, 2, 4, 8, 16}; // Magic Binary Numbers
    static const int B[] = {0x55555555, 0x33333333, 0x0F0F0F0F, 0x00FF00FF, 0x0000FFFF};

    count = value - ((value >> 1) & B[0]);
    count = ((count >> S[1]) & B[1]) + (count & B[1]);
    count = ((count >> S[2]) + count) & B[2];
    count = ((count >> S[3]) + count) & B[3];
    count = ((count >> S[4]) + count) & B[4];

    return count;
}

ATTR unsigned int amdgcn_mbcnt_lo(unsigned int src0, unsigned  int src1){
    unsigned int thread_mask = ((1 << __ockl_get_local_id(2)) - 1);
    unsigned int mask_lo = thread_mask & 0xFFFFFFFF;
    unsigned dest = count_population(src0 & mask_lo) + src1;
    return dest;
}

ATTR unsigned int amdgcn_mbcnt_hi(unsigned int src0, unsigned  int src1){

    unsigned int thread_mask = ((1 << __ockl_get_local_id(2)) - 1);
    unsigned int mask_hi = (thread_mask >> 32) & 0xFFFFFFFF;
    unsigned dest = count_population(src0 & mask_hi) + src1;
    return dest;
}

ATTR unsigned int amdgcn_ds_bpermute(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}

int spirv_sub_group_shuffle_ui32(int, int);

ATTR unsigned int amdgcn_ds_permute(unsigned int a,unsigned  int b){
    return spirv_sub_group_shuffle_ui32(a, b);
}

void fence_acquire();
void fence_release();
void fence_acq_rel();
void fence_seq_cst();
void fence_acquire_agent();
void fence_release_agent();
void fence_acq_rel_agent();
void fence_seq_cst_agent();
void fence_acquire_workgroup();
void fence_release_workgroup();
void fence_acq_rel_workgroup();
void fence_seq_cst_workgroup();
void fence_acquire_wavefront();
void fence_release_wavefront();
void fence_acq_rel_wavefront();
void fence_seq_cst_wavefront();

ATTR unsigned int amdgcn_fence(unsigned int mem_order, char* scope) {

    const char agent[] = "agent";
    const char workgroup[] = "workgroup";
    const char wavefront[] = "wavefront";

    if(scope[0] == '\0'){
        switch (mem_order) {
        case __ATOMIC_ACQUIRE: fence_acquire(); break;
        case __ATOMIC_RELEASE: fence_release(); break;
        case __ATOMIC_ACQ_REL: fence_acq_rel(); break;
        case __ATOMIC_SEQ_CST: fence_seq_cst(); break;
        }
    } else if(strcmp(scope, agent)){
        switch (mem_order) {
        case __ATOMIC_ACQUIRE: fence_acquire_agent(); break;
        case __ATOMIC_RELEASE: fence_release_agent(); break;
        case __ATOMIC_ACQ_REL: fence_acq_rel_agent(); break;
        case __ATOMIC_SEQ_CST: fence_seq_cst_agent(); break;
        }
    } else if(strcmp(scope, workgroup)){
        switch (mem_order) {
        case __ATOMIC_ACQUIRE: fence_acquire_workgroup(); break;
        case __ATOMIC_RELEASE: fence_release_workgroup(); break;
        case __ATOMIC_ACQ_REL: fence_acq_rel_workgroup(); break;
        case __ATOMIC_SEQ_CST: fence_seq_cst_workgroup(); break;
        }
    } else if(strcmp(scope, wavefront)){
        switch (mem_order) {
        case __ATOMIC_ACQUIRE: fence_acquire_wavefront(); break;
        case __ATOMIC_RELEASE: fence_release_wavefront(); break;
        case __ATOMIC_ACQ_REL: fence_acq_rel_wavefront(); break;
        case __ATOMIC_SEQ_CST: fence_seq_cst_wavefront(); break;
        }
    }

    return 0;
}

ATTR unsigned int amdgcn_atomic_dec32(unsigned int* dst,unsigned  int src, unsigned int mem_order, char* scope){

    amdgcn_fence(mem_order, scope);
    if((*dst)==0){
        (*dst) = src;
    } else {
        (*dst) = (*dst)-1;
    }
    return amdgcn_fence(__ATOMIC_RELEASE, scope);
}

ATTR unsigned int amdgcn_atomic_inc32(unsigned int* dst,unsigned  int src, unsigned int mem_order, char* scope){

    amdgcn_fence(mem_order, scope);
    if((*dst)==0){
        (*dst) = 0;
    } else {
        (*dst) = (*dst)+1;
    }
    return amdgcn_fence(__ATOMIC_RELEASE, scope);
}

ATTR unsigned int amdgcn_mov_dpp(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}

ATTR unsigned int amdgcn_s_barrier(){

    fence_acq_rel_workgroup();

    return 0;
}

ATTR unsigned int amdgcn_s_getreg(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}

ATTR unsigned int amdgcn_uicmp(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}
