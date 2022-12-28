; ModuleID = 'thread_id_builtin'
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spirv64"

declare spir_func i64 @_Z12get_local_idj(i32)
declare spir_func i32 @_Z13get_global_idj(i32)
declare spir_func i32 @_Z12get_group_idj(i32)

; Function Attrs: noinline nounwind optnone
define spir_func i64 @spirv_local_thread_id(i32 %idx) {
  %1 = call spir_func i64 @_Z12get_local_idj(i32 %idx) #1
  ret i64 %1
}

define spir_func i32 @spirv_global_thread_id(i32 %idx) {
  %1 = call spir_func i32 @_Z13get_global_idj(i32 %idx) #1
  ret i32 %1
}

define spir_func i32 @spirv_group_id(i32 %idx) {
  %1 = call spir_func i32 @_Z12get_group_idj(i32 %idx)
  ret i32 %1
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 16.0.0 (https://github.com/htec-amd-spirv-poc/llvm-project.git 005de35107fe2d08c16a6089280126f942dddf0d)"}
