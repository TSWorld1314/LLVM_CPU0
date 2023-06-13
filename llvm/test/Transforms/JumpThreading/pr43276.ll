; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S < %s -aa-pipeline=basic-aa -passes='require<loops>,jump-threading' | FileCheck %s

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128-ni:1"
target triple = "x86_64-unknown-linux-gnu"

@global = external global ptr

define i32 @wibble() {
; CHECK-LABEL: @wibble(
; CHECK-NEXT:  bb19:
; CHECK-NEXT:    [[TMP20:%.*]] = getelementptr i8, ptr undef, i64 16
; CHECK-NEXT:    [[TMP21:%.*]] = load atomic ptr, ptr @global unordered, align 8
; CHECK-NEXT:    [[TMP22:%.*]] = getelementptr inbounds i8, ptr [[TMP21]], i64 936
; CHECK-NEXT:    br label [[BB3:%.*]]
; CHECK:       bb2:
; CHECK-NEXT:    br label [[BB3]]
; CHECK:       bb3:
; CHECK-NEXT:    [[TMP:%.*]] = phi ptr [ [[TMP22]], [[BB19:%.*]] ], [ undef, [[BB2:%.*]] ]
; CHECK-NEXT:    [[TMP4:%.*]] = phi ptr [ [[TMP21]], [[BB19]] ], [ undef, [[BB2]] ]
; CHECK-NEXT:    [[TMP6:%.*]] = getelementptr inbounds i8, ptr [[TMP4]], i64 848
; CHECK-NEXT:    br label [[BB11:%.*]]
; CHECK:       bb11:
; CHECK-NEXT:    [[TMP12:%.*]] = load atomic ptr, ptr [[TMP6]] unordered, align 8
; CHECK-NEXT:    [[TMP13:%.*]] = icmp eq ptr [[TMP12]], null
; CHECK-NEXT:    br i1 [[TMP13]], label [[BB17:%.*]], label [[BB16:%.*]]
; CHECK:       bb16:
; CHECK-NEXT:    store atomic i64 undef, ptr [[TMP]] unordered, align 8
; CHECK-NEXT:    br label [[BB11]]
; CHECK:       bb17:
; CHECK-NEXT:    ret i32 undef
;
bb:
  br label %bb1

bb1:                                              ; preds = %bb
  br label %bb18

bb2:                                              ; No predecessors!
  br label %bb3

bb3:                                              ; preds = %bb19, %bb2
  %tmp = phi ptr [ %tmp22, %bb19 ], [ undef, %bb2 ]
  %tmp4 = phi ptr [ %tmp21, %bb19 ], [ undef, %bb2 ]
  %tmp6 = getelementptr inbounds i8, ptr %tmp4, i64 848
  br label %bb11

bb11:                                             ; preds = %bb16, %bb3
  %tmp12 = load atomic ptr, ptr %tmp6 unordered, align 8
  %tmp13 = icmp eq ptr %tmp12, null
  br i1 %tmp13, label %bb17, label %bb14

bb14:                                             ; preds = %bb11
  br label %bb15

bb15:                                             ; preds = %bb14
  br label %bb16

bb16:                                             ; preds = %bb15
  store atomic i64 undef, ptr %tmp unordered, align 8
  br label %bb11

bb17:                                             ; preds = %bb11
  ret i32 undef

bb18:                                             ; preds = %bb1
  br label %bb19

bb19:                                             ; preds = %bb18
  %tmp20 = getelementptr i8, ptr undef, i64 16
  %tmp21 = load atomic ptr, ptr @global unordered, align 8
  %tmp22 = getelementptr inbounds i8, ptr %tmp21, i64 936
  br label %bb3
}

define void @zot(ptr align 8 dereferenceable_or_null(16) %arg, i32 %arg1) {
; CHECK-LABEL: @zot(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    ret void
;
bb:
  ret void
}