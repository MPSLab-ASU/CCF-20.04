; ModuleID = 'CondDDGGen.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-none-linux-eabi"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [24 x i8] c"***** %d^%d = %d *****\0A\00", align 1
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
@str = private unnamed_addr constant [34 x i8] c"from cgra.c Initialize Parameters\00", align 1
@__const.configureCGRA.directoryPath = private unnamed_addr constant [20 x i8] c"./CGRAExec/L\00\00\00\00\00\00\00\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"/epilog_ins.bin\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"/prolog_ins.bin\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"/kernel_ins.bin\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"/CGRA_config.txt\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [32 x i8] c"\0A**********EPISIZE %d*********\0A\00", align 1
@.str.9 = private unnamed_addr constant [32 x i8] c"\0A**********PROSIZE %d*********\0A\00", align 1
@.str.10 = private unnamed_addr constant [33 x i8] c"\0A**********KERNSIZE %d*********\0A\00", align 1
@.str.11 = private unnamed_addr constant [37 x i8] c"\0A******SIZE OF UNSIGNED LONG%d*****\0A\00", align 1
@.str.12 = private unnamed_addr constant [42 x i8] c"\0A******SIZE OF UNSIGNED LONG LONG%d*****\0A\00", align 1
@.str.13 = private unnamed_addr constant [26 x i8] c"/livevar_st_ins_count.txt\00", align 1
@.str.14 = private unnamed_addr constant [39 x i8] c"\0A************XDIM and YDim are %d, %d\0A\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"/kernel_count.txt\00", align 1
@.str.16 = private unnamed_addr constant [16 x i8] c"Loop Count: %d\0A\00", align 1
@.str.17 = private unnamed_addr constant [55 x i8] c"From FILE: PROLOGPC= %lx, EPILOGPC=%lx,  KernelPC=%lx\0A\00", align 1
@str.34 = private unnamed_addr constant [14 x i8] c"configureCGRA\00", align 1
@.str.19 = private unnamed_addr constant [14 x i8] c"\0Aloopno = %s\0A\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"newTC = %d + %d\0A\00", align 1
@__const.configureCGRA.initCGRAfile = private unnamed_addr constant [40 x i8] c"./CGRAExec/L1\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"/initCGRA.txt\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@str.35 = private unnamed_addr constant [16 x i8] c"checkTotalLoops\00", align 1
@__const.checkTotalLoops.myfile = private unnamed_addr constant [40 x i8] c"./CGRAExec/total_loops.txt\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"%u\00", align 1
@str.36 = private unnamed_addr constant [12 x i8] c"\0A\0ArunOnCGRA\00", align 1
@str.37 = private unnamed_addr constant [19 x i8] c"\0A\0AaccelerateOnCGRA\00", align 1
@.str.30 = private unnamed_addr constant [35 x i8] c"Core will execute loop %u on CGRA\0A\00", align 1
@str.38 = private unnamed_addr constant [15 x i8] c"\0Adeleting cgra\00", align 1
@str.39 = private unnamed_addr constant [11 x i8] c"createCGRA\00", align 1
@str.40 = private unnamed_addr constant [35 x i8] c"Main thread calling CGRA thread...\00", align 1
@gVar1 = common local_unnamed_addr global i32 0
@gVar2 = common local_unnamed_addr global i32 0

; Function Attrs: nofree nounwind
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds i8*, i8** %1, i32 1
  %4 = load i8*, i8** %3, align 4, !tbaa !5
  %5 = tail call i32 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #11
  %6 = icmp sgt i32 %5, 1
  store i32 %5, i32* @gVar1, align 4
  br i1 %6, label %.preheader.preheader, label %.loopexit

.preheader.preheader:                             ; preds = %2
  %7 = sub i32 %5, 1
  %8 = sdiv i32 %7, 1
  store i32 %8, i32* @dynamicTCVal, align 4
  br label %.preheader

.loopexit.loopexit:                               ; preds = %.preheader
  br label %9

9:                                                ; preds = %.loopexit.loopexit
  %10 = load i32, i32* @gVar2, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %9, %2
  %11 = phi i32 [ 1, %2 ], [ %10, %9 ]
  %12 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i32 2, i32 %5, i32 %11)
  ret i32 0

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %13 = phi i32 [ %16, %.preheader ], [ 1, %.preheader.preheader ]
  %14 = phi i32 [ %15, %.preheader ], [ 1, %.preheader.preheader ]
  %15 = shl nsw i32 %14, 1
  %16 = add nuw nsw i32 %13, 1
  %17 = icmp eq i32 %16, %5
  br i1 %17, label %.loopexit.loopexit, label %.preheader, !llvm.loop !9
}

; Function Attrs: nofree nounwind willreturn
declare dso_local i32 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local i32 @initializeParameters(i32 %0) local_unnamed_addr #3 {
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
  %16 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([34 x i8], [34 x i8]* @str, i32 0, i32 0))
  %17 = load i32*, i32** @initCGRA, align 4, !tbaa !5
  %18 = add i32 %0, -1
  %19 = mul i32 %18, 7
  %20 = getelementptr inbounds i32, i32* %17, i32 %19
  store i32 2011168768, i32* %20, align 4, !tbaa !13
  %21 = getelementptr inbounds i32, i32* %20, i32 1
  store i32 2011168768, i32* %21, align 4, !tbaa !13
  %22 = getelementptr inbounds i32, i32* %20, i32 2
  %23 = getelementptr inbounds [25 x i8], [25 x i8]* %2, i32 0, i32 0
  %24 = bitcast i32* %22 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(20) %24, i8 0, i64 20, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %23) #11
  %25 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %25) #11
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(20) %25, i8* nonnull align 1 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @__const.configureCGRA.directoryPath, i32 0, i32 0), i32 20, i1 false)
  %26 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %23, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 %0) #11
  %27 = call i8* @strcat(i8* nonnull %25, i8* nonnull %23) #11
  %28 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %28) #11
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %28, i8 0, i32 40, i1 false)
  %29 = getelementptr inbounds [40 x i8], [40 x i8]* %5, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %29) #11
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %29, i8 0, i32 40, i1 false)
  %30 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %30) #11
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %30, i8 0, i32 40, i1 false)
  %31 = getelementptr inbounds [40 x i8], [40 x i8]* %7, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %31) #11
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %31, i8 0, i32 40, i1 false)
  %32 = getelementptr inbounds [40 x i8], [40 x i8]* %8, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %32) #11
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %32, i8 0, i32 40, i1 false)
  %33 = call i8* @strcat(i8* nonnull %28, i8* nonnull %25) #11
  %34 = call i32 @strlen(i8* nonnull %28)
  %35 = getelementptr [40 x i8], [40 x i8]* %4, i32 0, i32 %34
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %35, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i32 16, i1 false)
  %36 = call i8* @strcat(i8* nonnull %29, i8* nonnull %25) #11
  %37 = call i32 @strlen(i8* nonnull %29)
  %38 = getelementptr [40 x i8], [40 x i8]* %5, i32 0, i32 %37
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %38, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0), i32 16, i1 false)
  %39 = call i8* @strcat(i8* nonnull %30, i8* nonnull %25) #11
  %40 = call i32 @strlen(i8* nonnull %30)
  %41 = getelementptr [40 x i8], [40 x i8]* %6, i32 0, i32 %40
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %41, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0), i32 16, i1 false)
  %42 = call i8* @strcat(i8* nonnull %32, i8* nonnull %25) #11
  %43 = call i32 @strlen(i8* nonnull %32)
  %44 = getelementptr [40 x i8], [40 x i8]* %8, i32 0, i32 %43
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(17) %44, i8* nonnull align 1 dereferenceable(17) getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i32 0, i32 0), i32 17, i1 false)
  %45 = call %struct._IO_FILE* @fopen(i8* nonnull %28, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0))
  %46 = call %struct._IO_FILE* @fopen(i8* nonnull %29, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0))
  %47 = call %struct._IO_FILE* @fopen(i8* nonnull %30, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0))
  %48 = call %struct._IO_FILE* @fopen(i8* nonnull %32, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %49 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %49) #11
  %50 = bitcast i32* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %50) #11
  %51 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %51) #11
  %52 = bitcast i32* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %52) #11
  %53 = call i32 @fread(i8* nonnull %49, i32 4, i32 1, %struct._IO_FILE* %45)
  %54 = call i32 @fread(i8* nonnull %50, i32 4, i32 1, %struct._IO_FILE* %46)
  %55 = call i32 @fread(i8* nonnull %51, i32 4, i32 1, %struct._IO_FILE* %47)
  %56 = load i32, i32* %9, align 4, !tbaa !13
  %57 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8, i32 0, i32 0), i32 %56)
  %58 = load i32, i32* %10, align 4, !tbaa !13
  %59 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i32 0, i32 0), i32 %58)
  %60 = load i32, i32* %11, align 4, !tbaa !13
  %61 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0), i32 %60)
  %62 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([37 x i8], [37 x i8]* @.str.11, i32 0, i32 0), i32 4)
  %63 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.12, i32 0, i32 0), i32 8)
  %64 = shl i32 %56, 3
  %65 = call noalias i8* @malloc(i32 %64) #11
  store i8* %65, i8** bitcast (i32** @epilog to i8**), align 4, !tbaa !5
  %66 = shl i32 %58, 3
  %67 = call noalias i8* @malloc(i32 %66) #11
  store i8* %67, i8** bitcast (i32** @prolog to i8**), align 4, !tbaa !5
  %68 = shl i32 %60, 3
  %69 = call noalias i8* @malloc(i32 %68) #11
  store i8* %69, i8** bitcast (i32** @kernel to i8**), align 4, !tbaa !5
  %70 = call i32 @fread(i8* %65, i32 8, i32 %56, %struct._IO_FILE* %45)
  %71 = load i8*, i8** bitcast (i32** @prolog to i8**), align 4, !tbaa !5
  %72 = call i32 @fread(i8* %71, i32 8, i32 %58, %struct._IO_FILE* %46)
  %73 = load i8*, i8** bitcast (i32** @kernel to i8**), align 4, !tbaa !5
  %74 = call i32 @fread(i8* %73, i32 8, i32 %60, %struct._IO_FILE* %47)
  %75 = call i8* @strcat(i8* nonnull %31, i8* nonnull %25) #11
  %76 = call i32 @strlen(i8* nonnull %31)
  %77 = getelementptr [40 x i8], [40 x i8]* %7, i32 0, i32 %76
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(26) %77, i8* nonnull align 1 dereferenceable(26) getelementptr inbounds ([26 x i8], [26 x i8]* @.str.13, i32 0, i32 0), i32 26, i1 false)
  %78 = call %struct._IO_FILE* @fopen(i8* nonnull %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %12) #11
  %80 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %80) #11
  %81 = call i8* @fgets(i8* nonnull %80, i32 256, %struct._IO_FILE* %48)
  %82 = icmp eq i8* %81, null
  br i1 %82, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %94, %.preheader.preheader
  %83 = phi i32 [ %96, %94 ], [ 0, %.preheader.preheader ]
  %84 = phi i32 [ %95, %94 ], [ 0, %.preheader.preheader ]
  %85 = phi i32 [ %86, %94 ], [ 0, %.preheader.preheader ]
  %86 = add nuw nsw i32 %85, 1
  %87 = icmp eq i32 %85, 0
  br i1 %87, label %88, label %90

88:                                               ; preds = %.preheader
  %89 = call i32 @strtol(i8* nocapture nonnull %80, i8** null, i32 10) #11
  br label %94

90:                                               ; preds = %.preheader
  %91 = icmp eq i32 %86, 2
  br i1 %91, label %92, label %.loopexit.loopexit

92:                                               ; preds = %90
  %93 = call i32 @strtol(i8* nocapture nonnull %80, i8** null, i32 10) #11
  br label %94

94:                                               ; preds = %92, %88
  %95 = phi i32 [ %84, %88 ], [ %93, %92 ]
  %96 = phi i32 [ %89, %88 ], [ %83, %92 ]
  %97 = call i8* @fgets(i8* nonnull %80, i32 256, %struct._IO_FILE* %48)
  %98 = icmp eq i8* %97, null
  br i1 %98, label %.loopexit.loopexit, label %.preheader, !llvm.loop !15

.loopexit.loopexit:                               ; preds = %94, %90
  %.ph = phi i32 [ %95, %94 ], [ %84, %90 ]
  %.ph6 = phi i32 [ %96, %94 ], [ %83, %90 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %1
  %99 = phi i32 [ 0, %1 ], [ %.ph, %.loopexit.loopexit ]
  %100 = phi i32 [ 0, %1 ], [ %.ph6, %.loopexit.loopexit ]
  %101 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([39 x i8], [39 x i8]* @.str.14, i32 0, i32 0), i32 %100, i32 %99)
  %102 = mul nsw i32 %100, %99
  %103 = sdiv i32 %60, %102
  %104 = sdiv i32 %56, %102
  %105 = sdiv i32 %58, %102
  %106 = load i32*, i32** @initCGRA, align 4, !tbaa !5
  %107 = getelementptr inbounds i32, i32* %106, i32 %19
  %108 = getelementptr inbounds i32, i32* %107, i32 2
  store i32 %103, i32* %108, align 4, !tbaa !13
  %109 = getelementptr inbounds i32, i32* %107, i32 3
  store i32 %104, i32* %109, align 4, !tbaa !13
  %110 = getelementptr inbounds i32, i32* %107, i32 4
  store i32 %105, i32* %110, align 4, !tbaa !13
  %111 = load i32, i32* %12, align 4, !tbaa !13
  %112 = sdiv i32 %111, %102
  %113 = getelementptr inbounds i32, i32* %107, i32 6
  store i32 %112, i32* %113, align 4, !tbaa !13
  %114 = call i32 @fclose(%struct._IO_FILE* %45)
  %115 = call i32 @fclose(%struct._IO_FILE* %46)
  %116 = call i32 @fclose(%struct._IO_FILE* %47)
  %117 = call i32 @fclose(%struct._IO_FILE* %78)
  %118 = call i32 @fclose(%struct._IO_FILE* %48)
  %119 = getelementptr inbounds [40 x i8], [40 x i8]* %14, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %119) #11
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %119, i8 0, i32 40, i1 false)
  %120 = call i8* @strcat(i8* nonnull %119, i8* nonnull %25) #11
  %121 = call i32 @strlen(i8* nonnull %119)
  %122 = getelementptr [40 x i8], [40 x i8]* %14, i32 0, i32 %121
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(18) %122, i8* nonnull align 1 dereferenceable(18) getelementptr inbounds ([18 x i8], [18 x i8]* @.str.15, i32 0, i32 0), i32 18, i1 false)
  %123 = bitcast i32* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %123) #11
  store i32 0, i32* %15, align 4, !tbaa !13
  %124 = call %struct._IO_FILE* @fopen(i8* nonnull %119, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %125 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %124, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %15) #11
  %126 = call i32 @fclose(%struct._IO_FILE* %124)
  %127 = load i32, i32* %15, align 4, !tbaa !13
  %128 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16, i32 0, i32 0), i32 %127)
  %129 = load i32, i32* %15, align 4, !tbaa !13
  %130 = load i32*, i32** @initCGRA, align 4, !tbaa !5
  %131 = getelementptr inbounds i32, i32* %130, i32 %19
  %132 = getelementptr inbounds i32, i32* %131, i32 5
  store i32 %129, i32* %132, align 4, !tbaa !13
  %133 = load i32*, i32** @prolog, align 4, !tbaa !5
  %134 = ptrtoint i32* %133 to i32
  %135 = load i32*, i32** @epilog, align 4, !tbaa !5
  %136 = ptrtoint i32* %135 to i32
  %137 = load i32*, i32** @kernel, align 4, !tbaa !5
  %138 = ptrtoint i32* %137 to i32
  %139 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([55 x i8], [55 x i8]* @.str.17, i32 0, i32 0), i32 %134, i32 %136, i32 %138)
  %140 = load i32*, i32** @prolog, align 4, !tbaa !5
  %141 = ptrtoint i32* %140 to i32
  %142 = load i32*, i32** @prologPtr, align 4, !tbaa !5
  %143 = getelementptr inbounds i32, i32* %142, i32 %18
  store i32 %141, i32* %143, align 4, !tbaa !16
  %144 = load i32*, i32** @epilog, align 4, !tbaa !5
  %145 = ptrtoint i32* %144 to i32
  %146 = load i32*, i32** @epilogPtr, align 4, !tbaa !5
  %147 = getelementptr inbounds i32, i32* %146, i32 %18
  store i32 %145, i32* %147, align 4, !tbaa !16
  %148 = load i32*, i32** @kernel, align 4, !tbaa !5
  %149 = ptrtoint i32* %148 to i32
  %150 = load i32*, i32** @kernelPtr, align 4, !tbaa !5
  %151 = getelementptr inbounds i32, i32* %150, i32 %18
  store i32 %149, i32* %151, align 4, !tbaa !16
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %123) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %119) #11
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %80) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %52) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %51) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %50) #11
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %49) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %32) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %31) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %30) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %29) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %28) #11
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %25) #11
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %23) #11
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #4

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #6

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #6

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sprintf(i8* noalias nocapture noundef writeonly, i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare dso_local i8* @strcat(i8* noalias returned writeonly, i8* noalias nocapture readonly) local_unnamed_addr #7

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind readonly willreturn
declare i32 @strlen(i8* nocapture) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare dso_local noalias noundef %struct._IO_FILE* @fopen(i8* nocapture noundef readonly, i8* nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fread(i8* nocapture noundef, i32 noundef, i32 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i32) local_unnamed_addr #9

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #10

; Function Attrs: nofree nounwind
declare dso_local noundef i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fclose(%struct._IO_FILE* nocapture noundef) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #6

; Function Attrs: nofree nounwind
define dso_local i32 @configureCGRA(i32 %0) local_unnamed_addr #0 {
  %2 = alloca [25 x i8], align 1
  %3 = alloca [20 x i8], align 1
  %4 = alloca [40 x i8], align 1
  %5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([14 x i8], [14 x i8]* @str.34, i32 0, i32 0))
  %6 = load i32*, i32** @initCGRA, align 4, !tbaa !5
  %7 = add i32 %0, -1
  %8 = mul i32 %7, 7
  %9 = getelementptr inbounds i32, i32* %6, i32 %8
  %10 = getelementptr inbounds i32, i32* %9, i32 5
  %11 = load i32, i32* %10, align 4, !tbaa !13
  %12 = getelementptr inbounds [25 x i8], [25 x i8]* %2, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %12) #11
  %13 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %13) #11
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(20) %13, i8* nonnull align 1 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @__const.configureCGRA.directoryPath, i32 0, i32 0), i32 20, i1 false)
  %14 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %12, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 %0) #11
  %15 = call i8* @strcat(i8* nonnull %13, i8* nonnull %12) #11
  %16 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([14 x i8], [14 x i8]* @.str.19, i32 0, i32 0), i8* nonnull %12)
  %17 = icmp slt i32 %11, 1
  br i1 %17, label %18, label %25

18:                                               ; preds = %1
  %19 = load i32, i32* @dynamicTCVal, align 4, !tbaa !13
  %20 = add nsw i32 %19, %11
  %21 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([17 x i8], [17 x i8]* @.str.20, i32 0, i32 0), i32 %11, i32 %19)
  %22 = load i32*, i32** @initCGRA, align 4, !tbaa !5
  %23 = getelementptr inbounds i32, i32* %22, i32 %8
  %24 = getelementptr inbounds i32, i32* %23, i32 5
  store i32 %20, i32* %24, align 4, !tbaa !13
  br label %25

25:                                               ; preds = %18, %1
  %26 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %26) #11
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %26, i8* nonnull align 1 dereferenceable(40) getelementptr inbounds ([40 x i8], [40 x i8]* @__const.configureCGRA.initCGRAfile, i32 0, i32 0), i32 40, i1 false)
  %27 = call i32 @strlen(i8* nonnull %26)
  %28 = getelementptr [40 x i8], [40 x i8]* %4, i32 0, i32 %27
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(14) %28, i8* nonnull align 1 dereferenceable(14) getelementptr inbounds ([14 x i8], [14 x i8]* @.str.21, i32 0, i32 0), i32 14, i1 false)
  %29 = call %struct._IO_FILE* @fopen(i8* nonnull %26, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.22, i32 0, i32 0))
  br label %30

30:                                               ; preds = %30, %25
  %31 = phi i32 [ 0, %25 ], [ %37, %30 ]
  %32 = load i32*, i32** @initCGRA, align 4, !tbaa !5
  %33 = getelementptr inbounds i32, i32* %32, i32 %8
  %34 = getelementptr inbounds i32, i32* %33, i32 %31
  %35 = load i32, i32* %34, align 4, !tbaa !13
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i32 %35)
  %37 = add nuw nsw i32 %31, 1
  %38 = icmp eq i32 %37, 7
  br i1 %38, label %39, label %30, !llvm.loop !18

39:                                               ; preds = %30
  %40 = load i32*, i32** @epilogPtr, align 4, !tbaa !5
  %41 = getelementptr inbounds i32, i32* %40, i32 %7
  %42 = load i32, i32* %41, align 4, !tbaa !16
  %43 = zext i32 %42 to i64
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %43)
  %45 = load i32*, i32** @prologPtr, align 4, !tbaa !5
  %46 = getelementptr inbounds i32, i32* %45, i32 %7
  %47 = load i32, i32* %46, align 4, !tbaa !16
  %48 = zext i32 %47 to i64
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %48)
  %50 = load i32*, i32** @kernelPtr, align 4, !tbaa !5
  %51 = getelementptr inbounds i32, i32* %50, i32 %7
  %52 = load i32, i32* %51, align 4, !tbaa !16
  %53 = zext i32 %52 to i64
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %53)
  %55 = call i32 @fclose(%struct._IO_FILE* %29)
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %26) #11
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %13) #11
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %12) #11
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @checkTotalLoops() local_unnamed_addr #3 {
  %1 = alloca [40 x i8], align 1
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.35, i32 0, i32 0))
  %3 = getelementptr inbounds [40 x i8], [40 x i8]* %1, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %3) #11
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %3, i8* nonnull align 1 dereferenceable(40) getelementptr inbounds ([40 x i8], [40 x i8]* @__const.checkTotalLoops.myfile, i32 0, i32 0), i32 40, i1 false)
  %4 = call %struct._IO_FILE* @fopen(i8* nonnull %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i32* nonnull @totalLoops) #11
  %6 = tail call i32 @fclose(%struct._IO_FILE* %4)
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %3) #11
  ret void
}

; Function Attrs: nounwind
define dso_local i8* @runOnCGRA() local_unnamed_addr #3 {
  %1 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.36, i32 0, i32 0))
  tail call void asm sideeffect "mov r11,$0", "r"(i32 15) #11, !srcloc !19
  ret i8* null
}

; Function Attrs: nounwind
define dso_local void @accelerateOnCGRA(i32 %0) local_unnamed_addr #3 {
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @str.37, i32 0, i32 0))
  %3 = tail call i32 @configureCGRA(i32 %0)
  %4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([35 x i8], [35 x i8]* @.str.30, i32 0, i32 0), i32 %0)
  %5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.36, i32 0, i32 0)) #11
  tail call void asm sideeffect "mov r11,$0", "r"(i32 15) #11, !srcloc !19
  ret void
}

; Function Attrs: nofree nounwind
define dso_local void @deleteCGRA() local_unnamed_addr #0 {
  %1 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.38, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
define dso_local void @createCGRA() local_unnamed_addr #3 {
  %1 = alloca [40 x i8], align 1
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.39, i32 0, i32 0))
  %3 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.35, i32 0, i32 0)) #11
  %4 = getelementptr inbounds [40 x i8], [40 x i8]* %1, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %4) #11
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %4, i8* nonnull align 1 dereferenceable(40) getelementptr inbounds ([40 x i8], [40 x i8]* @__const.checkTotalLoops.myfile, i32 0, i32 0), i32 40, i1 false) #11
  %5 = call %struct._IO_FILE* @fopen(i8* nonnull %4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)) #11
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i32* nonnull @totalLoops) #11
  %7 = tail call i32 @fclose(%struct._IO_FILE* %5) #11
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %4) #11
  %8 = load i32, i32* @totalLoops, align 4, !tbaa !13
  %9 = mul i32 %8, 28
  %10 = tail call noalias i8* @malloc(i32 %9) #11
  store i8* %10, i8** bitcast (i32** @initCGRA to i8**), align 4, !tbaa !5
  %11 = shl i32 %8, 2
  %12 = tail call noalias i8* @malloc(i32 %11) #11
  store i8* %12, i8** bitcast (i32** @prologPtr to i8**), align 4, !tbaa !5
  %13 = tail call noalias i8* @malloc(i32 %11) #11
  store i8* %13, i8** bitcast (i32** @kernelPtr to i8**), align 4, !tbaa !5
  %14 = tail call noalias i8* @malloc(i32 %11) #11
  store i8* %14, i8** bitcast (i32** @epilogPtr to i8**), align 4, !tbaa !5
  %15 = icmp eq i32 %8, 0
  br i1 %15, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %0
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %16 = phi i32 [ %18, %.preheader ], [ 1, %.preheader.preheader ]
  %17 = tail call i32 @initializeParameters(i32 %16)
  %18 = add i32 %16, 1
  %19 = load i32, i32* @totalLoops, align 4, !tbaa !13
  %20 = icmp ugt i32 %18, %19
  br i1 %20, label %.loopexit.loopexit, label %.preheader, !llvm.loop !20

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  %21 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([35 x i8], [35 x i8]* @str.40, i32 0, i32 0))
  ret void
}

attributes #0 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #1 = { nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #2 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #3 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #4 = { nofree nounwind }
attributes #5 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nosync nounwind willreturn }
attributes #7 = { argmemonly nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #8 = { argmemonly nofree nounwind readonly willreturn }
attributes #9 = { inaccessiblememonly nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #10 = { "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #11 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"clang version 13.0.0 (https://github.com/MPSLab-ASU/CCF-20.04/ 05285de7579f417a4d73ad832b8f4cc497f25235)"}
!1 = !{i32 7, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 1, !"min_enum_size", i32 4}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11, !12}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.CGRA.enable"}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !7, i64 0}
!15 = distinct !{!15, !10, !12}
!16 = !{!17, !17, i64 0}
!17 = !{!"long", !7, i64 0}
!18 = distinct !{!18, !10, !12}
!19 = !{i32 5341}
!20 = distinct !{!20, !10, !12}
