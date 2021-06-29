; ModuleID = 'add.c'
source_filename = "add.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-none-linux-eabi"

@.str = private unnamed_addr constant [11 x i8] c"Mode = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"Len = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"1000011001111001 = %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"***** 2^%d = %d *****\0A\00", align 1
@str = private unnamed_addr constant [11 x i8] c"Power mode\00", align 1
@str.6 = private unnamed_addr constant [16 x i8] c"Bin to dec mode\00", align 1

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @pow(i32 %0, i32 %1) local_unnamed_addr #0 !dbg !14 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !18, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.value(metadata i32 %1, metadata !19, metadata !DIExpression()), !dbg !23
  %3 = icmp eq i32 %1, 0, !dbg !24
  br i1 %3, label %31, label %4, !dbg !26

4:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i32 0, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 %0, metadata !20, metadata !DIExpression()), !dbg !23
  %5 = icmp sgt i32 %1, 0, !dbg !28
  br i1 %5, label %6, label %31, !dbg !30

6:                                                ; preds = %4
  %7 = icmp ult i32 %1, 4, !dbg !30
  br i1 %7, label %22, label %8, !dbg !30

8:                                                ; preds = %6
  %9 = and i32 %1, -4, !dbg !30
  %10 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %0, i32 0, !dbg !30
  %11 = insertelement <4 x i32> poison, i32 %0, i32 0, !dbg !30
  %12 = shufflevector <4 x i32> %11, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !30
  br label %13, !dbg !30

13:                                               ; preds = %13, %8
  %14 = phi i32 [ 0, %8 ], [ %17, %13 ], !dbg !31
  %15 = phi <4 x i32> [ %10, %8 ], [ %16, %13 ]
  %16 = mul <4 x i32> %15, %12, !dbg !32
  %17 = add i32 %14, 4, !dbg !31
  %18 = icmp eq i32 %17, %9, !dbg !31
  br i1 %18, label %19, label %13, !dbg !31, !llvm.loop !33

19:                                               ; preds = %13
  %20 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %16), !dbg !30
  %21 = icmp eq i32 %9, %1, !dbg !30
  br i1 %21, label %31, label %22, !dbg !30

22:                                               ; preds = %6, %19
  %23 = phi i32 [ 0, %6 ], [ %9, %19 ]
  %24 = phi i32 [ %0, %6 ], [ %20, %19 ]
  br label %25, !dbg !30

25:                                               ; preds = %22, %25
  %26 = phi i32 [ %29, %25 ], [ %23, %22 ]
  %27 = phi i32 [ %28, %25 ], [ %24, %22 ]
  call void @llvm.dbg.value(metadata i32 %26, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 %27, metadata !20, metadata !DIExpression()), !dbg !23
  %28 = mul nsw i32 %27, %0, !dbg !32
  call void @llvm.dbg.value(metadata i32 %28, metadata !20, metadata !DIExpression()), !dbg !23
  %29 = add nuw nsw i32 %26, 1, !dbg !31
  call void @llvm.dbg.value(metadata i32 %29, metadata !21, metadata !DIExpression()), !dbg !27
  %30 = icmp eq i32 %29, %1, !dbg !28
  br i1 %30, label %31, label %25, !dbg !30, !llvm.loop !38

31:                                               ; preds = %25, %19, %4, %2
  %32 = phi i32 [ 1, %2 ], [ %0, %4 ], [ %20, %19 ], [ %28, %25 ], !dbg !23
  ret i32 %32, !dbg !39
}

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @power(i32 %0, i32 %1) local_unnamed_addr #0 !dbg !40 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i32 %1, metadata !43, metadata !DIExpression()), !dbg !47
  %3 = icmp eq i32 %1, 0, !dbg !48
  br i1 %3, label %33, label %4, !dbg !50

4:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i32 0, metadata !45, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 %0, metadata !44, metadata !DIExpression()), !dbg !47
  %5 = icmp sgt i32 %1, 1, !dbg !52
  br i1 %5, label %6, label %33, !dbg !54

6:                                                ; preds = %4
  %7 = add nsw i32 %1, -1, !dbg !54
  %8 = add i32 %1, -1, !dbg !54
  %9 = icmp ult i32 %8, 4, !dbg !54
  br i1 %9, label %24, label %10, !dbg !54

10:                                               ; preds = %6
  %11 = and i32 %8, -4, !dbg !54
  %12 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %0, i32 0, !dbg !54
  %13 = insertelement <4 x i32> poison, i32 %0, i32 0, !dbg !54
  %14 = shufflevector <4 x i32> %13, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !54
  br label %15, !dbg !54

15:                                               ; preds = %15, %10
  %16 = phi i32 [ 0, %10 ], [ %19, %15 ], !dbg !55
  %17 = phi <4 x i32> [ %12, %10 ], [ %18, %15 ]
  %18 = mul <4 x i32> %17, %14, !dbg !56
  %19 = add i32 %16, 4, !dbg !55
  %20 = icmp eq i32 %19, %11, !dbg !55
  br i1 %20, label %21, label %15, !dbg !55, !llvm.loop !57

21:                                               ; preds = %15
  %22 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %18), !dbg !54
  %23 = icmp eq i32 %8, %11, !dbg !54
  br i1 %23, label %33, label %24, !dbg !54

24:                                               ; preds = %6, %21
  %25 = phi i32 [ 0, %6 ], [ %11, %21 ]
  %26 = phi i32 [ %0, %6 ], [ %22, %21 ]
  br label %27, !dbg !54

27:                                               ; preds = %24, %27
  %28 = phi i32 [ %31, %27 ], [ %25, %24 ]
  %29 = phi i32 [ %30, %27 ], [ %26, %24 ]
  call void @llvm.dbg.value(metadata i32 %28, metadata !45, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 %29, metadata !44, metadata !DIExpression()), !dbg !47
  %30 = mul nsw i32 %29, %0, !dbg !56
  call void @llvm.dbg.value(metadata i32 %30, metadata !44, metadata !DIExpression()), !dbg !47
  %31 = add nuw nsw i32 %28, 1, !dbg !55
  call void @llvm.dbg.value(metadata i32 %31, metadata !45, metadata !DIExpression()), !dbg !51
  %32 = icmp eq i32 %31, %7, !dbg !52
  br i1 %32, label %33, label %27, !dbg !54, !llvm.loop !60

33:                                               ; preds = %27, %21, %4, %2
  %34 = phi i32 [ 1, %2 ], [ %0, %4 ], [ %22, %21 ], [ %30, %27 ], !dbg !47
  ret i32 %34, !dbg !61
}

; Function Attrs: norecurse nounwind readonly
define dso_local i32 @bin_2_dec(i8* nocapture readonly %0, i32 %1) local_unnamed_addr #1 !dbg !62 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !66, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata i32 %1, metadata !67, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata i32 0, metadata !68, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata i32 %1, metadata !69, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !72
  call void @llvm.dbg.value(metadata i32 %1, metadata !69, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !72
  %3 = icmp sgt i32 %1, 0, !dbg !73
  br i1 %3, label %6, label %4, !dbg !75

4:                                                ; preds = %28, %16, %2
  %5 = phi i32 [ 0, %2 ], [ %17, %16 ], [ %30, %28 ], !dbg !71
  ret i32 %5, !dbg !76

6:                                                ; preds = %2, %28
  %7 = phi i32 [ %9, %28 ], [ %1, %2 ]
  %8 = phi i32 [ %30, %28 ], [ 0, %2 ]
  %9 = add nsw i32 %7, -1, !dbg !72
  call void @llvm.dbg.value(metadata i32 %8, metadata !68, metadata !DIExpression()), !dbg !71
  %10 = sub nuw nsw i32 %1, %7, !dbg !77
  %11 = getelementptr inbounds i8, i8* %0, i32 %10, !dbg !78
  %12 = load i8, i8* %11, align 1, !dbg !78, !tbaa !79
  %13 = icmp eq i8 %12, 49, !dbg !82
  br i1 %13, label %14, label %28, !dbg !83

14:                                               ; preds = %6
  call void @llvm.dbg.value(metadata i32 2, metadata !42, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 %9, metadata !43, metadata !DIExpression()), !dbg !84
  %15 = icmp eq i32 %9, 0, !dbg !86
  br i1 %15, label %16, label %18, !dbg !87

16:                                               ; preds = %14
  %17 = or i32 %8, 1, !dbg !88
  call void @llvm.dbg.value(metadata i32 undef, metadata !68, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata i32 %9, metadata !69, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !72
  br label %4, !dbg !75

18:                                               ; preds = %14
  call void @llvm.dbg.value(metadata i32 0, metadata !45, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.value(metadata i32 2, metadata !44, metadata !DIExpression()), !dbg !84
  %19 = icmp sgt i32 %7, 2, !dbg !90
  br i1 %19, label %20, label %28, !dbg !91

20:                                               ; preds = %18
  %21 = add nsw i32 %7, -2, !dbg !91
  br label %22, !dbg !91

22:                                               ; preds = %22, %20
  %23 = phi i32 [ %26, %22 ], [ 0, %20 ]
  %24 = phi i32 [ %25, %22 ], [ 2, %20 ]
  call void @llvm.dbg.value(metadata i32 %23, metadata !45, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.value(metadata i32 %24, metadata !44, metadata !DIExpression()), !dbg !84
  %25 = shl nsw i32 %24, 1, !dbg !92
  call void @llvm.dbg.value(metadata i32 %25, metadata !44, metadata !DIExpression()), !dbg !84
  %26 = add nuw nsw i32 %23, 1, !dbg !93
  call void @llvm.dbg.value(metadata i32 %26, metadata !45, metadata !DIExpression()), !dbg !89
  %27 = icmp eq i32 %26, %21, !dbg !90
  br i1 %27, label %28, label %22, !dbg !91, !llvm.loop !94

28:                                               ; preds = %22, %18, %6
  %29 = phi i32 [ 0, %6 ], [ 2, %18 ], [ %25, %22 ], !dbg !83
  %30 = add nsw i32 %29, %8, !dbg !88
  call void @llvm.dbg.value(metadata i32 %30, metadata !68, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata i32 %9, metadata !69, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !72
  %31 = icmp sgt i32 %7, 1, !dbg !73
  br i1 %31, label %6, label %4, !dbg !75, !llvm.loop !96
}

; Function Attrs: nofree nounwind
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #2 !dbg !98 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !102, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i8** %1, metadata !103, metadata !DIExpression()), !dbg !118
  %3 = getelementptr inbounds i8*, i8** %1, i32 1, !dbg !119
  %4 = load i8*, i8** %3, align 4, !dbg !119, !tbaa !120
  call void @llvm.dbg.value(metadata i8* %4, metadata !122, metadata !DIExpression()) #8, !dbg !130
  %5 = tail call i32 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #8, !dbg !132
  %6 = sdiv i32 %5, 100, !dbg !133
  call void @llvm.dbg.value(metadata i32 %6, metadata !104, metadata !DIExpression()), !dbg !118
  %7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %6), !dbg !134
  %8 = add i32 %5, -100, !dbg !135
  %9 = icmp ult i32 %8, 100, !dbg !135
  br i1 %9, label %10, label %46, !dbg !136

10:                                               ; preds = %2
  %11 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.6, i32 0, i32 0)), !dbg !137
  %12 = load i8*, i8** %3, align 4, !dbg !138, !tbaa !120
  call void @llvm.dbg.value(metadata i8* %12, metadata !122, metadata !DIExpression()) #8, !dbg !139
  %13 = tail call i32 @strtol(i8* nocapture nonnull %12, i8** null, i32 10) #8, !dbg !141
  %14 = add nsw i32 %13, -100, !dbg !142
  call void @llvm.dbg.value(metadata i32 %14, metadata !105, metadata !DIExpression()), !dbg !143
  %15 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i32 %14), !dbg !144
  call void @llvm.dbg.value(metadata i32 %14, metadata !67, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i32 0, metadata !68, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i32 %14, metadata !69, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !147
  call void @llvm.dbg.value(metadata i32 %14, metadata !69, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !147
  %16 = icmp sgt i32 %13, 100, !dbg !148
  br i1 %16, label %17, label %43, !dbg !149

17:                                               ; preds = %10, %39
  %18 = phi i32 [ %20, %39 ], [ %14, %10 ]
  %19 = phi i32 [ %41, %39 ], [ 0, %10 ]
  %20 = add nsw i32 %18, -1, !dbg !147
  call void @llvm.dbg.value(metadata i32 %19, metadata !68, metadata !DIExpression()), !dbg !145
  %21 = sub nuw nsw i32 %14, %18, !dbg !150
  %22 = lshr i32 40545, %21, !dbg !151
  %23 = and i32 %22, 1, !dbg !151
  %24 = icmp eq i32 %23, 0, !dbg !151
  br i1 %24, label %39, label %25, !dbg !152

25:                                               ; preds = %17
  call void @llvm.dbg.value(metadata i32 2, metadata !42, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.value(metadata i32 %20, metadata !43, metadata !DIExpression()), !dbg !153
  %26 = icmp eq i32 %20, 0, !dbg !155
  br i1 %26, label %27, label %29, !dbg !156

27:                                               ; preds = %25
  %28 = or i32 %19, 1, !dbg !157
  call void @llvm.dbg.value(metadata i32 undef, metadata !68, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i32 %20, metadata !69, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !147
  br label %43, !dbg !149

29:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i32 0, metadata !45, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.value(metadata i32 2, metadata !44, metadata !DIExpression()), !dbg !153
  %30 = icmp sgt i32 %18, 2, !dbg !159
  br i1 %30, label %31, label %39, !dbg !160

31:                                               ; preds = %29
  %32 = add nsw i32 %18, -2, !dbg !160
  br label %33, !dbg !160

33:                                               ; preds = %33, %31
  %34 = phi i32 [ %37, %33 ], [ 0, %31 ]
  %35 = phi i32 [ %36, %33 ], [ 2, %31 ]
  call void @llvm.dbg.value(metadata i32 %34, metadata !45, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.value(metadata i32 %35, metadata !44, metadata !DIExpression()), !dbg !153
  %36 = shl nsw i32 %35, 1, !dbg !161
  call void @llvm.dbg.value(metadata i32 %36, metadata !44, metadata !DIExpression()), !dbg !153
  %37 = add nuw nsw i32 %34, 1, !dbg !162
  call void @llvm.dbg.value(metadata i32 %37, metadata !45, metadata !DIExpression()), !dbg !158
  %38 = icmp eq i32 %37, %32, !dbg !159
  br i1 %38, label %39, label %33, !dbg !160, !llvm.loop !163

39:                                               ; preds = %33, %29, %17
  %40 = phi i32 [ 0, %17 ], [ 2, %29 ], [ %36, %33 ], !dbg !152
  %41 = add nsw i32 %40, %19, !dbg !157
  call void @llvm.dbg.value(metadata i32 %41, metadata !68, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i32 %20, metadata !69, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !147
  %42 = icmp sgt i32 %18, 1, !dbg !148
  br i1 %42, label %17, label %43, !dbg !149, !llvm.loop !165

43:                                               ; preds = %39, %10, %27
  %44 = phi i32 [ 0, %10 ], [ %28, %27 ], [ %41, %39 ], !dbg !145
  call void @llvm.dbg.value(metadata i32 %44, metadata !112, metadata !DIExpression()), !dbg !143
  %45 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i32 %44), !dbg !167
  br label %69, !dbg !168

46:                                               ; preds = %2
  %47 = add i32 %5, 99, !dbg !169
  %48 = icmp ult i32 %47, 199, !dbg !169
  br i1 %48, label %69, label %49, !dbg !170

49:                                               ; preds = %46
  %50 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str, i32 0, i32 0)), !dbg !171
  %51 = load i8*, i8** %3, align 4, !dbg !172, !tbaa !120
  call void @llvm.dbg.value(metadata i8* %51, metadata !122, metadata !DIExpression()) #8, !dbg !173
  %52 = tail call i32 @strtol(i8* nocapture nonnull %51, i8** null, i32 10) #8, !dbg !175
  %53 = mul nsw i32 %6, -100, !dbg !176
  %54 = add i32 %52, %53, !dbg !177
  call void @llvm.dbg.value(metadata i32 %54, metadata !114, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 2, metadata !42, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.value(metadata i32 %54, metadata !43, metadata !DIExpression()), !dbg !179
  %55 = icmp eq i32 %54, 0, !dbg !181
  br i1 %55, label %66, label %56, !dbg !182

56:                                               ; preds = %49
  call void @llvm.dbg.value(metadata i32 0, metadata !45, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.value(metadata i32 2, metadata !44, metadata !DIExpression()), !dbg !179
  %57 = icmp sgt i32 %54, 1, !dbg !184
  br i1 %57, label %58, label %66, !dbg !185

58:                                               ; preds = %56
  %59 = add nsw i32 %54, -1, !dbg !185
  br label %60, !dbg !185

60:                                               ; preds = %60, %58
  %61 = phi i32 [ %64, %60 ], [ 0, %58 ]
  %62 = phi i32 [ %63, %60 ], [ 2, %58 ]
  call void @llvm.dbg.value(metadata i32 %61, metadata !45, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.value(metadata i32 %62, metadata !44, metadata !DIExpression()), !dbg !179
  %63 = shl nsw i32 %62, 1, !dbg !186
  call void @llvm.dbg.value(metadata i32 %63, metadata !44, metadata !DIExpression()), !dbg !179
  %64 = add nuw nsw i32 %61, 1, !dbg !187
  call void @llvm.dbg.value(metadata i32 %64, metadata !45, metadata !DIExpression()), !dbg !183
  %65 = icmp eq i32 %64, %59, !dbg !184
  br i1 %65, label %66, label %60, !dbg !185, !llvm.loop !188

66:                                               ; preds = %60, %49, %56
  %67 = phi i32 [ 1, %49 ], [ 2, %56 ], [ %63, %60 ], !dbg !179
  call void @llvm.dbg.value(metadata i32 %67, metadata !117, metadata !DIExpression()), !dbg !178
  %68 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i32 %54, i32 %67), !dbg !190
  br label %69, !dbg !191

69:                                               ; preds = %46, %66, %43
  ret i32 0, !dbg !192
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind willreturn
declare dso_local i32 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #6

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.mul.v4i32(<4 x i32>) #7

attributes #0 = { norecurse nounwind readnone "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #1 = { norecurse nounwind readonly "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #2 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #3 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #4 = { nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nofree nounwind }
attributes #7 = { nofree nosync nounwind readnone willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (https://github.com/MPSLab-ASU/CCF-20.04/ 69d7c3299a1e6f5d4e7173a82d1ebc6a79ac1477)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "add.c", directory: "/home/local/ASUAD/quoclon1/ccf2_git/CCF-20.04/benchmarks/math")
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
!13 = !{!"clang version 13.0.0 (https://github.com/MPSLab-ASU/CCF-20.04/ 69d7c3299a1e6f5d4e7173a82d1ebc6a79ac1477)"}
!14 = distinct !DISubprogram(name: "pow", scope: !1, file: !1, line: 4, type: !15, scopeLine: 4, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4, !4}
!17 = !{!18, !19, !20, !21}
!18 = !DILocalVariable(name: "base", arg: 1, scope: !14, file: !1, line: 4, type: !4)
!19 = !DILocalVariable(name: "pow", arg: 2, scope: !14, file: !1, line: 4, type: !4)
!20 = !DILocalVariable(name: "ret", scope: !14, file: !1, line: 6, type: !4)
!21 = !DILocalVariable(name: "i", scope: !22, file: !1, line: 8, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 8, column: 3)
!23 = !DILocation(line: 0, scope: !14)
!24 = !DILocation(line: 5, column: 10, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !1, line: 5, column: 6)
!26 = !DILocation(line: 5, column: 6, scope: !14)
!27 = !DILocation(line: 0, scope: !22)
!28 = !DILocation(line: 8, column: 20, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !1, line: 8, column: 3)
!30 = !DILocation(line: 8, column: 3, scope: !22)
!31 = !DILocation(line: 8, column: 28, scope: !29)
!32 = !DILocation(line: 9, column: 9, scope: !29)
!33 = distinct !{!33, !30, !34, !35, !36, !37}
!34 = !DILocation(line: 9, column: 12, scope: !22)
!35 = !{!"llvm.loop.mustprogress"}
!36 = !{!"llvm.loop.unroll.disable"}
!37 = !{!"llvm.loop.isvectorized", i32 1}
!38 = distinct !{!38, !30, !34, !35, !36, !37}
!39 = !DILocation(line: 11, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "power", scope: !1, file: !1, line: 13, type: !15, scopeLine: 13, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !41)
!41 = !{!42, !43, !44, !45}
!42 = !DILocalVariable(name: "base", arg: 1, scope: !40, file: !1, line: 13, type: !4)
!43 = !DILocalVariable(name: "pow", arg: 2, scope: !40, file: !1, line: 13, type: !4)
!44 = !DILocalVariable(name: "ret", scope: !40, file: !1, line: 16, type: !4)
!45 = !DILocalVariable(name: "i", scope: !46, file: !1, line: 18, type: !4)
!46 = distinct !DILexicalBlock(scope: !40, file: !1, line: 18, column: 3)
!47 = !DILocation(line: 0, scope: !40)
!48 = !DILocation(line: 14, column: 10, scope: !49)
!49 = distinct !DILexicalBlock(scope: !40, file: !1, line: 14, column: 6)
!50 = !DILocation(line: 14, column: 6, scope: !40)
!51 = !DILocation(line: 0, scope: !46)
!52 = !DILocation(line: 18, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !46, file: !1, line: 18, column: 3)
!54 = !DILocation(line: 18, column: 3, scope: !46)
!55 = !DILocation(line: 18, column: 31, scope: !53)
!56 = !DILocation(line: 19, column: 9, scope: !53)
!57 = distinct !{!57, !54, !58, !35, !59, !36, !37}
!58 = !DILocation(line: 19, column: 12, scope: !46)
!59 = !{!"llvm.loop.CGRA.enable"}
!60 = distinct !{!60, !54, !58, !35, !59, !36, !37}
!61 = !DILocation(line: 21, column: 1, scope: !40)
!62 = distinct !DISubprogram(name: "bin_2_dec", scope: !1, file: !1, line: 23, type: !63, scopeLine: 23, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !65)
!63 = !DISubroutineType(types: !64)
!64 = !{!4, !6, !4}
!65 = !{!66, !67, !68, !69}
!66 = !DILocalVariable(name: "bin", arg: 1, scope: !62, file: !1, line: 23, type: !6)
!67 = !DILocalVariable(name: "len", arg: 2, scope: !62, file: !1, line: 23, type: !4)
!68 = !DILocalVariable(name: "ret", scope: !62, file: !1, line: 24, type: !4)
!69 = !DILocalVariable(name: "i", scope: !70, file: !1, line: 25, type: !4)
!70 = distinct !DILexicalBlock(scope: !62, file: !1, line: 25, column: 3)
!71 = !DILocation(line: 0, scope: !62)
!72 = !DILocation(line: 0, scope: !70)
!73 = !DILocation(line: 25, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 25, column: 3)
!75 = !DILocation(line: 25, column: 3, scope: !70)
!76 = !DILocation(line: 28, column: 3, scope: !62)
!77 = !DILocation(line: 26, column: 22, scope: !74)
!78 = !DILocation(line: 26, column: 13, scope: !74)
!79 = !{!80, !80, i64 0}
!80 = !{!"omnipotent char", !81, i64 0}
!81 = !{!"Simple C/C++ TBAA"}
!82 = !DILocation(line: 26, column: 26, scope: !74)
!83 = !DILocation(line: 26, column: 12, scope: !74)
!84 = !DILocation(line: 0, scope: !40, inlinedAt: !85)
!85 = distinct !DILocation(line: 26, column: 35, scope: !74)
!86 = !DILocation(line: 14, column: 10, scope: !49, inlinedAt: !85)
!87 = !DILocation(line: 14, column: 6, scope: !40, inlinedAt: !85)
!88 = !DILocation(line: 26, column: 9, scope: !74)
!89 = !DILocation(line: 0, scope: !46, inlinedAt: !85)
!90 = !DILocation(line: 18, column: 20, scope: !53, inlinedAt: !85)
!91 = !DILocation(line: 18, column: 3, scope: !46, inlinedAt: !85)
!92 = !DILocation(line: 19, column: 9, scope: !53, inlinedAt: !85)
!93 = !DILocation(line: 18, column: 31, scope: !53, inlinedAt: !85)
!94 = distinct !{!94, !91, !95, !35, !59, !36}
!95 = !DILocation(line: 19, column: 12, scope: !46, inlinedAt: !85)
!96 = distinct !{!96, !75, !97, !35, !36}
!97 = !DILocation(line: 26, column: 47, scope: !70)
!98 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 31, type: !99, scopeLine: 32, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !101)
!99 = !DISubroutineType(types: !100)
!100 = !{!4, !4, !5}
!101 = !{!102, !103, !104, !105, !108, !112, !114, !117}
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !1, line: 31, type: !4)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !1, line: 31, type: !5)
!104 = !DILocalVariable(name: "mode", scope: !98, file: !1, line: 53, type: !4)
!105 = !DILocalVariable(name: "len", scope: !106, file: !1, line: 58, type: !4)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 56, column: 16)
!107 = distinct !DILexicalBlock(scope: !98, file: !1, line: 56, column: 6)
!108 = !DILocalVariable(name: "bin", scope: !106, file: !1, line: 60, type: !109)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 136, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 17)
!112 = !DILocalVariable(name: "dec", scope: !106, file: !1, line: 61, type: !113)
!113 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!114 = !DILocalVariable(name: "p", scope: !115, file: !1, line: 71, type: !4)
!115 = distinct !DILexicalBlock(scope: !116, file: !1, line: 69, column: 23)
!116 = distinct !DILexicalBlock(scope: !107, file: !1, line: 69, column: 13)
!117 = !DILocalVariable(name: "ret", scope: !115, file: !1, line: 82, type: !4)
!118 = !DILocation(line: 0, scope: !98)
!119 = !DILocation(line: 53, column: 19, scope: !98)
!120 = !{!121, !121, i64 0}
!121 = !{!"any pointer", !80, i64 0}
!122 = !DILocalVariable(name: "__nptr", arg: 1, scope: !123, file: !124, line: 361, type: !127)
!123 = distinct !DISubprogram(name: "atoi", scope: !124, file: !124, line: 361, type: !125, scopeLine: 362, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !129)
!124 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/stdlib.h", directory: "")
!125 = !DISubroutineType(types: !126)
!126 = !{!4, !127}
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 32)
!128 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!129 = !{!122}
!130 = !DILocation(line: 0, scope: !123, inlinedAt: !131)
!131 = distinct !DILocation(line: 53, column: 14, scope: !98)
!132 = !DILocation(line: 363, column: 16, scope: !123, inlinedAt: !131)
!133 = !DILocation(line: 53, column: 27, scope: !98)
!134 = !DILocation(line: 54, column: 3, scope: !98)
!135 = !DILocation(line: 56, column: 11, scope: !107)
!136 = !DILocation(line: 56, column: 6, scope: !98)
!137 = !DILocation(line: 57, column: 5, scope: !106)
!138 = !DILocation(line: 58, column: 20, scope: !106)
!139 = !DILocation(line: 0, scope: !123, inlinedAt: !140)
!140 = distinct !DILocation(line: 58, column: 15, scope: !106)
!141 = !DILocation(line: 363, column: 16, scope: !123, inlinedAt: !140)
!142 = !DILocation(line: 58, column: 29, scope: !106)
!143 = !DILocation(line: 0, scope: !106)
!144 = !DILocation(line: 59, column: 5, scope: !106)
!145 = !DILocation(line: 0, scope: !62, inlinedAt: !146)
!146 = distinct !DILocation(line: 61, column: 20, scope: !106)
!147 = !DILocation(line: 0, scope: !70, inlinedAt: !146)
!148 = !DILocation(line: 25, column: 21, scope: !74, inlinedAt: !146)
!149 = !DILocation(line: 25, column: 3, scope: !70, inlinedAt: !146)
!150 = !DILocation(line: 26, column: 22, scope: !74, inlinedAt: !146)
!151 = !DILocation(line: 26, column: 26, scope: !74, inlinedAt: !146)
!152 = !DILocation(line: 26, column: 12, scope: !74, inlinedAt: !146)
!153 = !DILocation(line: 0, scope: !40, inlinedAt: !154)
!154 = distinct !DILocation(line: 26, column: 35, scope: !74, inlinedAt: !146)
!155 = !DILocation(line: 14, column: 10, scope: !49, inlinedAt: !154)
!156 = !DILocation(line: 14, column: 6, scope: !40, inlinedAt: !154)
!157 = !DILocation(line: 26, column: 9, scope: !74, inlinedAt: !146)
!158 = !DILocation(line: 0, scope: !46, inlinedAt: !154)
!159 = !DILocation(line: 18, column: 20, scope: !53, inlinedAt: !154)
!160 = !DILocation(line: 18, column: 3, scope: !46, inlinedAt: !154)
!161 = !DILocation(line: 19, column: 9, scope: !53, inlinedAt: !154)
!162 = !DILocation(line: 18, column: 31, scope: !53, inlinedAt: !154)
!163 = distinct !{!163, !160, !164, !35, !59, !36}
!164 = !DILocation(line: 19, column: 12, scope: !46, inlinedAt: !154)
!165 = distinct !{!165, !149, !166, !35, !36}
!166 = !DILocation(line: 26, column: 47, scope: !70, inlinedAt: !146)
!167 = !DILocation(line: 67, column: 5, scope: !106)
!168 = !DILocation(line: 69, column: 3, scope: !106)
!169 = !DILocation(line: 69, column: 18, scope: !116)
!170 = !DILocation(line: 69, column: 13, scope: !107)
!171 = !DILocation(line: 70, column: 5, scope: !115)
!172 = !DILocation(line: 71, column: 18, scope: !115)
!173 = !DILocation(line: 0, scope: !123, inlinedAt: !174)
!174 = distinct !DILocation(line: 71, column: 13, scope: !115)
!175 = !DILocation(line: 363, column: 16, scope: !123, inlinedAt: !174)
!176 = !DILocation(line: 71, column: 33, scope: !115)
!177 = !DILocation(line: 71, column: 27, scope: !115)
!178 = !DILocation(line: 0, scope: !115)
!179 = !DILocation(line: 0, scope: !40, inlinedAt: !180)
!180 = distinct !DILocation(line: 82, column: 15, scope: !115)
!181 = !DILocation(line: 14, column: 10, scope: !49, inlinedAt: !180)
!182 = !DILocation(line: 14, column: 6, scope: !40, inlinedAt: !180)
!183 = !DILocation(line: 0, scope: !46, inlinedAt: !180)
!184 = !DILocation(line: 18, column: 20, scope: !53, inlinedAt: !180)
!185 = !DILocation(line: 18, column: 3, scope: !46, inlinedAt: !180)
!186 = !DILocation(line: 19, column: 9, scope: !53, inlinedAt: !180)
!187 = !DILocation(line: 18, column: 31, scope: !53, inlinedAt: !180)
!188 = distinct !{!188, !185, !189, !35, !59, !36}
!189 = !DILocation(line: 19, column: 12, scope: !46, inlinedAt: !180)
!190 = !DILocation(line: 84, column: 5, scope: !115)
!191 = !DILocation(line: 85, column: 3, scope: !115)
!192 = !DILocation(line: 87, column: 1, scope: !98)
