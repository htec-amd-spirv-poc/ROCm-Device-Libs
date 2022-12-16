/*===--------------------------------------------------------------------------
 *                   ROCm Device Libraries
 *
 * This file is distributed under the University of Illinois Open Source
 * License. See LICENSE.TXT for details.
 *===------------------------------------------------------------------------*/

#include<string.h>

#define ATTR __attribute__((always_inline))

ATTR unsigned int amdgcn_alignbit(unsigned int a,unsigned  int b,unsigned  int c){
    //TODO add implementation
    return a+b+c;
}

ATTR unsigned int amdgcn_mbcnt_lo(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}

ATTR unsigned int amdgcn_mbcnt_hi(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}

ATTR unsigned int amdgcn_ds_bpermute(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}

ATTR unsigned int amdgcn_ds_permute(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
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

ATTR unsigned int amdgcn_s_barrier(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}

ATTR unsigned int amdgcn_s_getreg(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}

ATTR unsigned int amdgcn_uicmp(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}
