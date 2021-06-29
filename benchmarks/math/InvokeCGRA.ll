; ModuleID = 'InvokeCGRA.bc'
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

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @pow(i32 %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %.loopexit, label %4

4:                                                ; preds = %2
  %5 = icmp sgt i32 %1, 0
  br i1 %5, label %6, label %.loopexit

6:                                                ; preds = %4
  %7 = icmp ult i32 %1, 4
  br i1 %7, label %.preheader, label %8

8:                                                ; preds = %6
  %9 = and i32 %1, -4
  %10 = insertelement <4 x i32> <i32 poison, i32 1, i32 1, i32 1>, i32 %0, i32 0
  %11 = insertelement <4 x i32> poison, i32 %0, i32 0
  %12 = shufflevector <4 x i32> %11, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %13

13:                                               ; preds = %13, %8
  %14 = phi i32 [ 0, %8 ], [ %17, %13 ]
  %15 = phi <4 x i32> [ %10, %8 ], [ %16, %13 ]
  %16 = mul <4 x i32> %15, %12
  %17 = add i32 %14, 4
  %18 = icmp eq i32 %17, %9
  br i1 %18, label %19, label %13, !llvm.loop !5

19:                                               ; preds = %13
  %.lcssa1 = phi <4 x i32> [ %16, %13 ]
  %20 = tail call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %.lcssa1)
  %21 = icmp eq i32 %9, %1
  br i1 %21, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %19, %6
  %.ph = phi i32 [ %9, %19 ], [ 0, %6 ]
  %.ph6 = phi i32 [ %20, %19 ], [ %0, %6 ]
  br label %22

22:                                               ; preds = %22, %.preheader
  %23 = phi i32 [ %26, %22 ], [ %.ph, %.preheader ]
  %24 = phi i32 [ %25, %22 ], [ %.ph6, %.preheader ]
  %25 = mul nsw i32 %24, %0
  %26 = add nuw nsw i32 %23, 1
  %27 = icmp eq i32 %26, %1
  br i1 %27, label %.loopexit.loopexit, label %22, !llvm.loop !9

.loopexit.loopexit:                               ; preds = %22
  %.lcssa = phi i32 [ %25, %22 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %19, %4, %2
  %28 = phi i32 [ 1, %2 ], [ %0, %4 ], [ %20, %19 ], [ %.lcssa, %.loopexit.loopexit ]
  ret i32 %28
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
  store i32 %7, i32* @gVar4, align 4
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
  br i1 %19, label %20, label %14, !llvm.loop !10

20:                                               ; preds = %14
  %.lcssa = phi <4 x i32> [ %17, %14 ]
  %21 = tail call i32 @llvm.vector.reduce.mul.v4i32(<4 x i32> %.lcssa)
  %22 = icmp eq i32 %7, %10
  br i1 %22, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %20, %6
  %.ph = phi i32 [ %10, %20 ], [ 0, %6 ]
  %.ph7 = phi i32 [ %21, %20 ], [ %0, %6 ]
  store i32 %.ph, i32* @gVar1, align 4
  store i32 %.ph7, i32* @gVar2, align 4
  store i32 %0, i32* @gVar3, align 4
  %23 = sub i32 %7, %.ph
  %24 = sdiv i32 %23, 1
  store i32 %24, i32* @dynamicTCVal, align 4
  br label %25

25:                                               ; preds = %.preheader
  call void @accelerateOnCGRA(i32 1)
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %25
  br label %26

26:                                               ; preds = %.loopexit.loopexit
  %27 = load i32, i32* @gVar5, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %26, %20, %4, %2
  %28 = phi i32 [ 1, %2 ], [ %0, %4 ], [ %21, %20 ], [ %27, %26 ]
  ret i32 %28
}

; Function Attrs: norecurse nounwind readonly
define dso_local i32 @bin_2_dec(i8* nocapture readonly %0, i32 %1) local_unnamed_addr #2 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %.preheader.preheader, label %.loopexit2

.preheader.preheader:                             ; preds = %2
  br label %.preheader

.loopexit2.loopexit:                              ; preds = %.loopexit
  %.lcssa2 = phi i32 [ %24, %.loopexit ]
  br label %.loopexit2

.loopexit2:                                       ; preds = %14, %.loopexit2.loopexit, %2
  %4 = phi i32 [ 0, %2 ], [ %15, %14 ], [ %.lcssa2, %.loopexit2.loopexit ]
  ret i32 %4

.preheader:                                       ; preds = %.loopexit, %.preheader.preheader
  %5 = phi i32 [ %7, %.loopexit ], [ %1, %.preheader.preheader ]
  %6 = phi i32 [ %24, %.loopexit ], [ 0, %.preheader.preheader ]
  %7 = add nsw i32 %5, -1
  %8 = sub nuw nsw i32 %1, %5
  %9 = getelementptr inbounds i8, i8* %0, i32 %8
  %10 = load i8, i8* %9, align 1, !tbaa !12
  %11 = icmp eq i8 %10, 49
  br i1 %11, label %12, label %.loopexit

12:                                               ; preds = %.preheader
  %13 = icmp eq i32 %7, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %12
  %.lcssa = phi i32 [ %6, %12 ]
  %15 = or i32 %.lcssa, 1
  br label %.loopexit2

16:                                               ; preds = %12
  %17 = icmp sgt i32 %5, 2
  br i1 %17, label %18, label %.loopexit

18:                                               ; preds = %16
  %19 = add nsw i32 %5, -2
  store i32 %19, i32* @gVar6, align 4
  br label %20

20:                                               ; preds = %18
  call void @accelerateOnCGRA(i32 2)
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %20
  br label %21

21:                                               ; preds = %.loopexit.loopexit
  %22 = load i32, i32* @gVar7, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %21, %16, %.preheader
  %23 = phi i32 [ 0, %.preheader ], [ 2, %16 ], [ %22, %21 ]
  %24 = add nsw i32 %23, %6
  %25 = icmp sgt i32 %5, 1
  br i1 %25, label %.preheader, label %.loopexit2.loopexit, !llvm.loop !15
}

; Function Attrs: nofree nounwind
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #3 {
  %3 = getelementptr inbounds i8*, i8** %1, i32 1
  %4 = load i8*, i8** %3, align 4, !tbaa !16
  %5 = tail call i32 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #14
  %6 = sdiv i32 %5, 100
  %7 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = add i32 %5, -100
  %9 = icmp ult i32 %8, 100
  br i1 %9, label %10, label %40

10:                                               ; preds = %2
  %11 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.6, i32 0, i32 0))
  %12 = load i8*, i8** %3, align 4, !tbaa !16
  %13 = tail call i32 @strtol(i8* nocapture nonnull %12, i8** null, i32 10) #14
  %14 = add nsw i32 %13, -100
  %15 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i32 %14)
  %16 = icmp sgt i32 %13, 100
  br i1 %16, label %.preheader.preheader, label %.loopexit2

.preheader.preheader:                             ; preds = %10
  br label %.preheader

.preheader:                                       ; preds = %.loopexit, %.preheader.preheader
  %17 = phi i32 [ %19, %.loopexit ], [ %14, %.preheader.preheader ]
  %18 = phi i32 [ %36, %.loopexit ], [ 0, %.preheader.preheader ]
  %19 = add nsw i32 %17, -1
  %20 = sub nuw nsw i32 %14, %17
  %21 = lshr i32 40545, %20
  %22 = and i32 %21, 1
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %.loopexit, label %24

24:                                               ; preds = %.preheader
  %25 = icmp eq i32 %19, 0
  br i1 %25, label %26, label %28

26:                                               ; preds = %24
  %.lcssa = phi i32 [ %18, %24 ]
  %27 = or i32 %.lcssa, 1
  br label %.loopexit2

28:                                               ; preds = %24
  %29 = icmp sgt i32 %17, 2
  br i1 %29, label %30, label %.loopexit

30:                                               ; preds = %28
  %31 = add nsw i32 %17, -2
  store i32 %31, i32* @gVar8, align 4
  br label %32

32:                                               ; preds = %30
  call void @accelerateOnCGRA(i32 3)
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %32
  br label %33

33:                                               ; preds = %.loopexit.loopexit
  %34 = load i32, i32* @gVar9, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %33, %28, %.preheader
  %35 = phi i32 [ 0, %.preheader ], [ 2, %28 ], [ %34, %33 ]
  %36 = add nsw i32 %35, %18
  %37 = icmp sgt i32 %17, 1
  br i1 %37, label %.preheader, label %.loopexit2.loopexit, !llvm.loop !18

.loopexit2.loopexit:                              ; preds = %.loopexit
  %.lcssa2 = phi i32 [ %36, %.loopexit ]
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %26, %10
  %38 = phi i32 [ 0, %10 ], [ %27, %26 ], [ %.lcssa2, %.loopexit2.loopexit ]
  %39 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i32 %38)
  br label %59

40:                                               ; preds = %2
  %41 = add i32 %5, 99
  %42 = icmp ult i32 %41, 199
  br i1 %42, label %59, label %43

43:                                               ; preds = %40
  %44 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str, i32 0, i32 0))
  %45 = load i8*, i8** %3, align 4, !tbaa !16
  %46 = tail call i32 @strtol(i8* nocapture nonnull %45, i8** null, i32 10) #14
  %47 = mul nsw i32 %6, -100
  %48 = add i32 %46, %47
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %.loopexit3, label %50

50:                                               ; preds = %43
  %51 = icmp sgt i32 %48, 1
  br i1 %51, label %52, label %.loopexit3

52:                                               ; preds = %50
  %53 = add nsw i32 %48, -1
  store i32 %53, i32* @gVar10, align 4
  br label %54

54:                                               ; preds = %52
  call void @accelerateOnCGRA(i32 4)
  br label %.loopexit3.loopexit

.loopexit3.loopexit:                              ; preds = %54
  br label %55

55:                                               ; preds = %.loopexit3.loopexit
  %56 = load i32, i32* @gVar11, align 4
  br label %.loopexit3

.loopexit3:                                       ; preds = %55, %50, %43
  %57 = phi i32 [ 1, %43 ], [ 2, %50 ], [ %56, %55 ]
  %58 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i32 %48, i32 %57)
  br label %59

59:                                               ; preds = %.loopexit3, %40, %.loopexit2
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
  %17 = load i32*, i32** @initCGRA, align 4, !tbaa !16
  %18 = add i32 %0, -1
  %19 = mul i32 %18, 7
  %20 = getelementptr inbounds i32, i32* %17, i32 %19
  store i32 2011168768, i32* %20, align 4, !tbaa !19
  %21 = getelementptr inbounds i32, i32* %20, i32 1
  store i32 2011168768, i32* %21, align 4, !tbaa !19
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
  %56 = load i32, i32* %9, align 4, !tbaa !19
  %57 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8, i32 0, i32 0), i32 %56)
  %58 = load i32, i32* %10, align 4, !tbaa !19
  %59 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i32 0, i32 0), i32 %58)
  %60 = load i32, i32* %11, align 4, !tbaa !19
  %61 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0), i32 %60)
  %62 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([37 x i8], [37 x i8]* @.str.11, i32 0, i32 0), i32 4)
  %63 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.12, i32 0, i32 0), i32 8)
  %64 = shl i32 %56, 3
  %65 = call noalias i8* @malloc(i32 %64) #14
  store i8* %65, i8** bitcast (i32** @epilog to i8**), align 4, !tbaa !16
  %66 = shl i32 %58, 3
  %67 = call noalias i8* @malloc(i32 %66) #14
  store i8* %67, i8** bitcast (i32** @prolog to i8**), align 4, !tbaa !16
  %68 = shl i32 %60, 3
  %69 = call noalias i8* @malloc(i32 %68) #14
  store i8* %69, i8** bitcast (i32** @kernel to i8**), align 4, !tbaa !16
  %70 = call i32 @fread(i8* %65, i32 8, i32 %56, %struct._IO_FILE* %45)
  %71 = load i8*, i8** bitcast (i32** @prolog to i8**), align 4, !tbaa !16
  %72 = call i32 @fread(i8* %71, i32 8, i32 %58, %struct._IO_FILE* %46)
  %73 = load i8*, i8** bitcast (i32** @kernel to i8**), align 4, !tbaa !16
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
  br i1 %99, label %.loopexit.loopexit, label %.preheader, !llvm.loop !21

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
  %107 = load i32*, i32** @initCGRA, align 4, !tbaa !16
  %108 = getelementptr inbounds i32, i32* %107, i32 %19
  %109 = getelementptr inbounds i32, i32* %108, i32 2
  store i32 %104, i32* %109, align 4, !tbaa !19
  %110 = getelementptr inbounds i32, i32* %108, i32 3
  store i32 %105, i32* %110, align 4, !tbaa !19
  %111 = getelementptr inbounds i32, i32* %108, i32 4
  store i32 %106, i32* %111, align 4, !tbaa !19
  %112 = load i32, i32* %12, align 4, !tbaa !19
  %113 = sdiv i32 %112, %103
  %114 = getelementptr inbounds i32, i32* %108, i32 6
  store i32 %113, i32* %114, align 4, !tbaa !19
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
  store i32 0, i32* %15, align 4, !tbaa !19
  %125 = call %struct._IO_FILE* @fopen(i8* nonnull %120, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %126 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %125, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %15) #14
  %127 = call i32 @fclose(%struct._IO_FILE* %125)
  %128 = load i32, i32* %15, align 4, !tbaa !19
  %129 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.17, i32 0, i32 0), i32 %128)
  %130 = load i32, i32* %15, align 4, !tbaa !19
  %131 = load i32*, i32** @initCGRA, align 4, !tbaa !16
  %132 = getelementptr inbounds i32, i32* %131, i32 %19
  %133 = getelementptr inbounds i32, i32* %132, i32 5
  store i32 %130, i32* %133, align 4, !tbaa !19
  %134 = load i32*, i32** @prolog, align 4, !tbaa !16
  %135 = ptrtoint i32* %134 to i32
  %136 = load i32*, i32** @epilog, align 4, !tbaa !16
  %137 = ptrtoint i32* %136 to i32
  %138 = load i32*, i32** @kernel, align 4, !tbaa !16
  %139 = ptrtoint i32* %138 to i32
  %140 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([55 x i8], [55 x i8]* @.str.18, i32 0, i32 0), i32 %135, i32 %137, i32 %139)
  %141 = load i32*, i32** @prolog, align 4, !tbaa !16
  %142 = ptrtoint i32* %141 to i32
  %143 = load i32*, i32** @prologPtr, align 4, !tbaa !16
  %144 = getelementptr inbounds i32, i32* %143, i32 %18
  store i32 %142, i32* %144, align 4, !tbaa !22
  %145 = load i32*, i32** @epilog, align 4, !tbaa !16
  %146 = ptrtoint i32* %145 to i32
  %147 = load i32*, i32** @epilogPtr, align 4, !tbaa !16
  %148 = getelementptr inbounds i32, i32* %147, i32 %18
  store i32 %146, i32* %148, align 4, !tbaa !22
  %149 = load i32*, i32** @kernel, align 4, !tbaa !16
  %150 = ptrtoint i32* %149 to i32
  %151 = load i32*, i32** @kernelPtr, align 4, !tbaa !16
  %152 = getelementptr inbounds i32, i32* %151, i32 %18
  store i32 %150, i32* %152, align 4, !tbaa !22
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
  %6 = load i32*, i32** @initCGRA, align 4, !tbaa !16
  %7 = add i32 %0, -1
  %8 = mul i32 %7, 7
  %9 = getelementptr inbounds i32, i32* %6, i32 %8
  %10 = getelementptr inbounds i32, i32* %9, i32 5
  %11 = load i32, i32* %10, align 4, !tbaa !19
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
  %19 = load i32, i32* @dynamicTCVal, align 4, !tbaa !19
  %20 = add nsw i32 %19, %11
  %21 = load i32*, i32** @initCGRA, align 4, !tbaa !16
  %22 = getelementptr inbounds i32, i32* %21, i32 %8
  %23 = getelementptr inbounds i32, i32* %22, i32 5
  store i32 %20, i32* %23, align 4, !tbaa !19
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
  %31 = load i32*, i32** @initCGRA, align 4, !tbaa !16
  %32 = getelementptr inbounds i32, i32* %31, i32 %8
  %33 = getelementptr inbounds i32, i32* %32, i32 %30
  %34 = load i32, i32* %33, align 4, !tbaa !19
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i32 %34)
  %36 = add nuw nsw i32 %30, 1
  %37 = icmp eq i32 %36, 7
  br i1 %37, label %38, label %29, !llvm.loop !24

38:                                               ; preds = %29
  %39 = load i32*, i32** @epilogPtr, align 4, !tbaa !16
  %40 = getelementptr inbounds i32, i32* %39, i32 %7
  %41 = load i32, i32* %40, align 4, !tbaa !22
  %42 = zext i32 %41 to i64
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %42)
  %44 = load i32*, i32** @prologPtr, align 4, !tbaa !16
  %45 = getelementptr inbounds i32, i32* %44, i32 %7
  %46 = load i32, i32* %45, align 4, !tbaa !22
  %47 = zext i32 %46 to i64
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %47)
  %49 = load i32*, i32** @kernelPtr, align 4, !tbaa !16
  %50 = getelementptr inbounds i32, i32* %49, i32 %7
  %51 = load i32, i32* %50, align 4, !tbaa !22
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
  tail call void asm sideeffect "mov r11,$0", "r"(i32 15) #14, !srcloc !25
  ret i8* null
}

; Function Attrs: nounwind
define dso_local void @accelerateOnCGRA(i32 %0) local_unnamed_addr #7 {
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @str.38, i32 0, i32 0))
  %3 = tail call i32 @configureCGRA(i32 %0)
  %4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([35 x i8], [35 x i8]* @.str.30, i32 0, i32 0), i32 %0)
  %5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.37, i32 0, i32 0)) #14
  tail call void asm sideeffect "mov r11,$0", "r"(i32 15) #14, !srcloc !25
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
  %8 = load i32, i32* @totalLoops, align 4, !tbaa !19
  %9 = mul i32 %8, 28
  %10 = tail call noalias i8* @malloc(i32 %9) #14
  store i8* %10, i8** bitcast (i32** @initCGRA to i8**), align 4, !tbaa !16
  %11 = shl i32 %8, 2
  %12 = tail call noalias i8* @malloc(i32 %11) #14
  store i8* %12, i8** bitcast (i32** @prologPtr to i8**), align 4, !tbaa !16
  %13 = tail call noalias i8* @malloc(i32 %11) #14
  store i8* %13, i8** bitcast (i32** @kernelPtr to i8**), align 4, !tbaa !16
  %14 = tail call noalias i8* @malloc(i32 %11) #14
  store i8* %14, i8** bitcast (i32** @epilogPtr to i8**), align 4, !tbaa !16
  %15 = icmp eq i32 %8, 0
  br i1 %15, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %0
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %16 = phi i32 [ %18, %.preheader ], [ 1, %.preheader.preheader ]
  %17 = tail call i32 @initializeParameters(i32 %16)
  %18 = add i32 %16, 1
  %19 = load i32, i32* @totalLoops, align 4, !tbaa !19
  %20 = icmp ugt i32 %18, %19
  br i1 %20, label %.loopexit.loopexit, label %.preheader, !llvm.loop !26

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
!5 = distinct !{!5, !6, !7, !8}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = distinct !{!9, !6, !7, !8}
!10 = distinct !{!10, !6, !7, !8, !11}
!11 = !{!"llvm.loop.CGRA.disable"}
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = distinct !{!15, !6, !7}
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = distinct !{!18, !6, !7}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !13, i64 0}
!21 = distinct !{!21, !6, !7}
!22 = !{!23, !23, i64 0}
!23 = !{!"long", !13, i64 0}
!24 = distinct !{!24, !6, !7}
!25 = !{i32 5275}
!26 = distinct !{!26, !6, !7}
