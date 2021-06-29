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
  br i1 %3, label %40, label %4, !dbg !26

4:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i32 0, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 %0, metadata !20, metadata !DIExpression()), !dbg !23
  %5 = icmp sgt i32 %1, 0, !dbg !28
  br i1 %5, label %6, label %40, !dbg !30

6:                                                ; preds = %4
  %7 = add nsw i32 %1, -1
  %8 = icmp ult i32 %1, 4, !dbg !30
  br i1 %8, label %29, label %9, !dbg !30

9:                                                ; preds = %6
  %10 = and i32 %1, -4, !dbg !30
  %11 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %0, i32 0, !dbg !30
  %12 = insertelement <4 x i32> poison, i32 %7, i32 0, !dbg !30
  %13 = shufflevector <4 x i32> %12, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !30
  %14 = insertelement <4 x i32> poison, i32 %0, i32 0, !dbg !30
  %15 = shufflevector <4 x i32> %14, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !30
  br label %16, !dbg !30

16:                                               ; preds = %16, %9
  %17 = phi i32 [ 0, %9 ], [ %23, %16 ], !dbg !31
  %18 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %9 ], [ %24, %16 ]
  %19 = phi <4 x i32> [ %11, %9 ], [ %22, %16 ]
  %20 = icmp slt <4 x i32> %18, %13, !dbg !32
  %21 = select <4 x i1> %20, <4 x i32> %15, <4 x i32> <i32 1, i32 1, i32 1, i32 1>, !dbg !34
  %22 = mul <4 x i32> %21, %19, !dbg !34
  %23 = add i32 %17, 4, !dbg !31
  %24 = add <4 x i32> %18, <i32 4, i32 4, i32 4, i32 4>
  %25 = icmp eq i32 %23, %10, !dbg !31
  br i1 %25, label %26, label %16, !dbg !31, !llvm.loop !35

26:                                               ; preds = %16
  %27 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %22), !dbg !30
  %28 = icmp eq i32 %10, %1, !dbg !30
  br i1 %28, label %40, label %29, !dbg !30

29:                                               ; preds = %6, %26
  %30 = phi i32 [ 0, %6 ], [ %10, %26 ]
  %31 = phi i32 [ %0, %6 ], [ %27, %26 ]
  br label %32, !dbg !30

32:                                               ; preds = %29, %32
  %33 = phi i32 [ %38, %32 ], [ %30, %29 ]
  %34 = phi i32 [ %37, %32 ], [ %31, %29 ]
  call void @llvm.dbg.value(metadata i32 %33, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 %34, metadata !20, metadata !DIExpression()), !dbg !23
  %35 = icmp slt i32 %33, %7, !dbg !32
  %36 = select i1 %35, i32 %0, i32 1, !dbg !34
  %37 = mul nsw i32 %36, %34, !dbg !34
  call void @llvm.dbg.value(metadata i32 %37, metadata !20, metadata !DIExpression()), !dbg !23
  %38 = add nuw nsw i32 %33, 1, !dbg !31
  call void @llvm.dbg.value(metadata i32 %38, metadata !21, metadata !DIExpression()), !dbg !27
  %39 = icmp eq i32 %38, %1, !dbg !28
  br i1 %39, label %40, label %32, !dbg !30, !llvm.loop !41

40:                                               ; preds = %32, %26, %4, %2
  %41 = phi i32 [ 1, %2 ], [ %0, %4 ], [ %27, %26 ], [ %37, %32 ], !dbg !23
  ret i32 %41, !dbg !42
}

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @power(i32 %0, i32 %1) local_unnamed_addr #0 !dbg !43 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i32 %1, metadata !46, metadata !DIExpression()), !dbg !50
  %3 = icmp eq i32 %1, 0, !dbg !51
  br i1 %3, label %33, label %4, !dbg !53

4:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i32 0, metadata !48, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %0, metadata !47, metadata !DIExpression()), !dbg !50
  %5 = icmp sgt i32 %1, 1, !dbg !55
  br i1 %5, label %6, label %33, !dbg !57

6:                                                ; preds = %4
  %7 = add nsw i32 %1, -1, !dbg !57
  %8 = add i32 %1, -1, !dbg !57
  %9 = icmp ult i32 %8, 4, !dbg !57
  br i1 %9, label %24, label %10, !dbg !57

10:                                               ; preds = %6
  %11 = and i32 %8, -4, !dbg !57
  %12 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %0, i32 0, !dbg !57
  %13 = insertelement <4 x i32> poison, i32 %0, i32 0, !dbg !57
  %14 = shufflevector <4 x i32> %13, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !57
  br label %15, !dbg !57

15:                                               ; preds = %15, %10
  %16 = phi i32 [ 0, %10 ], [ %19, %15 ], !dbg !58
  %17 = phi <4 x i32> [ %12, %10 ], [ %18, %15 ]
  %18 = mul <4 x i32> %17, %14, !dbg !59
  %19 = add i32 %16, 4, !dbg !58
  %20 = icmp eq i32 %19, %11, !dbg !58
  br i1 %20, label %21, label %15, !dbg !58, !llvm.loop !60

21:                                               ; preds = %15
  %22 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %18), !dbg !57
  %23 = icmp eq i32 %8, %11, !dbg !57
  br i1 %23, label %33, label %24, !dbg !57

24:                                               ; preds = %6, %21
  %25 = phi i32 [ 0, %6 ], [ %11, %21 ]
  %26 = phi i32 [ %0, %6 ], [ %22, %21 ]
  br label %27, !dbg !57

27:                                               ; preds = %24, %27
  %28 = phi i32 [ %31, %27 ], [ %25, %24 ]
  %29 = phi i32 [ %30, %27 ], [ %26, %24 ]
  call void @llvm.dbg.value(metadata i32 %28, metadata !48, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %29, metadata !47, metadata !DIExpression()), !dbg !50
  %30 = mul nsw i32 %29, %0, !dbg !59
  call void @llvm.dbg.value(metadata i32 %30, metadata !47, metadata !DIExpression()), !dbg !50
  %31 = add nuw nsw i32 %28, 1, !dbg !58
  call void @llvm.dbg.value(metadata i32 %31, metadata !48, metadata !DIExpression()), !dbg !54
  %32 = icmp eq i32 %31, %7, !dbg !55
  br i1 %32, label %33, label %27, !dbg !57, !llvm.loop !62

33:                                               ; preds = %27, %21, %4, %2
  %34 = phi i32 [ 1, %2 ], [ %0, %4 ], [ %22, %21 ], [ %30, %27 ], !dbg !50
  ret i32 %34, !dbg !63
}

; Function Attrs: norecurse nounwind readonly
define dso_local i32 @bin_2_dec(i8* nocapture readonly %0, i32 %1) local_unnamed_addr #1 !dbg !64 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !68, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 %1, metadata !69, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 0, metadata !70, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 %1, metadata !71, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !74
  call void @llvm.dbg.value(metadata i32 %1, metadata !71, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !74
  %3 = icmp sgt i32 %1, 0, !dbg !75
  br i1 %3, label %6, label %4, !dbg !77

4:                                                ; preds = %55, %52, %2
  %5 = phi i32 [ 0, %2 ], [ %54, %52 ], [ %57, %55 ], !dbg !73
  ret i32 %5, !dbg !78

6:                                                ; preds = %2, %55
  %7 = phi i32 [ %59, %55 ], [ 0, %2 ]
  %8 = phi i32 [ %12, %55 ], [ %1, %2 ]
  %9 = phi i32 [ %57, %55 ], [ 0, %2 ]
  %10 = xor i32 %7, -1, !dbg !74
  %11 = add i32 %10, %1, !dbg !74
  %12 = add nsw i32 %8, -1, !dbg !74
  call void @llvm.dbg.value(metadata i32 %9, metadata !70, metadata !DIExpression()), !dbg !73
  %13 = sub nuw nsw i32 %1, %8, !dbg !79
  %14 = getelementptr inbounds i8, i8* %0, i32 %13, !dbg !80
  %15 = load i8, i8* %14, align 1, !dbg !80, !tbaa !81
  %16 = icmp eq i8 %15, 49, !dbg !84
  br i1 %16, label %17, label %55, !dbg !85

17:                                               ; preds = %6
  call void @llvm.dbg.value(metadata i32 2, metadata !18, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.value(metadata i32 %12, metadata !19, metadata !DIExpression()), !dbg !86
  %18 = icmp eq i32 %12, 0, !dbg !88
  br i1 %18, label %52, label %19, !dbg !89

19:                                               ; preds = %17
  call void @llvm.dbg.value(metadata i32 0, metadata !21, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i32 2, metadata !20, metadata !DIExpression()), !dbg !86
  %20 = icmp sgt i32 %8, 1, !dbg !91
  br i1 %20, label %21, label %52, !dbg !92

21:                                               ; preds = %19
  %22 = add nsw i32 %8, -2
  %23 = icmp ult i32 %11, 4, !dbg !92
  br i1 %23, label %41, label %24, !dbg !92

24:                                               ; preds = %21
  %25 = and i32 %11, -4, !dbg !92
  %26 = insertelement <4 x i32> poison, i32 %22, i32 0, !dbg !92
  %27 = shufflevector <4 x i32> %26, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !92
  br label %28, !dbg !92

28:                                               ; preds = %28, %24
  %29 = phi i32 [ 0, %24 ], [ %35, %28 ], !dbg !93
  %30 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %24 ], [ %36, %28 ]
  %31 = phi <4 x i32> [ <i32 2, i32 1, i32 1, i32 1>, %24 ], [ %34, %28 ]
  %32 = icmp slt <4 x i32> %30, %27, !dbg !94
  %33 = select <4 x i1> %32, <4 x i32> <i32 2, i32 2, i32 2, i32 2>, <4 x i32> <i32 1, i32 1, i32 1, i32 1>, !dbg !95
  %34 = mul <4 x i32> %33, %31, !dbg !95
  %35 = add i32 %29, 4, !dbg !93
  %36 = add <4 x i32> %30, <i32 4, i32 4, i32 4, i32 4>
  %37 = icmp eq i32 %35, %25, !dbg !93
  br i1 %37, label %38, label %28, !dbg !93, !llvm.loop !96

38:                                               ; preds = %28
  %39 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %34), !dbg !92
  %40 = icmp eq i32 %11, %25, !dbg !92
  br i1 %40, label %55, label %41, !dbg !92

41:                                               ; preds = %21, %38
  %42 = phi i32 [ 0, %21 ], [ %25, %38 ]
  %43 = phi i32 [ 2, %21 ], [ %39, %38 ]
  br label %44, !dbg !92

44:                                               ; preds = %41, %44
  %45 = phi i32 [ %50, %44 ], [ %42, %41 ]
  %46 = phi i32 [ %49, %44 ], [ %43, %41 ]
  call void @llvm.dbg.value(metadata i32 %45, metadata !21, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i32 %46, metadata !20, metadata !DIExpression()), !dbg !86
  %47 = icmp slt i32 %45, %22, !dbg !94
  %48 = select i1 %47, i32 2, i32 1, !dbg !95
  %49 = mul nsw i32 %48, %46, !dbg !95
  call void @llvm.dbg.value(metadata i32 %49, metadata !20, metadata !DIExpression()), !dbg !86
  %50 = add nuw nsw i32 %45, 1, !dbg !93
  call void @llvm.dbg.value(metadata i32 %50, metadata !21, metadata !DIExpression()), !dbg !90
  %51 = icmp eq i32 %50, %12, !dbg !91
  br i1 %51, label %55, label %44, !dbg !92, !llvm.loop !98

52:                                               ; preds = %19, %17
  %53 = phi i32 [ 2, %19 ], [ 1, %17 ]
  %54 = add nsw i32 %53, %9, !dbg !99
  call void @llvm.dbg.value(metadata i32 undef, metadata !70, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 %12, metadata !71, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !74
  br label %4, !dbg !77

55:                                               ; preds = %44, %38, %6
  %56 = phi i32 [ 0, %6 ], [ %39, %38 ], [ %49, %44 ], !dbg !85
  %57 = add nsw i32 %56, %9, !dbg !99
  call void @llvm.dbg.value(metadata i32 %57, metadata !70, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 %12, metadata !71, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !74
  %58 = icmp sgt i32 %8, 1, !dbg !75
  %59 = add i32 %7, 1, !dbg !77
  br i1 %58, label %6, label %4, !dbg !77, !llvm.loop !100
}

; Function Attrs: nofree nounwind
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #2 !dbg !102 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !106, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.value(metadata i8** %1, metadata !107, metadata !DIExpression()), !dbg !122
  %3 = getelementptr inbounds i8*, i8** %1, i32 1, !dbg !123
  %4 = load i8*, i8** %3, align 4, !dbg !123, !tbaa !124
  call void @llvm.dbg.value(metadata i8* %4, metadata !126, metadata !DIExpression()) #8, !dbg !134
  %5 = tail call i32 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #8, !dbg !136
  %6 = sdiv i32 %5, 100, !dbg !137
  call void @llvm.dbg.value(metadata i32 %6, metadata !108, metadata !DIExpression()), !dbg !122
  %7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %6), !dbg !138
  %8 = add i32 %5, -100, !dbg !139
  %9 = icmp ult i32 %8, 100, !dbg !139
  br i1 %9, label %10, label %75, !dbg !140

10:                                               ; preds = %2
  %11 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.6, i32 0, i32 0)), !dbg !141
  %12 = load i8*, i8** %3, align 4, !dbg !142, !tbaa !124
  call void @llvm.dbg.value(metadata i8* %12, metadata !126, metadata !DIExpression()) #8, !dbg !143
  %13 = tail call i32 @strtol(i8* nocapture nonnull %12, i8** null, i32 10) #8, !dbg !145
  %14 = add nsw i32 %13, -100, !dbg !146
  call void @llvm.dbg.value(metadata i32 %14, metadata !109, metadata !DIExpression()), !dbg !147
  %15 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i32 %14), !dbg !148
  call void @llvm.dbg.value(metadata i32 %14, metadata !69, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata i32 0, metadata !70, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata i32 %14, metadata !71, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !151
  call void @llvm.dbg.value(metadata i32 %14, metadata !71, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !151
  %16 = icmp sgt i32 %13, 100, !dbg !152
  br i1 %16, label %17, label %72, !dbg !153

17:                                               ; preds = %10
  %18 = add i32 %13, -101, !dbg !153
  br label %19, !dbg !153

19:                                               ; preds = %17, %67
  %20 = phi i32 [ 0, %17 ], [ %71, %67 ]
  %21 = phi i32 [ %14, %17 ], [ %24, %67 ]
  %22 = phi i32 [ 0, %17 ], [ %69, %67 ]
  %23 = sub i32 %18, %20, !dbg !151
  %24 = add nsw i32 %21, -1, !dbg !151
  call void @llvm.dbg.value(metadata i32 %22, metadata !70, metadata !DIExpression()), !dbg !149
  %25 = sub nuw nsw i32 %14, %21, !dbg !154
  %26 = lshr i32 40545, %25, !dbg !155
  %27 = and i32 %26, 1, !dbg !155
  %28 = icmp eq i32 %27, 0, !dbg !155
  br i1 %28, label %67, label %29, !dbg !156

29:                                               ; preds = %19
  call void @llvm.dbg.value(metadata i32 2, metadata !18, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.value(metadata i32 %24, metadata !19, metadata !DIExpression()), !dbg !157
  %30 = icmp eq i32 %24, 0, !dbg !159
  br i1 %30, label %64, label %31, !dbg !160

31:                                               ; preds = %29
  call void @llvm.dbg.value(metadata i32 0, metadata !21, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.value(metadata i32 2, metadata !20, metadata !DIExpression()), !dbg !157
  %32 = icmp sgt i32 %21, 1, !dbg !162
  br i1 %32, label %33, label %64, !dbg !163

33:                                               ; preds = %31
  %34 = add nsw i32 %21, -2
  %35 = icmp ult i32 %23, 4, !dbg !163
  br i1 %35, label %53, label %36, !dbg !163

36:                                               ; preds = %33
  %37 = and i32 %23, -4, !dbg !163
  %38 = insertelement <4 x i32> poison, i32 %34, i32 0, !dbg !163
  %39 = shufflevector <4 x i32> %38, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !163
  br label %40, !dbg !163

40:                                               ; preds = %40, %36
  %41 = phi i32 [ 0, %36 ], [ %47, %40 ], !dbg !164
  %42 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %36 ], [ %48, %40 ]
  %43 = phi <4 x i32> [ <i32 2, i32 1, i32 1, i32 1>, %36 ], [ %46, %40 ]
  %44 = icmp slt <4 x i32> %42, %39, !dbg !165
  %45 = select <4 x i1> %44, <4 x i32> <i32 2, i32 2, i32 2, i32 2>, <4 x i32> <i32 1, i32 1, i32 1, i32 1>, !dbg !166
  %46 = mul <4 x i32> %45, %43, !dbg !166
  %47 = add i32 %41, 4, !dbg !164
  %48 = add <4 x i32> %42, <i32 4, i32 4, i32 4, i32 4>
  %49 = icmp eq i32 %47, %37, !dbg !164
  br i1 %49, label %50, label %40, !dbg !164, !llvm.loop !167

50:                                               ; preds = %40
  %51 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %46), !dbg !163
  %52 = icmp eq i32 %23, %37, !dbg !163
  br i1 %52, label %67, label %53, !dbg !163

53:                                               ; preds = %33, %50
  %54 = phi i32 [ 0, %33 ], [ %37, %50 ]
  %55 = phi i32 [ 2, %33 ], [ %51, %50 ]
  br label %56, !dbg !163

56:                                               ; preds = %53, %56
  %57 = phi i32 [ %62, %56 ], [ %54, %53 ]
  %58 = phi i32 [ %61, %56 ], [ %55, %53 ]
  call void @llvm.dbg.value(metadata i32 %57, metadata !21, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.value(metadata i32 %58, metadata !20, metadata !DIExpression()), !dbg !157
  %59 = icmp slt i32 %57, %34, !dbg !165
  %60 = select i1 %59, i32 2, i32 1, !dbg !166
  %61 = mul nsw i32 %60, %58, !dbg !166
  call void @llvm.dbg.value(metadata i32 %61, metadata !20, metadata !DIExpression()), !dbg !157
  %62 = add nuw nsw i32 %57, 1, !dbg !164
  call void @llvm.dbg.value(metadata i32 %62, metadata !21, metadata !DIExpression()), !dbg !161
  %63 = icmp eq i32 %62, %24, !dbg !162
  br i1 %63, label %67, label %56, !dbg !163, !llvm.loop !169

64:                                               ; preds = %31, %29
  %65 = phi i32 [ 2, %31 ], [ 1, %29 ]
  %66 = add nsw i32 %65, %22, !dbg !170
  call void @llvm.dbg.value(metadata i32 undef, metadata !70, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata i32 %24, metadata !71, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !151
  br label %72, !dbg !153

67:                                               ; preds = %56, %50, %19
  %68 = phi i32 [ 0, %19 ], [ %51, %50 ], [ %61, %56 ], !dbg !156
  %69 = add nsw i32 %68, %22, !dbg !170
  call void @llvm.dbg.value(metadata i32 %69, metadata !70, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata i32 %24, metadata !71, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !151
  %70 = icmp sgt i32 %21, 1, !dbg !152
  %71 = add i32 %20, 1, !dbg !153
  br i1 %70, label %19, label %72, !dbg !153, !llvm.loop !171

72:                                               ; preds = %67, %10, %64
  %73 = phi i32 [ 0, %10 ], [ %66, %64 ], [ %69, %67 ], !dbg !149
  call void @llvm.dbg.value(metadata i32 %73, metadata !116, metadata !DIExpression()), !dbg !147
  %74 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i32 %73), !dbg !173
  br label %121, !dbg !174

75:                                               ; preds = %2
  %76 = add i32 %5, 99, !dbg !175
  %77 = icmp ult i32 %76, 199, !dbg !175
  br i1 %77, label %121, label %78, !dbg !176

78:                                               ; preds = %75
  %79 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str, i32 0, i32 0)), !dbg !177
  %80 = load i8*, i8** %3, align 4, !dbg !178, !tbaa !124
  call void @llvm.dbg.value(metadata i8* %80, metadata !126, metadata !DIExpression()) #8, !dbg !179
  %81 = tail call i32 @strtol(i8* nocapture nonnull %80, i8** null, i32 10) #8, !dbg !181
  %82 = mul nsw i32 %6, -100, !dbg !182
  %83 = add i32 %81, %82, !dbg !183
  call void @llvm.dbg.value(metadata i32 %83, metadata !118, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.value(metadata i32 2, metadata !18, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata i32 %83, metadata !19, metadata !DIExpression()), !dbg !185
  %84 = icmp eq i32 %83, 0, !dbg !187
  br i1 %84, label %118, label %85, !dbg !188

85:                                               ; preds = %78
  call void @llvm.dbg.value(metadata i32 0, metadata !21, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.value(metadata i32 2, metadata !20, metadata !DIExpression()), !dbg !185
  %86 = icmp sgt i32 %83, 0, !dbg !190
  br i1 %86, label %87, label %118, !dbg !191

87:                                               ; preds = %85
  %88 = add nsw i32 %83, -1
  %89 = icmp ult i32 %83, 4, !dbg !191
  br i1 %89, label %107, label %90, !dbg !191

90:                                               ; preds = %87
  %91 = and i32 %83, -4, !dbg !191
  %92 = insertelement <4 x i32> poison, i32 %88, i32 0, !dbg !191
  %93 = shufflevector <4 x i32> %92, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !191
  br label %94, !dbg !191

94:                                               ; preds = %94, %90
  %95 = phi i32 [ 0, %90 ], [ %101, %94 ], !dbg !192
  %96 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %90 ], [ %102, %94 ]
  %97 = phi <4 x i32> [ <i32 2, i32 1, i32 1, i32 1>, %90 ], [ %100, %94 ]
  %98 = icmp slt <4 x i32> %96, %93, !dbg !193
  %99 = select <4 x i1> %98, <4 x i32> <i32 2, i32 2, i32 2, i32 2>, <4 x i32> <i32 1, i32 1, i32 1, i32 1>, !dbg !194
  %100 = mul <4 x i32> %99, %97, !dbg !194
  %101 = add i32 %95, 4, !dbg !192
  %102 = add <4 x i32> %96, <i32 4, i32 4, i32 4, i32 4>
  %103 = icmp eq i32 %101, %91, !dbg !192
  br i1 %103, label %104, label %94, !dbg !192, !llvm.loop !195

104:                                              ; preds = %94
  %105 = call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %100), !dbg !191
  %106 = icmp eq i32 %83, %91, !dbg !191
  br i1 %106, label %118, label %107, !dbg !191

107:                                              ; preds = %87, %104
  %108 = phi i32 [ 0, %87 ], [ %91, %104 ]
  %109 = phi i32 [ 2, %87 ], [ %105, %104 ]
  br label %110, !dbg !191

110:                                              ; preds = %107, %110
  %111 = phi i32 [ %116, %110 ], [ %108, %107 ]
  %112 = phi i32 [ %115, %110 ], [ %109, %107 ]
  call void @llvm.dbg.value(metadata i32 %111, metadata !21, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.value(metadata i32 %112, metadata !20, metadata !DIExpression()), !dbg !185
  %113 = icmp slt i32 %111, %88, !dbg !193
  %114 = select i1 %113, i32 2, i32 1, !dbg !194
  %115 = mul nsw i32 %114, %112, !dbg !194
  call void @llvm.dbg.value(metadata i32 %115, metadata !20, metadata !DIExpression()), !dbg !185
  %116 = add nuw nsw i32 %111, 1, !dbg !192
  call void @llvm.dbg.value(metadata i32 %116, metadata !21, metadata !DIExpression()), !dbg !189
  %117 = icmp eq i32 %116, %83, !dbg !190
  br i1 %117, label %118, label %110, !dbg !191, !llvm.loop !197

118:                                              ; preds = %110, %104, %78, %85
  %119 = phi i32 [ 1, %78 ], [ 2, %85 ], [ %105, %104 ], [ %115, %110 ], !dbg !185
  call void @llvm.dbg.value(metadata i32 %119, metadata !121, metadata !DIExpression()), !dbg !184
  %120 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i32 %83, i32 %119), !dbg !198
  br label %121, !dbg !199

121:                                              ; preds = %75, %118, %72
  ret i32 0, !dbg !200
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
!32 = !DILocation(line: 9, column: 10, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 9, column: 8)
!34 = !DILocation(line: 9, column: 8, scope: !29)
!35 = distinct !{!35, !30, !36, !37, !38, !39, !40}
!36 = !DILocation(line: 9, column: 26, scope: !22)
!37 = !{!"llvm.loop.mustprogress"}
!38 = !{!"llvm.loop.CGRA.enable"}
!39 = !{!"llvm.loop.unroll.disable"}
!40 = !{!"llvm.loop.isvectorized", i32 1}
!41 = distinct !{!41, !30, !36, !37, !38, !39, !40}
!42 = !DILocation(line: 11, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "power", scope: !1, file: !1, line: 13, type: !15, scopeLine: 13, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !44)
!44 = !{!45, !46, !47, !48}
!45 = !DILocalVariable(name: "base", arg: 1, scope: !43, file: !1, line: 13, type: !4)
!46 = !DILocalVariable(name: "pow", arg: 2, scope: !43, file: !1, line: 13, type: !4)
!47 = !DILocalVariable(name: "ret", scope: !43, file: !1, line: 16, type: !4)
!48 = !DILocalVariable(name: "i", scope: !49, file: !1, line: 18, type: !4)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 18, column: 3)
!50 = !DILocation(line: 0, scope: !43)
!51 = !DILocation(line: 14, column: 10, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !1, line: 14, column: 6)
!53 = !DILocation(line: 14, column: 6, scope: !43)
!54 = !DILocation(line: 0, scope: !49)
!55 = !DILocation(line: 18, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !49, file: !1, line: 18, column: 3)
!57 = !DILocation(line: 18, column: 3, scope: !49)
!58 = !DILocation(line: 18, column: 31, scope: !56)
!59 = !DILocation(line: 19, column: 9, scope: !56)
!60 = distinct !{!60, !57, !61, !37, !39, !40}
!61 = !DILocation(line: 19, column: 12, scope: !49)
!62 = distinct !{!62, !57, !61, !37, !39, !40}
!63 = !DILocation(line: 21, column: 1, scope: !43)
!64 = distinct !DISubprogram(name: "bin_2_dec", scope: !1, file: !1, line: 23, type: !65, scopeLine: 23, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !67)
!65 = !DISubroutineType(types: !66)
!66 = !{!4, !6, !4}
!67 = !{!68, !69, !70, !71}
!68 = !DILocalVariable(name: "bin", arg: 1, scope: !64, file: !1, line: 23, type: !6)
!69 = !DILocalVariable(name: "len", arg: 2, scope: !64, file: !1, line: 23, type: !4)
!70 = !DILocalVariable(name: "ret", scope: !64, file: !1, line: 24, type: !4)
!71 = !DILocalVariable(name: "i", scope: !72, file: !1, line: 25, type: !4)
!72 = distinct !DILexicalBlock(scope: !64, file: !1, line: 25, column: 3)
!73 = !DILocation(line: 0, scope: !64)
!74 = !DILocation(line: 0, scope: !72)
!75 = !DILocation(line: 25, column: 21, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 25, column: 3)
!77 = !DILocation(line: 25, column: 3, scope: !72)
!78 = !DILocation(line: 28, column: 3, scope: !64)
!79 = !DILocation(line: 26, column: 22, scope: !76)
!80 = !DILocation(line: 26, column: 13, scope: !76)
!81 = !{!82, !82, i64 0}
!82 = !{!"omnipotent char", !83, i64 0}
!83 = !{!"Simple C/C++ TBAA"}
!84 = !DILocation(line: 26, column: 26, scope: !76)
!85 = !DILocation(line: 26, column: 12, scope: !76)
!86 = !DILocation(line: 0, scope: !14, inlinedAt: !87)
!87 = distinct !DILocation(line: 26, column: 35, scope: !76)
!88 = !DILocation(line: 5, column: 10, scope: !25, inlinedAt: !87)
!89 = !DILocation(line: 5, column: 6, scope: !14, inlinedAt: !87)
!90 = !DILocation(line: 0, scope: !22, inlinedAt: !87)
!91 = !DILocation(line: 8, column: 20, scope: !29, inlinedAt: !87)
!92 = !DILocation(line: 8, column: 3, scope: !22, inlinedAt: !87)
!93 = !DILocation(line: 8, column: 28, scope: !29, inlinedAt: !87)
!94 = !DILocation(line: 9, column: 10, scope: !33, inlinedAt: !87)
!95 = !DILocation(line: 9, column: 8, scope: !29, inlinedAt: !87)
!96 = distinct !{!96, !92, !97, !37, !38, !39, !40}
!97 = !DILocation(line: 9, column: 26, scope: !22, inlinedAt: !87)
!98 = distinct !{!98, !92, !97, !37, !38, !39, !40}
!99 = !DILocation(line: 26, column: 9, scope: !76)
!100 = distinct !{!100, !77, !101, !37, !39}
!101 = !DILocation(line: 26, column: 45, scope: !72)
!102 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 31, type: !103, scopeLine: 32, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !105)
!103 = !DISubroutineType(types: !104)
!104 = !{!4, !4, !5}
!105 = !{!106, !107, !108, !109, !112, !116, !118, !121}
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !102, file: !1, line: 31, type: !4)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !102, file: !1, line: 31, type: !5)
!108 = !DILocalVariable(name: "mode", scope: !102, file: !1, line: 53, type: !4)
!109 = !DILocalVariable(name: "len", scope: !110, file: !1, line: 58, type: !4)
!110 = distinct !DILexicalBlock(scope: !111, file: !1, line: 56, column: 16)
!111 = distinct !DILexicalBlock(scope: !102, file: !1, line: 56, column: 6)
!112 = !DILocalVariable(name: "bin", scope: !110, file: !1, line: 60, type: !113)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 136, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 17)
!116 = !DILocalVariable(name: "dec", scope: !110, file: !1, line: 61, type: !117)
!117 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!118 = !DILocalVariable(name: "p", scope: !119, file: !1, line: 71, type: !4)
!119 = distinct !DILexicalBlock(scope: !120, file: !1, line: 69, column: 23)
!120 = distinct !DILexicalBlock(scope: !111, file: !1, line: 69, column: 13)
!121 = !DILocalVariable(name: "ret", scope: !119, file: !1, line: 82, type: !4)
!122 = !DILocation(line: 0, scope: !102)
!123 = !DILocation(line: 53, column: 19, scope: !102)
!124 = !{!125, !125, i64 0}
!125 = !{!"any pointer", !82, i64 0}
!126 = !DILocalVariable(name: "__nptr", arg: 1, scope: !127, file: !128, line: 361, type: !131)
!127 = distinct !DISubprogram(name: "atoi", scope: !128, file: !128, line: 361, type: !129, scopeLine: 362, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !133)
!128 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/stdlib.h", directory: "")
!129 = !DISubroutineType(types: !130)
!130 = !{!4, !131}
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 32)
!132 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!133 = !{!126}
!134 = !DILocation(line: 0, scope: !127, inlinedAt: !135)
!135 = distinct !DILocation(line: 53, column: 14, scope: !102)
!136 = !DILocation(line: 363, column: 16, scope: !127, inlinedAt: !135)
!137 = !DILocation(line: 53, column: 27, scope: !102)
!138 = !DILocation(line: 54, column: 3, scope: !102)
!139 = !DILocation(line: 56, column: 11, scope: !111)
!140 = !DILocation(line: 56, column: 6, scope: !102)
!141 = !DILocation(line: 57, column: 5, scope: !110)
!142 = !DILocation(line: 58, column: 20, scope: !110)
!143 = !DILocation(line: 0, scope: !127, inlinedAt: !144)
!144 = distinct !DILocation(line: 58, column: 15, scope: !110)
!145 = !DILocation(line: 363, column: 16, scope: !127, inlinedAt: !144)
!146 = !DILocation(line: 58, column: 29, scope: !110)
!147 = !DILocation(line: 0, scope: !110)
!148 = !DILocation(line: 59, column: 5, scope: !110)
!149 = !DILocation(line: 0, scope: !64, inlinedAt: !150)
!150 = distinct !DILocation(line: 61, column: 20, scope: !110)
!151 = !DILocation(line: 0, scope: !72, inlinedAt: !150)
!152 = !DILocation(line: 25, column: 21, scope: !76, inlinedAt: !150)
!153 = !DILocation(line: 25, column: 3, scope: !72, inlinedAt: !150)
!154 = !DILocation(line: 26, column: 22, scope: !76, inlinedAt: !150)
!155 = !DILocation(line: 26, column: 26, scope: !76, inlinedAt: !150)
!156 = !DILocation(line: 26, column: 12, scope: !76, inlinedAt: !150)
!157 = !DILocation(line: 0, scope: !14, inlinedAt: !158)
!158 = distinct !DILocation(line: 26, column: 35, scope: !76, inlinedAt: !150)
!159 = !DILocation(line: 5, column: 10, scope: !25, inlinedAt: !158)
!160 = !DILocation(line: 5, column: 6, scope: !14, inlinedAt: !158)
!161 = !DILocation(line: 0, scope: !22, inlinedAt: !158)
!162 = !DILocation(line: 8, column: 20, scope: !29, inlinedAt: !158)
!163 = !DILocation(line: 8, column: 3, scope: !22, inlinedAt: !158)
!164 = !DILocation(line: 8, column: 28, scope: !29, inlinedAt: !158)
!165 = !DILocation(line: 9, column: 10, scope: !33, inlinedAt: !158)
!166 = !DILocation(line: 9, column: 8, scope: !29, inlinedAt: !158)
!167 = distinct !{!167, !163, !168, !37, !38, !39, !40}
!168 = !DILocation(line: 9, column: 26, scope: !22, inlinedAt: !158)
!169 = distinct !{!169, !163, !168, !37, !38, !39, !40}
!170 = !DILocation(line: 26, column: 9, scope: !76, inlinedAt: !150)
!171 = distinct !{!171, !153, !172, !37, !39}
!172 = !DILocation(line: 26, column: 45, scope: !72, inlinedAt: !150)
!173 = !DILocation(line: 67, column: 5, scope: !110)
!174 = !DILocation(line: 69, column: 3, scope: !110)
!175 = !DILocation(line: 69, column: 18, scope: !120)
!176 = !DILocation(line: 69, column: 13, scope: !111)
!177 = !DILocation(line: 70, column: 5, scope: !119)
!178 = !DILocation(line: 71, column: 18, scope: !119)
!179 = !DILocation(line: 0, scope: !127, inlinedAt: !180)
!180 = distinct !DILocation(line: 71, column: 13, scope: !119)
!181 = !DILocation(line: 363, column: 16, scope: !127, inlinedAt: !180)
!182 = !DILocation(line: 71, column: 33, scope: !119)
!183 = !DILocation(line: 71, column: 27, scope: !119)
!184 = !DILocation(line: 0, scope: !119)
!185 = !DILocation(line: 0, scope: !14, inlinedAt: !186)
!186 = distinct !DILocation(line: 82, column: 15, scope: !119)
!187 = !DILocation(line: 5, column: 10, scope: !25, inlinedAt: !186)
!188 = !DILocation(line: 5, column: 6, scope: !14, inlinedAt: !186)
!189 = !DILocation(line: 0, scope: !22, inlinedAt: !186)
!190 = !DILocation(line: 8, column: 20, scope: !29, inlinedAt: !186)
!191 = !DILocation(line: 8, column: 3, scope: !22, inlinedAt: !186)
!192 = !DILocation(line: 8, column: 28, scope: !29, inlinedAt: !186)
!193 = !DILocation(line: 9, column: 10, scope: !33, inlinedAt: !186)
!194 = !DILocation(line: 9, column: 8, scope: !29, inlinedAt: !186)
!195 = distinct !{!195, !191, !196, !37, !38, !39, !40}
!196 = !DILocation(line: 9, column: 26, scope: !22, inlinedAt: !186)
!197 = distinct !{!197, !191, !196, !37, !38, !39, !40}
!198 = !DILocation(line: 84, column: 5, scope: !119)
!199 = !DILocation(line: 85, column: 3, scope: !119)
!200 = !DILocation(line: 87, column: 1, scope: !102)
