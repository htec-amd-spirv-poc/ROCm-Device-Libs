/*===--------------------------------------------------------------------------
 *                   ROCm Device Libraries
 *
 * This file is distributed under the University of Illinois Open Source
 * License. See LICENSE.TXT for details.
 *===------------------------------------------------------------------------*/

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

ATTR unsigned int amdgcn_atomic_dec32(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
}

ATTR unsigned int amdgcn_atomic_inc32(unsigned int a,unsigned  int b){
    //TODO add implementation
    return a+b;
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
