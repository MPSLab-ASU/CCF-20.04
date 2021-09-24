; ModuleID = 'pow.c'
source_filename = "pow.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-none-linux-eabi"

@.str = private unnamed_addr constant [24 x i8] c"***** %d^%d = %d *****\0A\00", align 1

; Function Attrs: nofree nounwind
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #0 !dbg !14 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !18, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata i8** %1, metadata !19, metadata !DIExpression()), !dbg !24
  %3 = getelementptr inbounds i8*, i8** %1, i32 1, !dbg !25
  %4 = load i8*, i8** %3, align 4, !dbg !25, !tbaa !26
  call void @llvm.dbg.value(metadata i8* %4, metadata !30, metadata !DIExpression()) #4, !dbg !38
  %5 = tail call i32 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #4, !dbg !40
  call void @llvm.dbg.value(metadata i32 %5, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata i32 1, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata i32 1, metadata !22, metadata !DIExpression()), !dbg !41
  %6 = icmp sgt i32 %5, 1, !dbg !42
  br i1 %6, label %10, label %7, !dbg !44

7:                                                ; preds = %10, %2
  %8 = phi i32 [ 1, %2 ], [ %13, %10 ], !dbg !24
  %9 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i32 2, i32 %5, i32 %8), !dbg !45
  ret i32 0, !dbg !46

10:                                               ; preds = %2, %10
  %11 = phi i32 [ %14, %10 ], [ 1, %2 ]
  %12 = phi i32 [ %13, %10 ], [ 1, %2 ]
  call void @llvm.dbg.value(metadata i32 %11, metadata !22, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 %12, metadata !21, metadata !DIExpression()), !dbg !24
  %13 = shl nsw i32 %12, 1, !dbg !47
  call void @llvm.dbg.value(metadata i32 %13, metadata !21, metadata !DIExpression()), !dbg !24
  %14 = add nuw nsw i32 %11, 1, !dbg !48
  call void @llvm.dbg.value(metadata i32 %14, metadata !22, metadata !DIExpression()), !dbg !41
  %15 = icmp eq i32 %14, %5, !dbg !42
  br i1 %15, label %7, label %10, !dbg !44, !llvm.loop !49
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree nounwind willreturn
declare dso_local i32 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #1 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #2 = { nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (https://github.com/MPSLab-ASU/CCF-20.04/ 05285de7579f417a4d73ad832b8f4cc497f25235)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "pow.c", directory: "/home/local/ASUAD/quoclon1/publish_ccf_github/benchmarks/pow")
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
!14 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 14, type: !15, scopeLine: 15, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4, !5}
!17 = !{!18, !19, !20, !21, !22}
!18 = !DILocalVariable(name: "argc", arg: 1, scope: !14, file: !1, line: 14, type: !4)
!19 = !DILocalVariable(name: "argv", arg: 2, scope: !14, file: !1, line: 14, type: !5)
!20 = !DILocalVariable(name: "pow", scope: !14, file: !1, line: 16, type: !4)
!21 = !DILocalVariable(name: "ret", scope: !14, file: !1, line: 17, type: !4)
!22 = !DILocalVariable(name: "i", scope: !23, file: !1, line: 21, type: !4)
!23 = distinct !DILexicalBlock(scope: !14, file: !1, line: 21, column: 3)
!24 = !DILocation(line: 0, scope: !14)
!25 = !DILocation(line: 16, column: 18, scope: !14)
!26 = !{!27, !27, i64 0}
!27 = !{!"any pointer", !28, i64 0}
!28 = !{!"omnipotent char", !29, i64 0}
!29 = !{!"Simple C/C++ TBAA"}
!30 = !DILocalVariable(name: "__nptr", arg: 1, scope: !31, file: !32, line: 361, type: !35)
!31 = distinct !DISubprogram(name: "atoi", scope: !32, file: !32, line: 361, type: !33, scopeLine: 362, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !37)
!32 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/stdlib.h", directory: "")
!33 = !DISubroutineType(types: !34)
!34 = !{!4, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 32)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!37 = !{!30}
!38 = !DILocation(line: 0, scope: !31, inlinedAt: !39)
!39 = distinct !DILocation(line: 16, column: 13, scope: !14)
!40 = !DILocation(line: 363, column: 16, scope: !31, inlinedAt: !39)
!41 = !DILocation(line: 0, scope: !23)
!42 = !DILocation(line: 21, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !23, file: !1, line: 21, column: 3)
!44 = !DILocation(line: 21, column: 3, scope: !23)
!45 = !DILocation(line: 24, column: 3, scope: !14)
!46 = !DILocation(line: 26, column: 1, scope: !14)
!47 = !DILocation(line: 22, column: 9, scope: !43)
!48 = !DILocation(line: 21, column: 28, scope: !43)
!49 = distinct !{!49, !44, !50, !51, !52, !53}
!50 = !DILocation(line: 22, column: 12, scope: !23)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !{!"llvm.loop.CGRA.enable"}
!53 = !{!"llvm.loop.unroll.disable"}
