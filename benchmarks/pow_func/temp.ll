; ModuleID = 'pow.c'
source_filename = "pow.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-none-linux-eabi"

@.str = private unnamed_addr constant [22 x i8] c"Base = %d - Pow = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"***** %d^%d = %d *****\0A\00", align 1

; Function Attrs: nofree nounwind
define dso_local i32 @power(i32 %0, i32 %1) local_unnamed_addr #0 !dbg !14 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !18, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %1, metadata !19, metadata !DIExpression()), !dbg !23
  %3 = icmp eq i32 %1, 0, !dbg !24
  br i1 %3, label %35, label %4, !dbg !26

4:                                                ; preds = %2
  %5 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), i32 %0, i32 %1), !dbg !27
  call void @llvm.dbg.value(metadata i32 %0, metadata !20, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 1, metadata !21, metadata !DIExpression()), !dbg !28
  %6 = icmp sgt i32 %1, 2, !dbg !29
  br i1 %6, label %7, label %35, !dbg !31

7:                                                ; preds = %4
  %8 = add nsw i32 %1, -1, !dbg !31
  %9 = add i32 %1, -2, !dbg !31
  %10 = icmp ult i32 %9, 4, !dbg !31
  br i1 %10, label %26, label %11, !dbg !31

11:                                               ; preds = %7
  %12 = and i32 %9, -4, !dbg !31
  %13 = or i32 %12, 1, !dbg !31
  %14 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %0, i32 0, !dbg !31
  %15 = insertelement <4 x i32> poison, i32 %0, i32 0, !dbg !31
  %16 = shufflevector <4 x i32> %15, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !31
  br label %17, !dbg !31

17:                                               ; preds = %17, %11
  %18 = phi i32 [ 0, %11 ], [ %21, %17 ]
  %19 = phi <4 x i32> [ %14, %11 ], [ %20, %17 ]
  %20 = mul <4 x i32> %19, %16, !dbg !32
  %21 = add i32 %18, 4
  %22 = icmp eq i32 %21, %12
  br i1 %22, label %23, label %17, !llvm.loop !33

23:                                               ; preds = %17
  %24 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %20), !dbg !31
  %25 = icmp eq i32 %9, %12, !dbg !31
  br i1 %25, label %35, label %26, !dbg !31

26:                                               ; preds = %7, %23
  %27 = phi i32 [ 1, %7 ], [ %13, %23 ]
  %28 = phi i32 [ %0, %7 ], [ %24, %23 ]
  br label %29, !dbg !31

29:                                               ; preds = %26, %29
  %30 = phi i32 [ %33, %29 ], [ %27, %26 ]
  %31 = phi i32 [ %32, %29 ], [ %28, %26 ]
  call void @llvm.dbg.value(metadata i32 %30, metadata !21, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 %31, metadata !20, metadata !DIExpression()), !dbg !23
  %32 = mul nsw i32 %31, %0, !dbg !32
  call void @llvm.dbg.value(metadata i32 %32, metadata !20, metadata !DIExpression()), !dbg !23
  %33 = add nuw nsw i32 %30, 1, !dbg !39
  call void @llvm.dbg.value(metadata i32 %33, metadata !21, metadata !DIExpression()), !dbg !28
  %34 = icmp eq i32 %33, %8, !dbg !29
  br i1 %34, label %35, label %29, !dbg !31, !llvm.loop !40

35:                                               ; preds = %29, %23, %4, %2
  %36 = phi i32 [ 1, %2 ], [ %0, %4 ], [ %24, %23 ], [ %32, %29 ], !dbg !23
  ret i32 %36, !dbg !41
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #0 !dbg !42 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i8** %1, metadata !47, metadata !DIExpression()), !dbg !50
  %3 = getelementptr inbounds i8*, i8** %1, i32 1, !dbg !51
  %4 = load i8*, i8** %3, align 4, !dbg !51, !tbaa !52
  call void @llvm.dbg.value(metadata i8* %4, metadata !56, metadata !DIExpression()) #5, !dbg !64
  %5 = tail call i32 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #5, !dbg !66
  call void @llvm.dbg.value(metadata i32 %5, metadata !48, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i32 2, metadata !18, metadata !DIExpression()) #5, !dbg !67
  call void @llvm.dbg.value(metadata i32 %5, metadata !19, metadata !DIExpression()) #5, !dbg !67
  %6 = icmp eq i32 %5, 0, !dbg !69
  br i1 %6, label %18, label %7, !dbg !70

7:                                                ; preds = %2
  %8 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), i32 2, i32 %5) #5, !dbg !71
  call void @llvm.dbg.value(metadata i32 2, metadata !20, metadata !DIExpression()) #5, !dbg !67
  call void @llvm.dbg.value(metadata i32 1, metadata !21, metadata !DIExpression()) #5, !dbg !72
  %9 = icmp sgt i32 %5, 2, !dbg !73
  br i1 %9, label %10, label %18, !dbg !74

10:                                               ; preds = %7
  %11 = add nsw i32 %5, -1, !dbg !74
  br label %12, !dbg !74

12:                                               ; preds = %12, %10
  %13 = phi i32 [ %16, %12 ], [ 1, %10 ]
  %14 = phi i32 [ %15, %12 ], [ 2, %10 ]
  call void @llvm.dbg.value(metadata i32 %13, metadata !21, metadata !DIExpression()) #5, !dbg !72
  call void @llvm.dbg.value(metadata i32 %14, metadata !20, metadata !DIExpression()) #5, !dbg !67
  %15 = shl nsw i32 %14, 1, !dbg !75
  call void @llvm.dbg.value(metadata i32 %15, metadata !20, metadata !DIExpression()) #5, !dbg !67
  %16 = add nuw nsw i32 %13, 1, !dbg !76
  call void @llvm.dbg.value(metadata i32 %16, metadata !21, metadata !DIExpression()) #5, !dbg !72
  %17 = icmp eq i32 %16, %11, !dbg !73
  br i1 %17, label %18, label %12, !dbg !74, !llvm.loop !77

18:                                               ; preds = %12, %2, %7
  %19 = phi i32 [ 1, %2 ], [ 2, %7 ], [ %15, %12 ], !dbg !67
  call void @llvm.dbg.value(metadata i32 %19, metadata !49, metadata !DIExpression()), !dbg !50
  %20 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i32 0, i32 0), i32 2, i32 %5, i32 %19), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nofree nounwind willreturn
declare dso_local i32 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.mul.v4i32(<4 x i32>) #4

attributes #0 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #1 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #2 = { nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nofree nosync nounwind readnone willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (https://github.com/MPSLab-ASU/CCF-20.04/ 05285de7579f417a4d73ad832b8f4cc497f25235)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "pow.c", directory: "/home/local/ASUAD/quoclon1/publish_ccf_github/benchmarks/pow_func")
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 32)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 32)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 1, !"min_enum_size", i32 4}
!13 = !{!"clang version 13.0.0 (https://github.com/MPSLab-ASU/CCF-20.04/ 05285de7579f417a4d73ad832b8f4cc497f25235)"}
!14 = distinct !DISubprogram(name: "power", scope: !1, file: !1, line: 15, type: !15, scopeLine: 15, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4, !4}
!17 = !{!18, !19, !20, !21}
!18 = !DILocalVariable(name: "base", arg: 1, scope: !14, file: !1, line: 15, type: !4)
!19 = !DILocalVariable(name: "pow", arg: 2, scope: !14, file: !1, line: 15, type: !4)
!20 = !DILocalVariable(name: "ret", scope: !14, file: !1, line: 18, type: !4)
!21 = !DILocalVariable(name: "i", scope: !22, file: !1, line: 20, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 20, column: 3)
!23 = !DILocation(line: 0, scope: !14)
!24 = !DILocation(line: 16, column: 10, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !1, line: 16, column: 6)
!26 = !DILocation(line: 16, column: 6, scope: !14)
!27 = !DILocation(line: 17, column: 3, scope: !14)
!28 = !DILocation(line: 0, scope: !22)
!29 = !DILocation(line: 20, column: 20, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !1, line: 20, column: 3)
!31 = !DILocation(line: 20, column: 3, scope: !22)
!32 = !DILocation(line: 21, column: 9, scope: !30)
!33 = distinct !{!33, !31, !34, !35, !36, !37, !38}
!34 = !DILocation(line: 21, column: 12, scope: !22)
!35 = !{!"llvm.loop.mustprogress"}
!36 = !{!"llvm.loop.CGRA.enable"}
!37 = !{!"llvm.loop.unroll.disable"}
!38 = !{!"llvm.loop.isvectorized", i32 1}
!39 = !DILocation(line: 20, column: 32, scope: !30)
!40 = distinct !{!40, !31, !34, !35, !36, !37, !38}
!41 = !DILocation(line: 23, column: 1, scope: !14)
!42 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 25, type: !43, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !45)
!43 = !DISubroutineType(types: !44)
!44 = !{!4, !4, !5}
!45 = !{!46, !47, !48, !49}
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !1, line: 25, type: !4)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !1, line: 25, type: !5)
!48 = !DILocalVariable(name: "pow", scope: !42, file: !1, line: 27, type: !4)
!49 = !DILocalVariable(name: "ret", scope: !42, file: !1, line: 28, type: !4)
!50 = !DILocation(line: 0, scope: !42)
!51 = !DILocation(line: 27, column: 18, scope: !42)
!52 = !{!53, !53, i64 0}
!53 = !{!"any pointer", !54, i64 0}
!54 = !{!"omnipotent char", !55, i64 0}
!55 = !{!"Simple C/C++ TBAA"}
!56 = !DILocalVariable(name: "__nptr", arg: 1, scope: !57, file: !58, line: 361, type: !61)
!57 = distinct !DISubprogram(name: "atoi", scope: !58, file: !58, line: 361, type: !59, scopeLine: 362, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !63)
!58 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/stdlib.h", directory: "")
!59 = !DISubroutineType(types: !60)
!60 = !{!4, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 32)
!62 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!63 = !{!56}
!64 = !DILocation(line: 0, scope: !57, inlinedAt: !65)
!65 = distinct !DILocation(line: 27, column: 13, scope: !42)
!66 = !DILocation(line: 363, column: 16, scope: !57, inlinedAt: !65)
!67 = !DILocation(line: 0, scope: !14, inlinedAt: !68)
!68 = distinct !DILocation(line: 28, column: 13, scope: !42)
!69 = !DILocation(line: 16, column: 10, scope: !25, inlinedAt: !68)
!70 = !DILocation(line: 16, column: 6, scope: !14, inlinedAt: !68)
!71 = !DILocation(line: 17, column: 3, scope: !14, inlinedAt: !68)
!72 = !DILocation(line: 0, scope: !22, inlinedAt: !68)
!73 = !DILocation(line: 20, column: 20, scope: !30, inlinedAt: !68)
!74 = !DILocation(line: 20, column: 3, scope: !22, inlinedAt: !68)
!75 = !DILocation(line: 21, column: 9, scope: !30, inlinedAt: !68)
!76 = !DILocation(line: 20, column: 32, scope: !30, inlinedAt: !68)
!77 = distinct !{!77, !74, !78, !35, !36, !37}
!78 = !DILocation(line: 21, column: 12, scope: !22, inlinedAt: !68)
!79 = !DILocation(line: 31, column: 3, scope: !42)
!80 = !DILocation(line: 33, column: 1, scope: !42)
