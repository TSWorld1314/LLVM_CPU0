; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -force-streaming-compatible-sve < %s | FileCheck %s

target triple = "aarch64-unknown-linux-gnu"

define void @store_v4i8(ptr %a) #0 {
; CHECK-LABEL: store_v4i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h, vl4
; CHECK-NEXT:    mov z0.h, #0 // =0x0
; CHECK-NEXT:    st1b { z0.h }, p0, [x0]
; CHECK-NEXT:    ret
  store <4 x i8> zeroinitializer, ptr %a
  ret void
}

define void @store_v8i8(ptr %a) #0 {
; CHECK-LABEL: store_v8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.b, #0 // =0x0
; CHECK-NEXT:    str d0, [x0]
; CHECK-NEXT:    ret
  store <8 x i8> zeroinitializer, ptr %a
  ret void
}

define void @store_v16i8(ptr %a) #0 {
; CHECK-LABEL: store_v16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.b, #0 // =0x0
; CHECK-NEXT:    str q0, [x0]
; CHECK-NEXT:    ret
  store <16 x i8> zeroinitializer, ptr %a
  ret void
}

define void @store_v32i8(ptr %a) #0 {
; CHECK-LABEL: store_v32i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.b, #0 // =0x0
; CHECK-NEXT:    stp q0, q0, [x0]
; CHECK-NEXT:    ret
  store <32 x i8> zeroinitializer, ptr %a
  ret void
}

define void @store_v2i16(ptr %a) #0 {
; CHECK-LABEL: store_v2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl2
; CHECK-NEXT:    mov z0.s, #0 // =0x0
; CHECK-NEXT:    st1h { z0.s }, p0, [x0]
; CHECK-NEXT:    ret
  store <2 x i16> zeroinitializer, ptr %a
  ret void
}

define void @store_v2f16(ptr %a) #0 {
; CHECK-LABEL: store_v2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, #0 // =0x0
; CHECK-NEXT:    fmov w8, s0
; CHECK-NEXT:    str w8, [x0]
; CHECK-NEXT:    ret
  store <2 x half> zeroinitializer, ptr %a
  ret void
}

define void @store_v4i16(ptr %a) #0 {
; CHECK-LABEL: store_v4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, #0 // =0x0
; CHECK-NEXT:    str d0, [x0]
; CHECK-NEXT:    ret
  store <4 x i16> zeroinitializer, ptr %a
  ret void
}

define void @store_v4f16(ptr %a) #0 {
; CHECK-LABEL: store_v4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, #0 // =0x0
; CHECK-NEXT:    str d0, [x0]
; CHECK-NEXT:    ret
  store <4 x half> zeroinitializer, ptr %a
  ret void
}

define void @store_v8i16(ptr %a) #0 {
; CHECK-LABEL: store_v8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, #0 // =0x0
; CHECK-NEXT:    str q0, [x0]
; CHECK-NEXT:    ret
  store <8 x i16> zeroinitializer, ptr %a
  ret void
}

define void @store_v8f16(ptr %a) #0 {
; CHECK-LABEL: store_v8f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, #0 // =0x0
; CHECK-NEXT:    str q0, [x0]
; CHECK-NEXT:    ret
  store <8 x half> zeroinitializer, ptr %a
  ret void
}

define void @store_v16i16(ptr %a) #0 {
; CHECK-LABEL: store_v16i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, #0 // =0x0
; CHECK-NEXT:    stp q0, q0, [x0]
; CHECK-NEXT:    ret
  store <16 x i16> zeroinitializer, ptr %a
  ret void
}

define void @store_v16f16(ptr %a) #0 {
; CHECK-LABEL: store_v16f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, #0 // =0x0
; CHECK-NEXT:    stp q0, q0, [x0]
; CHECK-NEXT:    ret
  store <16 x half> zeroinitializer, ptr %a
  ret void
}

define void @store_v2i32(ptr %a) #0 {
; CHECK-LABEL: store_v2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str xzr, [x0]
; CHECK-NEXT:    ret
  store <2 x i32> zeroinitializer, ptr %a
  ret void
}

define void @store_v2f32(ptr %a) #0 {
; CHECK-LABEL: store_v2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str xzr, [x0]
; CHECK-NEXT:    ret
  store <2 x float> zeroinitializer, ptr %a
  ret void
}

define void @store_v4i32(ptr %a) #0 {
; CHECK-LABEL: store_v4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    stp xzr, xzr, [x0]
; CHECK-NEXT:    ret
  store <4 x i32> zeroinitializer, ptr %a
  ret void
}

define void @store_v4f32(ptr %a) #0 {
; CHECK-LABEL: store_v4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    stp xzr, xzr, [x0]
; CHECK-NEXT:    ret
  store <4 x float> zeroinitializer, ptr %a
  ret void
}

define void @store_v8i32(ptr %a) #0 {
; CHECK-LABEL: store_v8i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, #0 // =0x0
; CHECK-NEXT:    stp q0, q0, [x0]
; CHECK-NEXT:    ret
  store <8 x i32> zeroinitializer, ptr %a
  ret void
}

define void @store_v8f32(ptr %a) #0 {
; CHECK-LABEL: store_v8f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, #0 // =0x0
; CHECK-NEXT:    stp q0, q0, [x0]
; CHECK-NEXT:    ret
  store <8 x float> zeroinitializer, ptr %a
  ret void
}

define void @store_v1i64(ptr %a) #0 {
; CHECK-LABEL: store_v1i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, #0 // =0x0
; CHECK-NEXT:    str d0, [x0]
; CHECK-NEXT:    ret
  store <1 x i64> zeroinitializer, ptr %a
  ret void
}

define void @store_v1f64(ptr %a) #0 {
; CHECK-LABEL: store_v1f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi d0, #0000000000000000
; CHECK-NEXT:    str d0, [x0]
; CHECK-NEXT:    ret
  store <1 x double> zeroinitializer, ptr %a
  ret void
}

define void @store_v2i64(ptr %a) #0 {
; CHECK-LABEL: store_v2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    stp xzr, xzr, [x0]
; CHECK-NEXT:    ret
  store <2 x i64> zeroinitializer, ptr %a
  ret void
}

define void @store_v2f64(ptr %a) #0 {
; CHECK-LABEL: store_v2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    stp xzr, xzr, [x0]
; CHECK-NEXT:    ret
  store <2 x double> zeroinitializer, ptr %a
  ret void
}

define void @store_v4i64(ptr %a) #0 {
; CHECK-LABEL: store_v4i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, #0 // =0x0
; CHECK-NEXT:    stp q0, q0, [x0]
; CHECK-NEXT:    ret
  store <4 x i64> zeroinitializer, ptr %a
  ret void
}

define void @store_v4f64(ptr %a) #0 {
; CHECK-LABEL: store_v4f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, #0 // =0x0
; CHECK-NEXT:    stp q0, q0, [x0]
; CHECK-NEXT:    ret
  store <4 x double> zeroinitializer, ptr %a
  ret void
}

attributes #0 = { "target-features"="+sve" }