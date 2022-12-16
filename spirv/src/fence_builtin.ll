; ModuleID = 'fence_builtin'
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spirv64"

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_acquire() #0 {
  fence acquire
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_release() #0 {
  fence release
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_acq_rel() #0 {
  fence acq_rel
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_seq_cst() #0 {
  fence seq_cst
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_acquire_agent() #0 {
  fence syncscope("agent") acquire
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_release_agent() #0 {
  fence syncscope("agent") release
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_acq_rel_agent() #0 {
  fence syncscope("agent") acq_rel
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_seq_cst_agent() #0 {
  fence syncscope("agent") seq_cst
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_acquire_workgroup() #0 {
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_release_workgroup() #0 {
  fence syncscope("workgroup") release
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_acq_rel_workgroup() #0 {
  fence syncscope("workgroup") acq_rel
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_seq_cst_workgroup() #0 {
  fence syncscope("workgroup") seq_cst
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_acquire_wavefront() #0 {
  fence syncscope("wavefront") acquire
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_release_wavefront() #0 {
  fence syncscope("wavefront") release
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_acq_rel_wavefront() #0 {
  fence syncscope("wavefront") acq_rel
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @fence_seq_cst_wavefront() #0 {
  fence syncscope("wavefront") seq_cst
  ret void
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 16.0.0 (https://github.com/htec-amd-spirv-poc/llvm-project.git 005de35107fe2d08c16a6089280126f942dddf0d)"}
