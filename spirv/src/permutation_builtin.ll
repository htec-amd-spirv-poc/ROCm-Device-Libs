; ModuleID = 'permutation_builtin'
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spirv64"

; Function Attrs: noinline nounwind optnone

declare dso_local spir_func i32 @_Z17sub_group_shufflejj(i32, i32) local_unnamed_addr

define spir_func i32 @spirv_sub_group_shuffle_ui32(i32 %0, i32 %1) {
  %2 = tail call spir_func i32 @_Z17sub_group_shufflejj(i32 %0, i32 %1) #1
  ret i32 %2
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 16.0.0 (https://github.com/htec-amd-spirv-poc/llvm-project.git 005de35107fe2d08c16a6089280126f942dddf0d)"}
