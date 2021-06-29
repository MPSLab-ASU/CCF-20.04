; ModuleID = 'CondDDGGen.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-none-linux-eabi"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [11 x i8] c"Mode = %d\0A\00", align 1
@str.6 = private unnamed_addr constant [16 x i8] c"Bin to dec mode\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"Len = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"1000011001111001 = %d\0A\00", align 1
@str = private unnamed_addr constant [11 x i8] c"Power mode\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"***** 2^%d = %d *****\0A\00", align 1
@totalLoops = dso_local global i32 0, align 4
@dynamicTCVal = dso_local local_unnamed_addr global i32 0, align 4
@initCGRA = dso_local local_unnamed_addr global i32* null, align 4
@epilog = dso_local local_unnamed_addr global i32* null, align 4
@prolog = dso_local local_unnamed_addr global i32* null, align 4
@kernel = dso_local local_unnamed_addr global i32* null, align 4
@prologPtr = dso_local local_unnamed_addr global i32* null, align 4
@epilogPtr = dso_local local_unnamed_addr global i32* null, align 4
@kernelPtr = dso_local local_unnamed_addr global i32* null, align 4
@ArrPtr = dso_local local_unnamed_addr global i32* null, align 4
@pth = dso_local local_unnamed_addr global i32 0, align 4
@str.1 = private unnamed_addr constant [34 x i8] c"from cgra.c Initialize Parameters\00", align 1
@__const.configureCGRA.directoryPath = private unnamed_addr constant [20 x i8] c"./CGRAExec/L\00\00\00\00\00\00\00\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2.2 = private unnamed_addr constant [16 x i8] c"/epilog_ins.bin\00", align 1
@.str.3.3 = private unnamed_addr constant [16 x i8] c"/prolog_ins.bin\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"/kernel_ins.bin\00", align 1
@.str.5.4 = private unnamed_addr constant [17 x i8] c"/CGRA_config.txt\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [32 x i8] c"\0A**********EPISIZE %d*********\0A\00", align 1
@.str.9 = private unnamed_addr constant [32 x i8] c"\0A**********PROSIZE %d*********\0A\00", align 1
@.str.10 = private unnamed_addr constant [33 x i8] c"\0A**********KERNSIZE %d*********\0A\00", align 1
@.str.11 = private unnamed_addr constant [37 x i8] c"\0A******SIZE OF UNSIGNED LONG%d*****\0A\00", align 1
@.str.12 = private unnamed_addr constant [42 x i8] c"\0A******SIZE OF UNSIGNED LONG LONG%d*****\0A\00", align 1
@.str.13 = private unnamed_addr constant [26 x i8] c"/livevar_st_ins_count.txt\00", align 1
@str.34 = private unnamed_addr constant [52 x i8] c"\0A*******************before while loop**************\00", align 1
@.str.15 = private unnamed_addr constant [39 x i8] c"\0A************XDIM and YDim are %d, %d\0A\00", align 1
@.str.16 = private unnamed_addr constant [18 x i8] c"/kernel_count.txt\00", align 1
@.str.17 = private unnamed_addr constant [16 x i8] c"Loop Count: %d\0A\00", align 1
@.str.18 = private unnamed_addr constant [55 x i8] c"From FILE: PROLOGPC= %lx, EPILOGPC=%lx,  KernelPC=%lx\0A\00", align 1
@str.35 = private unnamed_addr constant [14 x i8] c"configureCGRA\00", align 1
@.str.20 = private unnamed_addr constant [14 x i8] c"\0Aloopno = %s\0A\00", align 1
@__const.configureCGRA.initCGRAfile = private unnamed_addr constant [40 x i8] c"./CGRAExec/L1\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"/initCGRA.txt\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@str.36 = private unnamed_addr constant [16 x i8] c"checkTotalLoops\00", align 1
@__const.checkTotalLoops.myfile = private unnamed_addr constant [40 x i8] c"./CGRAExec/total_loops.txt\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"%u\00", align 1
@str.37 = private unnamed_addr constant [12 x i8] c"\0A\0ArunOnCGRA\00", align 1
@str.38 = private unnamed_addr constant [19 x i8] c"\0A\0AaccelerateOnCGRA\00", align 1
@.str.30 = private unnamed_addr constant [35 x i8] c"Core will execute loop %u on CGRA\0A\00", align 1
@str.39 = private unnamed_addr constant [15 x i8] c"\0Adeleting cgra\00", align 1
@str.40 = private unnamed_addr constant [11 x i8] c"createCGRA\00", align 1
@str.41 = private unnamed_addr constant [35 x i8] c"Main thread calling CGRA thread...\00", align 1
@gVar1 = common local_unnamed_addr global i32 0
@gVar2 = common local_unnamed_addr global i32 0
@gVar3 = common local_unnamed_addr global i32 0
@gVar4 = common local_unnamed_addr global i32 0
@gVar5 = common local_unnamed_addr global i32 0
@gVar6 = common local_unnamed_addr global i32 0
@gVar7 = common local_unnamed_addr global i32 0
@gVar8 = common local_unnamed_addr global i32 0
@gVar9 = common local_unnamed_addr global i32 0
@gVar10 = common local_unnamed_addr global i32 0
@gVar11 = common local_unnamed_addr global i32 0
@gVar12 = common local_unnamed_addr global i32 0
@gVar13 = common local_unnamed_addr global i32 0
@gVar14 = common local_unnamed_addr global i32 0
@gVar15 = common local_unnamed_addr global i32 0
@gVar16 = common local_unnamed_addr global i32 0
@gVar17 = common local_unnamed_addr global i32 0
@gVar18 = common local_unnamed_addr global i32 0
@gVar19 = common local_unnamed_addr global i32 0
@gVar20 = common local_unnamed_addr global i32 0
@gVar21 = common local_unnamed_addr global i32 0

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @pow(i32 %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %.loopexit, label %4

4:                                                ; preds = %2
  %5 = icmp sgt i32 %1, 0
  br i1 %5, label %6, label %.loopexit

6:                                                ; preds = %4
  %7 = add nsw i32 %1, -1
  %8 = icmp ult i32 %1, 4
  store i32 %7, i32* @gVar3, align 4
  br i1 %8, label %.preheader, label %9

9:                                                ; preds = %6
  %10 = and i32 %1, -4
  %11 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %0, i32 0
  %12 = insertelement <4 x i32> poison, i32 %7, i32 0
  %13 = shufflevector <4 x i32> %12, <4 x i32> poison, <4 x i32> zeroinitializer
  %14 = insertelement <4 x i32> poison, i32 %0, i32 0
  %15 = shufflevector <4 x i32> %14, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %16

16:                                               ; preds = %16, %9
  %17 = phi i32 [ 0, %9 ], [ %23, %16 ]
  %18 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %9 ], [ %24, %16 ]
  %19 = phi <4 x i32> [ %11, %9 ], [ %22, %16 ]
  %20 = icmp slt <4 x i32> %18, %13
  %21 = select <4 x i1> %20, <4 x i32> %15, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %22 = mul <4 x i32> %21, %19
  %23 = add i32 %17, 4
  %24 = add <4 x i32> %18, <i32 4, i32 4, i32 4, i32 4>
  %25 = icmp eq i32 %23, %10
  br i1 %25, label %26, label %16, !llvm.loop !5

26:                                               ; preds = %16
  %27 = tail call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %22)
  %28 = icmp eq i32 %10, %1
  br i1 %28, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %26, %6
  %.ph = phi i32 [ %10, %26 ], [ 0, %6 ]
  %.ph6 = phi i32 [ %27, %26 ], [ %0, %6 ]
  store i32 %.ph, i32* @gVar1, align 4
  store i32 %.ph6, i32* @gVar2, align 4
  store i32 %0, i32* @gVar4, align 4
  store i32 %1, i32* @gVar5, align 4
  %29 = sub i32 %1, %.ph
  %30 = sdiv i32 %29, 1
  store i32 %30, i32* @dynamicTCVal, align 4
  br label %31

31:                                               ; preds = %31, %.preheader
  %32 = phi i32 [ %37, %31 ], [ %.ph, %.preheader ]
  %33 = phi i32 [ %36, %31 ], [ %.ph6, %.preheader ]
  %34 = icmp slt i32 %32, %7
  %35 = select i1 %34, i32 %0, i32 1
  %36 = mul nsw i32 %35, %33
  %37 = add nuw nsw i32 %32, 1
  %38 = icmp eq i32 %37, %1
  br i1 %38, label %.loopexit.loopexit, label %31, !llvm.loop !10

.loopexit.loopexit:                               ; preds = %31
  br label %39

39:                                               ; preds = %.loopexit.loopexit
  %40 = load i32, i32* @gVar6, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %39, %26, %4, %2
  %41 = phi i32 [ 1, %2 ], [ %0, %4 ], [ %27, %26 ], [ %40, %39 ]
  ret i32 %41
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.mul.v4i32(<4 x i32>) #1

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @power(i32 %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %.loopexit, label %4

4:                                                ; preds = %2
  %5 = icmp sgt i32 %1, 1
  br i1 %5, label %6, label %.loopexit

6:                                                ; preds = %4
  %7 = add nsw i32 %1, -1
  %8 = icmp ult i32 %7, 4
  br i1 %8, label %.preheader, label %9

9:                                                ; preds = %6
  %10 = and i32 %7, -4
  %11 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %0, i32 0
  %12 = insertelement <4 x i32> poison, i32 %0, i32 0
  %13 = shufflevector <4 x i32> %12, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %14

14:                                               ; preds = %14, %9
  %15 = phi i32 [ 0, %9 ], [ %18, %14 ]
  %16 = phi <4 x i32> [ %11, %9 ], [ %17, %14 ]
  %17 = mul <4 x i32> %16, %13
  %18 = add i32 %15, 4
  %19 = icmp eq i32 %18, %10
  br i1 %19, label %20, label %14, !llvm.loop !12

20:                                               ; preds = %14
  %21 = tail call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %17)
  %22 = icmp eq i32 %7, %10
  br i1 %22, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %20, %6
  %.ph = phi i32 [ %10, %20 ], [ 0, %6 ]
  %.ph7 = phi i32 [ %21, %20 ], [ %0, %6 ]
  br label %23

23:                                               ; preds = %23, %.preheader
  %24 = phi i32 [ %27, %23 ], [ %.ph, %.preheader ]
  %25 = phi i32 [ %26, %23 ], [ %.ph7, %.preheader ]
  %26 = mul nsw i32 %25, %0
  %27 = add nuw nsw i32 %24, 1
  %28 = icmp eq i32 %27, %7
  br i1 %28, label %.loopexit.loopexit, label %23, !llvm.loop !13

.loopexit.loopexit:                               ; preds = %23
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %20, %4, %2
  %29 = phi i32 [ 1, %2 ], [ %0, %4 ], [ %21, %20 ], [ %26, %.loopexit.loopexit ]
  ret i32 %29
}

; Function Attrs: norecurse nounwind readonly
define dso_local i32 @bin_2_dec(i8* nocapture readonly %0, i32 %1) local_unnamed_addr #2 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %.preheader.preheader, label %.loopexit5

.preheader.preheader:                             ; preds = %2
  br label %.preheader

.loopexit5.loopexit:                              ; preds = %.loopexit
  br label %.loopexit5

.loopexit5:                                       ; preds = %47, %.loopexit5.loopexit, %2
  %4 = phi i32 [ 0, %2 ], [ %49, %47 ], [ %53, %.loopexit5.loopexit ]
  ret i32 %4

.preheader:                                       ; preds = %.loopexit, %.preheader.preheader
  %5 = phi i32 [ %54, %.loopexit ], [ 0, %.preheader.preheader ]
  %6 = phi i32 [ %10, %.loopexit ], [ %1, %.preheader.preheader ]
  %7 = phi i32 [ %53, %.loopexit ], [ 0, %.preheader.preheader ]
  %8 = xor i32 %5, -1
  %9 = add nsw i32 %8, %1
  %10 = add nsw i32 %6, -1
  %11 = sub nuw nsw i32 %1, %6
  %12 = getelementptr inbounds i8, i8* %0, i32 %11
  %13 = load i8, i8* %12, align 1, !tbaa !14
  %14 = icmp eq i8 %13, 49
  store i32 %10, i32* @gVar10, align 4
  br i1 %14, label %15, label %.loopexit

15:                                               ; preds = %.preheader
  %16 = icmp eq i32 %10, 0
  br i1 %16, label %47, label %17

17:                                               ; preds = %15
  %18 = icmp sgt i32 %6, 1
  br i1 %18, label %19, label %47

19:                                               ; preds = %17
  %20 = add nsw i32 %6, -2
  %21 = icmp ult i32 %9, 4
  store i32 %20, i32* @gVar9, align 4
  br i1 %21, label %.preheader22, label %22

22:                                               ; preds = %19
  %23 = and i32 %9, -4
  %24 = insertelement <4 x i32> poison, i32 %20, i32 0
  %25 = shufflevector <4 x i32> %24, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %26

26:                                               ; preds = %26, %22
  %27 = phi i32 [ 0, %22 ], [ %33, %26 ]
  %28 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %22 ], [ %34, %26 ]
  %29 = phi <4 x i32> [ <i32 2, i32 1, i32 1, i32 1>, %22 ], [ %32, %26 ]
  %30 = icmp slt <4 x i32> %28, %25
  %31 = select <4 x i1> %30, <4 x i32> <i32 2, i32 2, i32 2, i32 2>, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %32 = mul <4 x i32> %31, %29
  %33 = add i32 %27, 4
  %34 = add <4 x i32> %28, <i32 4, i32 4, i32 4, i32 4>
  %35 = icmp eq i32 %33, %23
  br i1 %35, label %36, label %26, !llvm.loop !17

36:                                               ; preds = %26
  %37 = tail call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %32)
  %38 = icmp eq i32 %9, %23
  br i1 %38, label %.loopexit, label %.preheader22

.preheader22:                                     ; preds = %36, %19
  %.ph = phi i32 [ %23, %36 ], [ 0, %19 ]
  %.ph23 = phi i32 [ %37, %36 ], [ 2, %19 ]
  store i32 %.ph, i32* @gVar7, align 4
  store i32 %.ph23, i32* @gVar8, align 4
  br label %39

39:                                               ; preds = %39, %.preheader22
  %40 = phi i32 [ %45, %39 ], [ %.ph, %.preheader22 ]
  %41 = phi i32 [ %44, %39 ], [ %.ph23, %.preheader22 ]
  %42 = icmp slt i32 %40, %20
  %43 = select i1 %42, i32 2, i32 1
  %44 = mul nsw i32 %43, %41
  %45 = add nuw nsw i32 %40, 1
  %46 = icmp eq i32 %45, %10
  br i1 %46, label %.loopexit.loopexit, label %39, !llvm.loop !18

47:                                               ; preds = %17, %15
  %48 = phi i32 [ 2, %17 ], [ 1, %15 ]
  %49 = add nsw i32 %48, %7
  br label %.loopexit5

.loopexit.loopexit:                               ; preds = %39
  br label %50

50:                                               ; preds = %.loopexit.loopexit
  %51 = load i32, i32* @gVar11, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %50, %36, %.preheader
  %52 = phi i32 [ 0, %.preheader ], [ %37, %36 ], [ %51, %50 ]
  %53 = add nsw i32 %52, %7
  %54 = add nuw nsw i32 %5, 1
  %exitcond.not = icmp eq i32 %54, %1
  br i1 %exitcond.not, label %.loopexit5.loopexit, label %.preheader, !llvm.loop !19
}

; Function Attrs: nofree nounwind
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #3 {
  %3 = getelementptr inbounds i8*, i8** %1, i32 1
  %4 = load i8*, i8** %3, align 4, !tbaa !20
  %5 = tail call i32 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #14
  %6 = sdiv i32 %5, 100
  %7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = add i32 %5, -100
  %9 = icmp ult i32 %8, 100
  br i1 %9, label %10, label %71

10:                                               ; preds = %2
  %11 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.6, i32 0, i32 0))
  %12 = load i8*, i8** %3, align 4, !tbaa !20
  %13 = tail call i32 @strtol(i8* nocapture nonnull %12, i8** null, i32 10) #14
  %14 = add i32 %13, -100
  %15 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i32 %14)
  %16 = icmp sgt i32 %13, 100
  br i1 %16, label %17, label %.loopexit7

17:                                               ; preds = %10
  %18 = add nsw i32 %13, -101
  br label %19

19:                                               ; preds = %.loopexit, %17
  %20 = phi i32 [ 0, %17 ], [ %68, %.loopexit ]
  %21 = phi i32 [ %14, %17 ], [ %24, %.loopexit ]
  %22 = phi i32 [ 0, %17 ], [ %67, %.loopexit ]
  %23 = sub nuw nsw i32 %18, %20
  %24 = add nsw i32 %21, -1
  %25 = sub nuw nsw i32 %14, %21
  %26 = lshr i32 40545, %25
  %27 = and i32 %26, 1
  %28 = icmp eq i32 %27, 0
  store i32 %24, i32* @gVar15, align 4
  br i1 %28, label %.loopexit, label %29

29:                                               ; preds = %19
  %30 = icmp eq i32 %24, 0
  br i1 %30, label %61, label %31

31:                                               ; preds = %29
  %32 = icmp sgt i32 %21, 1
  br i1 %32, label %33, label %61

33:                                               ; preds = %31
  %34 = add nsw i32 %21, -2
  %35 = icmp ult i32 %23, 4
  store i32 %34, i32* @gVar14, align 4
  br i1 %35, label %.preheader, label %36

36:                                               ; preds = %33
  %37 = and i32 %23, -4
  %38 = insertelement <4 x i32> poison, i32 %34, i32 0
  %39 = shufflevector <4 x i32> %38, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %40

40:                                               ; preds = %40, %36
  %41 = phi i32 [ 0, %36 ], [ %47, %40 ]
  %42 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %36 ], [ %48, %40 ]
  %43 = phi <4 x i32> [ <i32 2, i32 1, i32 1, i32 1>, %36 ], [ %46, %40 ]
  %44 = icmp slt <4 x i32> %42, %39
  %45 = select <4 x i1> %44, <4 x i32> <i32 2, i32 2, i32 2, i32 2>, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %46 = mul <4 x i32> %45, %43
  %47 = add i32 %41, 4
  %48 = add <4 x i32> %42, <i32 4, i32 4, i32 4, i32 4>
  %49 = icmp eq i32 %47, %37
  br i1 %49, label %50, label %40, !llvm.loop !22

50:                                               ; preds = %40
  %51 = tail call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %46)
  %52 = icmp eq i32 %23, %37
  br i1 %52, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %50, %33
  %.ph = phi i32 [ %37, %50 ], [ 0, %33 ]
  %.ph33 = phi i32 [ %51, %50 ], [ 2, %33 ]
  store i32 %.ph, i32* @gVar12, align 4
  store i32 %.ph33, i32* @gVar13, align 4
  br label %53

53:                                               ; preds = %53, %.preheader
  %54 = phi i32 [ %59, %53 ], [ %.ph, %.preheader ]
  %55 = phi i32 [ %58, %53 ], [ %.ph33, %.preheader ]
  %56 = icmp slt i32 %54, %34
  %57 = select i1 %56, i32 2, i32 1
  %58 = mul nsw i32 %57, %55
  %59 = add nuw nsw i32 %54, 1
  %60 = icmp eq i32 %59, %24
  br i1 %60, label %.loopexit.loopexit, label %53, !llvm.loop !23

61:                                               ; preds = %31, %29
  %62 = phi i32 [ 2, %31 ], [ 1, %29 ]
  %63 = add nsw i32 %62, %22
  br label %.loopexit7

.loopexit.loopexit:                               ; preds = %53
  br label %64

64:                                               ; preds = %.loopexit.loopexit
  %65 = load i32, i32* @gVar16, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %64, %50, %19
  %66 = phi i32 [ 0, %19 ], [ %51, %50 ], [ %65, %64 ]
  %67 = add nsw i32 %66, %22
  %68 = add nuw nsw i32 %20, 1
  %exitcond.not = icmp eq i32 %68, %14
  br i1 %exitcond.not, label %.loopexit7.loopexit, label %19, !llvm.loop !24

.loopexit7.loopexit:                              ; preds = %.loopexit
  br label %.loopexit7

.loopexit7:                                       ; preds = %.loopexit7.loopexit, %61, %10
  %69 = phi i32 [ 0, %10 ], [ %63, %61 ], [ %67, %.loopexit7.loopexit ]
  %70 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i32 %69)
  br label %115

71:                                               ; preds = %2
  %72 = add i32 %5, 99
  %73 = icmp ult i32 %72, 199
  br i1 %73, label %115, label %74

74:                                               ; preds = %71
  %75 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str, i32 0, i32 0))
  %76 = load i8*, i8** %3, align 4, !tbaa !20
  %77 = tail call i32 @strtol(i8* nocapture nonnull %76, i8** null, i32 10) #14
  %78 = mul nsw i32 %6, -100
  %79 = add i32 %77, %78
  %80 = icmp eq i32 %79, 0
  store i32 %79, i32* @gVar20, align 4
  br i1 %80, label %.loopexit8, label %81

81:                                               ; preds = %74
  %82 = icmp sgt i32 %79, 0
  br i1 %82, label %83, label %.loopexit8

83:                                               ; preds = %81
  %84 = add nsw i32 %79, -1
  %85 = icmp ult i32 %79, 4
  store i32 %84, i32* @gVar19, align 4
  br i1 %85, label %.preheader38, label %86

86:                                               ; preds = %83
  %87 = and i32 %79, -4
  %88 = insertelement <4 x i32> poison, i32 %84, i32 0
  %89 = shufflevector <4 x i32> %88, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %90

90:                                               ; preds = %90, %86
  %91 = phi i32 [ 0, %86 ], [ %97, %90 ]
  %92 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %86 ], [ %98, %90 ]
  %93 = phi <4 x i32> [ <i32 2, i32 1, i32 1, i32 1>, %86 ], [ %96, %90 ]
  %94 = icmp slt <4 x i32> %92, %89
  %95 = select <4 x i1> %94, <4 x i32> <i32 2, i32 2, i32 2, i32 2>, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %96 = mul <4 x i32> %95, %93
  %97 = add i32 %91, 4
  %98 = add <4 x i32> %92, <i32 4, i32 4, i32 4, i32 4>
  %99 = icmp eq i32 %97, %87
  br i1 %99, label %100, label %90, !llvm.loop !25

100:                                              ; preds = %90
  %101 = tail call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %96)
  %102 = icmp eq i32 %79, %87
  br i1 %102, label %.loopexit8, label %.preheader38

.preheader38:                                     ; preds = %100, %83
  %.ph39 = phi i32 [ %87, %100 ], [ 0, %83 ]
  %.ph40 = phi i32 [ %101, %100 ], [ 2, %83 ]
  store i32 %.ph39, i32* @gVar17, align 4
  store i32 %.ph40, i32* @gVar18, align 4
  br label %103

103:                                              ; preds = %103, %.preheader38
  %104 = phi i32 [ %109, %103 ], [ %.ph39, %.preheader38 ]
  %105 = phi i32 [ %108, %103 ], [ %.ph40, %.preheader38 ]
  %106 = icmp slt i32 %104, %84
  %107 = select i1 %106, i32 2, i32 1
  %108 = mul nsw i32 %107, %105
  %109 = add nuw nsw i32 %104, 1
  %110 = icmp eq i32 %109, %79
  br i1 %110, label %.loopexit8.loopexit, label %103, !llvm.loop !26

.loopexit8.loopexit:                              ; preds = %103
  br label %111

111:                                              ; preds = %.loopexit8.loopexit
  %112 = load i32, i32* @gVar21, align 4
  br label %.loopexit8

.loopexit8:                                       ; preds = %111, %100, %81, %74
  %113 = phi i32 [ 1, %74 ], [ 2, %81 ], [ %101, %100 ], [ %112, %111 ]
  %114 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i32 %79, i32 %113)
  br label %115

115:                                              ; preds = %.loopexit8, %71, %.loopexit7
  ret i32 0
}

; Function Attrs: nofree nounwind willreturn
declare dso_local i32 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #6

; Function Attrs: nounwind
define dso_local i32 @initializeParameters(i32 %0) local_unnamed_addr #7 {
  %2 = alloca [25 x i8], align 1
  %3 = alloca [20 x i8], align 1
  %4 = alloca [40 x i8], align 1
  %5 = alloca [40 x i8], align 1
  %6 = alloca [40 x i8], align 1
  %7 = alloca [40 x i8], align 1
  %8 = alloca [40 x i8], align 1
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [256 x i8], align 1
  %14 = alloca [40 x i8], align 1
  %15 = alloca i32, align 4
  %16 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([34 x i8], [34 x i8]* @str.1, i32 0, i32 0))
  %17 = load i32*, i32** @initCGRA, align 4, !tbaa !20
  %18 = add i32 %0, -1
  %19 = mul i32 %18, 7
  %20 = getelementptr inbounds i32, i32* %17, i32 %19
  store i32 2011168768, i32* %20, align 4, !tbaa !27
  %21 = getelementptr inbounds i32, i32* %20, i32 1
  store i32 2011168768, i32* %21, align 4, !tbaa !27
  %22 = getelementptr inbounds i32, i32* %20, i32 2
  %23 = getelementptr inbounds [25 x i8], [25 x i8]* %2, i32 0, i32 0
  %24 = bitcast i32* %22 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(20) %24, i8 0, i64 20, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %23) #14
  %25 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %25) #14
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(20) %25, i8* nonnull align 1 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @__const.configureCGRA.directoryPath, i32 0, i32 0), i32 20, i1 false)
  %26 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %23, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 %0) #14
  %27 = call i8* @strcat(i8* nonnull %25, i8* nonnull %23) #14
  %28 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %28) #14
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %28, i8 0, i32 40, i1 false)
  %29 = getelementptr inbounds [40 x i8], [40 x i8]* %5, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %29) #14
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %29, i8 0, i32 40, i1 false)
  %30 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %30) #14
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %30, i8 0, i32 40, i1 false)
  %31 = getelementptr inbounds [40 x i8], [40 x i8]* %7, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %31) #14
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %31, i8 0, i32 40, i1 false)
  %32 = getelementptr inbounds [40 x i8], [40 x i8]* %8, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %32) #14
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %32, i8 0, i32 40, i1 false)
  %33 = call i8* @strcat(i8* nonnull %28, i8* nonnull %25) #14
  %34 = call i32 @strlen(i8* nonnull %28)
  %35 = getelementptr [40 x i8], [40 x i8]* %4, i32 0, i32 %34
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %35, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2.2, i32 0, i32 0), i32 16, i1 false)
  %36 = call i8* @strcat(i8* nonnull %29, i8* nonnull %25) #14
  %37 = call i32 @strlen(i8* nonnull %29)
  %38 = getelementptr [40 x i8], [40 x i8]* %5, i32 0, i32 %37
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %38, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3.3, i32 0, i32 0), i32 16, i1 false)
  %39 = call i8* @strcat(i8* nonnull %30, i8* nonnull %25) #14
  %40 = call i32 @strlen(i8* nonnull %30)
  %41 = getelementptr [40 x i8], [40 x i8]* %6, i32 0, i32 %40
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %41, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0), i32 16, i1 false)
  %42 = call i8* @strcat(i8* nonnull %32, i8* nonnull %25) #14
  %43 = call i32 @strlen(i8* nonnull %32)
  %44 = getelementptr [40 x i8], [40 x i8]* %8, i32 0, i32 %43
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(17) %44, i8* nonnull align 1 dereferenceable(17) getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5.4, i32 0, i32 0), i32 17, i1 false)
  %45 = call %struct._IO_FILE* @fopen(i8* nonnull %28, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0))
  %46 = call %struct._IO_FILE* @fopen(i8* nonnull %29, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0))
  %47 = call %struct._IO_FILE* @fopen(i8* nonnull %30, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0))
  %48 = call %struct._IO_FILE* @fopen(i8* nonnull %32, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %49 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %49) #14
  %50 = bitcast i32* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %50) #14
  %51 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %51) #14
  %52 = bitcast i32* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %52) #14
  %53 = call i32 @fread(i8* nonnull %49, i32 4, i32 1, %struct._IO_FILE* %45)
  %54 = call i32 @fread(i8* nonnull %50, i32 4, i32 1, %struct._IO_FILE* %46)
  %55 = call i32 @fread(i8* nonnull %51, i32 4, i32 1, %struct._IO_FILE* %47)
  %56 = load i32, i32* %9, align 4, !tbaa !27
  %57 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8, i32 0, i32 0), i32 %56)
  %58 = load i32, i32* %10, align 4, !tbaa !27
  %59 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i32 0, i32 0), i32 %58)
  %60 = load i32, i32* %11, align 4, !tbaa !27
  %61 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0), i32 %60)
  %62 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([37 x i8], [37 x i8]* @.str.11, i32 0, i32 0), i32 4)
  %63 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.12, i32 0, i32 0), i32 8)
  %64 = shl i32 %56, 3
  %65 = call noalias i8* @malloc(i32 %64) #14
  store i8* %65, i8** bitcast (i32** @epilog to i8**), align 4, !tbaa !20
  %66 = shl i32 %58, 3
  %67 = call noalias i8* @malloc(i32 %66) #14
  store i8* %67, i8** bitcast (i32** @prolog to i8**), align 4, !tbaa !20
  %68 = shl i32 %60, 3
  %69 = call noalias i8* @malloc(i32 %68) #14
  store i8* %69, i8** bitcast (i32** @kernel to i8**), align 4, !tbaa !20
  %70 = call i32 @fread(i8* %65, i32 8, i32 %56, %struct._IO_FILE* %45)
  %71 = load i8*, i8** bitcast (i32** @prolog to i8**), align 4, !tbaa !20
  %72 = call i32 @fread(i8* %71, i32 8, i32 %58, %struct._IO_FILE* %46)
  %73 = load i8*, i8** bitcast (i32** @kernel to i8**), align 4, !tbaa !20
  %74 = call i32 @fread(i8* %73, i32 8, i32 %60, %struct._IO_FILE* %47)
  %75 = call i8* @strcat(i8* nonnull %31, i8* nonnull %25) #14
  %76 = call i32 @strlen(i8* nonnull %31)
  %77 = getelementptr [40 x i8], [40 x i8]* %7, i32 0, i32 %76
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(26) %77, i8* nonnull align 1 dereferenceable(26) getelementptr inbounds ([26 x i8], [26 x i8]* @.str.13, i32 0, i32 0), i32 26, i1 false)
  %78 = call %struct._IO_FILE* @fopen(i8* nonnull %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %12) #14
  %80 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %80) #14
  %81 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([52 x i8], [52 x i8]* @str.34, i32 0, i32 0))
  %82 = call i8* @fgets(i8* nonnull %80, i32 256, %struct._IO_FILE* %48)
  %83 = icmp eq i8* %82, null
  br i1 %83, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %95, %.preheader.preheader
  %84 = phi i32 [ %97, %95 ], [ 0, %.preheader.preheader ]
  %85 = phi i32 [ %96, %95 ], [ 0, %.preheader.preheader ]
  %86 = phi i32 [ %87, %95 ], [ 0, %.preheader.preheader ]
  %87 = add nuw nsw i32 %86, 1
  %88 = icmp eq i32 %86, 0
  br i1 %88, label %89, label %91

89:                                               ; preds = %.preheader
  %90 = call i32 @strtol(i8* nocapture nonnull %80, i8** null, i32 10) #14
  br label %95

91:                                               ; preds = %.preheader
  %92 = icmp eq i32 %87, 2
  br i1 %92, label %93, label %.loopexit.loopexit

93:                                               ; preds = %91
  %94 = call i32 @strtol(i8* nocapture nonnull %80, i8** null, i32 10) #14
  br label %95

95:                                               ; preds = %93, %89
  %96 = phi i32 [ %85, %89 ], [ %94, %93 ]
  %97 = phi i32 [ %90, %89 ], [ %84, %93 ]
  %98 = call i8* @fgets(i8* nonnull %80, i32 256, %struct._IO_FILE* %48)
  %99 = icmp eq i8* %98, null
  br i1 %99, label %.loopexit.loopexit, label %.preheader, !llvm.loop !29

.loopexit.loopexit:                               ; preds = %95, %91
  %.ph = phi i32 [ %96, %95 ], [ %85, %91 ]
  %.ph6 = phi i32 [ %97, %95 ], [ %84, %91 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %1
  %100 = phi i32 [ 0, %1 ], [ %.ph, %.loopexit.loopexit ]
  %101 = phi i32 [ 0, %1 ], [ %.ph6, %.loopexit.loopexit ]
  %102 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([39 x i8], [39 x i8]* @.str.15, i32 0, i32 0), i32 %101, i32 %100)
  %103 = mul nsw i32 %101, %100
  %104 = sdiv i32 %60, %103
  %105 = sdiv i32 %56, %103
  %106 = sdiv i32 %58, %103
  %107 = load i32*, i32** @initCGRA, align 4, !tbaa !20
  %108 = getelementptr inbounds i32, i32* %107, i32 %19
  %109 = getelementptr inbounds i32, i32* %108, i32 2
  store i32 %104, i32* %109, align 4, !tbaa !27
  %110 = getelementptr inbounds i32, i32* %108, i32 3
  store i32 %105, i32* %110, align 4, !tbaa !27
  %111 = getelementptr inbounds i32, i32* %108, i32 4
  store i32 %106, i32* %111, align 4, !tbaa !27
  %112 = load i32, i32* %12, align 4, !tbaa !27
  %113 = sdiv i32 %112, %103
  %114 = getelementptr inbounds i32, i32* %108, i32 6
  store i32 %113, i32* %114, align 4, !tbaa !27
  %115 = call i32 @fclose(%struct._IO_FILE* %45)
  %116 = call i32 @fclose(%struct._IO_FILE* %46)
  %117 = call i32 @fclose(%struct._IO_FILE* %47)
  %118 = call i32 @fclose(%struct._IO_FILE* %78)
  %119 = call i32 @fclose(%struct._IO_FILE* %48)
  %120 = getelementptr inbounds [40 x i8], [40 x i8]* %14, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %120) #14
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %120, i8 0, i32 40, i1 false)
  %121 = call i8* @strcat(i8* nonnull %120, i8* nonnull %25) #14
  %122 = call i32 @strlen(i8* nonnull %120)
  %123 = getelementptr [40 x i8], [40 x i8]* %14, i32 0, i32 %122
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(18) %123, i8* nonnull align 1 dereferenceable(18) getelementptr inbounds ([18 x i8], [18 x i8]* @.str.16, i32 0, i32 0), i32 18, i1 false)
  %124 = bitcast i32* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %124) #14
  store i32 0, i32* %15, align 4, !tbaa !27
  %125 = call %struct._IO_FILE* @fopen(i8* nonnull %120, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %126 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %125, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %15) #14
  %127 = call i32 @fclose(%struct._IO_FILE* %125)
  %128 = load i32, i32* %15, align 4, !tbaa !27
  %129 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.17, i32 0, i32 0), i32 %128)
  %130 = load i32, i32* %15, align 4, !tbaa !27
  %131 = load i32*, i32** @initCGRA, align 4, !tbaa !20
  %132 = getelementptr inbounds i32, i32* %131, i32 %19
  %133 = getelementptr inbounds i32, i32* %132, i32 5
  store i32 %130, i32* %133, align 4, !tbaa !27
  %134 = load i32*, i32** @prolog, align 4, !tbaa !20
  %135 = ptrtoint i32* %134 to i32
  %136 = load i32*, i32** @epilog, align 4, !tbaa !20
  %137 = ptrtoint i32* %136 to i32
  %138 = load i32*, i32** @kernel, align 4, !tbaa !20
  %139 = ptrtoint i32* %138 to i32
  %140 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([55 x i8], [55 x i8]* @.str.18, i32 0, i32 0), i32 %135, i32 %137, i32 %139)
  %141 = load i32*, i32** @prolog, align 4, !tbaa !20
  %142 = ptrtoint i32* %141 to i32
  %143 = load i32*, i32** @prologPtr, align 4, !tbaa !20
  %144 = getelementptr inbounds i32, i32* %143, i32 %18
  store i32 %142, i32* %144, align 4, !tbaa !30
  %145 = load i32*, i32** @epilog, align 4, !tbaa !20
  %146 = ptrtoint i32* %145 to i32
  %147 = load i32*, i32** @epilogPtr, align 4, !tbaa !20
  %148 = getelementptr inbounds i32, i32* %147, i32 %18
  store i32 %146, i32* %148, align 4, !tbaa !30
  %149 = load i32*, i32** @kernel, align 4, !tbaa !20
  %150 = ptrtoint i32* %149 to i32
  %151 = load i32*, i32** @kernelPtr, align 4, !tbaa !20
  %152 = getelementptr inbounds i32, i32* %151, i32 %18
  store i32 %150, i32* %152, align 4, !tbaa !30
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %124) #14
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %120) #14
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %80) #14
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %52) #14
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %51) #14
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %50) #14
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %49) #14
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %32) #14
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %31) #14
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %30) #14
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %29) #14
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %28) #14
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %25) #14
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %23) #14
  ret i32 0
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #8

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #9

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #9

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sprintf(i8* noalias nocapture noundef writeonly, i8* nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare dso_local i8* @strcat(i8* noalias returned writeonly, i8* noalias nocapture readonly) local_unnamed_addr #10

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #8

; Function Attrs: argmemonly nofree nounwind readonly willreturn
declare i32 @strlen(i8* nocapture) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare dso_local noalias noundef %struct._IO_FILE* @fopen(i8* nocapture noundef readonly, i8* nocapture noundef readonly) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fread(i8* nocapture noundef, i32 noundef, i32 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #5

; Function Attrs: inaccessiblememonly nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i32) local_unnamed_addr #12

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #13

; Function Attrs: nofree nounwind
declare dso_local noundef i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fclose(%struct._IO_FILE* nocapture noundef) local_unnamed_addr #5

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #9

; Function Attrs: nofree nounwind
define dso_local i32 @configureCGRA(i32 %0) local_unnamed_addr #3 {
  %2 = alloca [25 x i8], align 1
  %3 = alloca [20 x i8], align 1
  %4 = alloca [40 x i8], align 1
  %5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([14 x i8], [14 x i8]* @str.35, i32 0, i32 0))
  %6 = load i32*, i32** @initCGRA, align 4, !tbaa !20
  %7 = add i32 %0, -1
  %8 = mul i32 %7, 7
  %9 = getelementptr inbounds i32, i32* %6, i32 %8
  %10 = getelementptr inbounds i32, i32* %9, i32 5
  %11 = load i32, i32* %10, align 4, !tbaa !27
  %12 = getelementptr inbounds [25 x i8], [25 x i8]* %2, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %12) #14
  %13 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %13) #14
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(20) %13, i8* nonnull align 1 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @__const.configureCGRA.directoryPath, i32 0, i32 0), i32 20, i1 false)
  %14 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %12, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 %0) #14
  %15 = call i8* @strcat(i8* nonnull %13, i8* nonnull %12) #14
  %16 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([14 x i8], [14 x i8]* @.str.20, i32 0, i32 0), i8* nonnull %12)
  %17 = icmp slt i32 %11, 1
  br i1 %17, label %18, label %24

18:                                               ; preds = %1
  %19 = load i32, i32* @dynamicTCVal, align 4, !tbaa !27
  %20 = add nsw i32 %19, %11
  %21 = load i32*, i32** @initCGRA, align 4, !tbaa !20
  %22 = getelementptr inbounds i32, i32* %21, i32 %8
  %23 = getelementptr inbounds i32, i32* %22, i32 5
  store i32 %20, i32* %23, align 4, !tbaa !27
  br label %24

24:                                               ; preds = %18, %1
  %25 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %25) #14
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %25, i8* nonnull align 1 dereferenceable(40) getelementptr inbounds ([40 x i8], [40 x i8]* @__const.configureCGRA.initCGRAfile, i32 0, i32 0), i32 40, i1 false)
  %26 = call i32 @strlen(i8* nonnull %25)
  %27 = getelementptr [40 x i8], [40 x i8]* %4, i32 0, i32 %26
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(14) %27, i8* nonnull align 1 dereferenceable(14) getelementptr inbounds ([14 x i8], [14 x i8]* @.str.21, i32 0, i32 0), i32 14, i1 false)
  %28 = call %struct._IO_FILE* @fopen(i8* nonnull %25, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.22, i32 0, i32 0))
  br label %29

29:                                               ; preds = %29, %24
  %30 = phi i32 [ 0, %24 ], [ %36, %29 ]
  %31 = load i32*, i32** @initCGRA, align 4, !tbaa !20
  %32 = getelementptr inbounds i32, i32* %31, i32 %8
  %33 = getelementptr inbounds i32, i32* %32, i32 %30
  %34 = load i32, i32* %33, align 4, !tbaa !27
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i32 %34)
  %36 = add nuw nsw i32 %30, 1
  %37 = icmp eq i32 %36, 7
  br i1 %37, label %38, label %29, !llvm.loop !32

38:                                               ; preds = %29
  %39 = load i32*, i32** @epilogPtr, align 4, !tbaa !20
  %40 = getelementptr inbounds i32, i32* %39, i32 %7
  %41 = load i32, i32* %40, align 4, !tbaa !30
  %42 = zext i32 %41 to i64
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %42)
  %44 = load i32*, i32** @prologPtr, align 4, !tbaa !20
  %45 = getelementptr inbounds i32, i32* %44, i32 %7
  %46 = load i32, i32* %45, align 4, !tbaa !30
  %47 = zext i32 %46 to i64
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %47)
  %49 = load i32*, i32** @kernelPtr, align 4, !tbaa !20
  %50 = getelementptr inbounds i32, i32* %49, i32 %7
  %51 = load i32, i32* %50, align 4, !tbaa !30
  %52 = zext i32 %51 to i64
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %52)
  %54 = call i32 @fclose(%struct._IO_FILE* %28)
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %25) #14
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %13) #14
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %12) #14
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: nounwind
define dso_local void @checkTotalLoops() local_unnamed_addr #7 {
  %1 = alloca [40 x i8], align 1
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.36, i32 0, i32 0))
  %3 = getelementptr inbounds [40 x i8], [40 x i8]* %1, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %3) #14
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %3, i8* nonnull align 1 dereferenceable(40) getelementptr inbounds ([40 x i8], [40 x i8]* @__const.checkTotalLoops.myfile, i32 0, i32 0), i32 40, i1 false)
  %4 = call %struct._IO_FILE* @fopen(i8* nonnull %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i32* nonnull @totalLoops) #14
  %6 = tail call i32 @fclose(%struct._IO_FILE* %4)
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %3) #14
  ret void
}

; Function Attrs: nounwind
define dso_local i8* @runOnCGRA() local_unnamed_addr #7 {
  %1 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.37, i32 0, i32 0))
  tail call void asm sideeffect "mov r11,$0", "r"(i32 15) #14, !srcloc !33
  ret i8* null
}

; Function Attrs: nounwind
define dso_local void @accelerateOnCGRA(i32 %0) local_unnamed_addr #7 {
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @str.38, i32 0, i32 0))
  %3 = tail call i32 @configureCGRA(i32 %0)
  %4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([35 x i8], [35 x i8]* @.str.30, i32 0, i32 0), i32 %0)
  %5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.37, i32 0, i32 0)) #14
  tail call void asm sideeffect "mov r11,$0", "r"(i32 15) #14, !srcloc !33
  ret void
}

; Function Attrs: nofree nounwind
define dso_local void @deleteCGRA() local_unnamed_addr #3 {
  %1 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.39, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
define dso_local void @createCGRA() local_unnamed_addr #7 {
  %1 = alloca [40 x i8], align 1
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.40, i32 0, i32 0))
  %3 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.36, i32 0, i32 0)) #14
  %4 = getelementptr inbounds [40 x i8], [40 x i8]* %1, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %4) #14
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %4, i8* nonnull align 1 dereferenceable(40) getelementptr inbounds ([40 x i8], [40 x i8]* @__const.checkTotalLoops.myfile, i32 0, i32 0), i32 40, i1 false) #14
  %5 = call %struct._IO_FILE* @fopen(i8* nonnull %4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)) #14
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i32* nonnull @totalLoops) #14
  %7 = tail call i32 @fclose(%struct._IO_FILE* %5) #14
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %4) #14
  %8 = load i32, i32* @totalLoops, align 4, !tbaa !27
  %9 = mul i32 %8, 28
  %10 = tail call noalias i8* @malloc(i32 %9) #14
  store i8* %10, i8** bitcast (i32** @initCGRA to i8**), align 4, !tbaa !20
  %11 = shl i32 %8, 2
  %12 = tail call noalias i8* @malloc(i32 %11) #14
  store i8* %12, i8** bitcast (i32** @prologPtr to i8**), align 4, !tbaa !20
  %13 = tail call noalias i8* @malloc(i32 %11) #14
  store i8* %13, i8** bitcast (i32** @kernelPtr to i8**), align 4, !tbaa !20
  %14 = tail call noalias i8* @malloc(i32 %11) #14
  store i8* %14, i8** bitcast (i32** @epilogPtr to i8**), align 4, !tbaa !20
  %15 = icmp eq i32 %8, 0
  br i1 %15, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %0
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %16 = phi i32 [ %18, %.preheader ], [ 1, %.preheader.preheader ]
  %17 = tail call i32 @initializeParameters(i32 %16)
  %18 = add i32 %16, 1
  %19 = load i32, i32* @totalLoops, align 4, !tbaa !27
  %20 = icmp ugt i32 %18, %19
  br i1 %20, label %.loopexit.loopexit, label %.preheader, !llvm.loop !34

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  %21 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([35 x i8], [35 x i8]* @str.41, i32 0, i32 0))
  ret void
}

attributes #0 = { norecurse nounwind readnone "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #1 = { nofree nosync nounwind readnone willreturn }
attributes #2 = { norecurse nounwind readonly "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #3 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #4 = { nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #5 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #8 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #9 = { argmemonly nofree nosync nounwind willreturn }
attributes #10 = { argmemonly nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #11 = { argmemonly nofree nounwind readonly willreturn }
attributes #12 = { inaccessiblememonly nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #13 = { "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #14 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"clang version 13.0.0 (https://github.com/MPSLab-ASU/CCF-20.04/ 69d7c3299a1e6f5d4e7173a82d1ebc6a79ac1477)"}
!1 = !{i32 7, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 1, !"min_enum_size", i32 4}
!5 = distinct !{!5, !6, !7, !8, !9}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.CGRA.disable"}
!10 = distinct !{!10, !6, !11, !7, !8}
!11 = !{!"llvm.loop.CGRA.enable"}
!12 = distinct !{!12, !6, !7, !8}
!13 = distinct !{!13, !6, !7, !8}
!14 = !{!15, !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = distinct !{!17, !6, !7, !8, !9}
!18 = distinct !{!18, !6, !11, !7, !8}
!19 = distinct !{!19, !6, !7}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !15, i64 0}
!22 = distinct !{!22, !6, !7, !8, !9}
!23 = distinct !{!23, !6, !11, !7, !8}
!24 = distinct !{!24, !6, !7}
!25 = distinct !{!25, !6, !7, !8, !9}
!26 = distinct !{!26, !6, !11, !7, !8}
!27 = !{!28, !28, i64 0}
!28 = !{!"int", !15, i64 0}
!29 = distinct !{!29, !6, !7}
!30 = !{!31, !31, i64 0}
!31 = !{!"long", !15, i64 0}
!32 = distinct !{!32, !6, !7}
!33 = !{i32 5275}
!34 = distinct !{!34, !6, !7}
