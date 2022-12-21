##===--------------------------------------------------------------------------
##                   ROCm Device Libraries
##
## This file is distributed under the University of Illinois Open Source
## License. See LICENSE.TXT for details.
##===--------------------------------------------------------------------------

file(GLOB cl_sources
  ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cl
)

file(GLOB ll_sources
  ${CMAKE_CURRENT_SOURCE_DIR}/src/*.ll
)

file(GLOB sources ${cl_sources} ${ll_sources})

set(CLANG_OCL_FLAGS -fcolor-diagnostics -Werror -Wno-error=atomic-alignment -x cl -Xclang
  -cl-std=CL2.0 -target "spirv64" -fvisibility=protected -fomit-frame-pointer
  -Xclang -finclude-default-header -nogpulib -cl-no-stdinc "${CLANG_OPTIONS_APPEND}")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../ocml/inc)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../ockl_spirv/inc)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../irif_spirv/inc)

opencl_bc_lib(NAME spirv
              SOURCES ${sources})
