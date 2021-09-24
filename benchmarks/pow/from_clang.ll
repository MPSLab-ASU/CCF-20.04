; ModuleID = '/home/local/ASUAD/quoclon1/publish_ccf_github/scripts/CGRALib/cgra.c'
source_filename = "/home/local/ASUAD/quoclon1/publish_ccf_github/scripts/CGRALib/cgra.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-none-linux-eabi"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@totalLoops = dso_local global i32 0, align 4, !dbg !0
@dynamicTCVal = dso_local local_unnamed_addr global i32 0, align 4, !dbg !16
@initCGRA = dso_local local_unnamed_addr global i32* null, align 4, !dbg !36
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
@epilog = dso_local local_unnamed_addr global i32* null, align 4, !dbg !22
@prolog = dso_local local_unnamed_addr global i32* null, align 4, !dbg !19
@kernel = dso_local local_unnamed_addr global i32* null, align 4, !dbg !24
@.str.13 = private unnamed_addr constant [26 x i8] c"/livevar_st_ins_count.txt\00", align 1
@.str.14 = private unnamed_addr constant [39 x i8] c"\0A************XDIM and YDim are %d, %d\0A\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"/kernel_count.txt\00", align 1
@.str.16 = private unnamed_addr constant [16 x i8] c"Loop Count: %d\0A\00", align 1
@.str.17 = private unnamed_addr constant [55 x i8] c"From FILE: PROLOGPC= %lx, EPILOGPC=%lx,  KernelPC=%lx\0A\00", align 1
@prologPtr = dso_local local_unnamed_addr global i32* null, align 4, !dbg !30
@epilogPtr = dso_local local_unnamed_addr global i32* null, align 4, !dbg !34
@kernelPtr = dso_local local_unnamed_addr global i32* null, align 4, !dbg !32
@__const.configureCGRA.directoryPath = private unnamed_addr constant [20 x i8] c"./CGRAExec/L\00\00\00\00\00\00\00\00", align 1
@.str.19 = private unnamed_addr constant [14 x i8] c"\0Aloopno = %s\0A\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"newTC = %d + %d\0A\00", align 1
@__const.configureCGRA.initCGRAfile = private unnamed_addr constant [40 x i8] c"./CGRAExec/L1\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"/initCGRA.txt\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@__const.checkTotalLoops.myfile = private unnamed_addr constant [40 x i8] c"./CGRAExec/total_loops.txt\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"%u\00", align 1
@.str.30 = private unnamed_addr constant [35 x i8] c"Core will execute loop %u on CGRA\0A\00", align 1
@ArrPtr = dso_local local_unnamed_addr global i32* null, align 4, !dbg !26
@pth = dso_local local_unnamed_addr global i32 0, align 4, !dbg !38
@str = private unnamed_addr constant [34 x i8] c"from cgra.c Initialize Parameters\00", align 1
@str.34 = private unnamed_addr constant [14 x i8] c"configureCGRA\00", align 1
@str.35 = private unnamed_addr constant [16 x i8] c"checkTotalLoops\00", align 1
@str.36 = private unnamed_addr constant [12 x i8] c"\0A\0ArunOnCGRA\00", align 1
@str.37 = private unnamed_addr constant [19 x i8] c"\0A\0AaccelerateOnCGRA\00", align 1
@str.38 = private unnamed_addr constant [15 x i8] c"\0Adeleting cgra\00", align 1
@str.39 = private unnamed_addr constant [11 x i8] c"createCGRA\00", align 1
@str.40 = private unnamed_addr constant [35 x i8] c"Main thread calling CGRA thread...\00", align 1

; Function Attrs: nounwind
define dso_local i32 @initializeParameters(i32 %0) local_unnamed_addr #0 !dbg !47 {
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
  call void @llvm.dbg.value(metadata i32 %0, metadata !52, metadata !DIExpression()), !dbg !148
  %16 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([34 x i8], [34 x i8]* @str, i32 0, i32 0)), !dbg !149
  call void @llvm.dbg.value(metadata i32 0, metadata !53, metadata !DIExpression()), !dbg !148
  %17 = load i32*, i32** @initCGRA, align 4, !dbg !151, !tbaa !152
  %18 = add i32 %0, -1, !dbg !156
  %19 = mul i32 %18, 7, !dbg !157
  %20 = getelementptr inbounds i32, i32* %17, i32 %19, !dbg !158
  store i32 2011168768, i32* %20, align 4, !dbg !159, !tbaa !160
  %21 = getelementptr inbounds i32, i32* %20, i32 1, !dbg !162
  store i32 2011168768, i32* %21, align 4, !dbg !163, !tbaa !160
  %22 = getelementptr inbounds i32, i32* %20, i32 2, !dbg !164
  %23 = getelementptr inbounds [25 x i8], [25 x i8]* %2, i32 0, i32 0, !dbg !165
  %24 = bitcast i32* %22 to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(20) %24, i8 0, i64 20, i1 false), !dbg !166
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %23) #12, !dbg !165
  call void @llvm.dbg.declare(metadata [25 x i8]* %2, metadata !119, metadata !DIExpression()), !dbg !167
  %25 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i32 0, i32 0, !dbg !168
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %25) #12, !dbg !168
  call void @llvm.dbg.declare(metadata [20 x i8]* %3, metadata !123, metadata !DIExpression()), !dbg !169
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(20) %25, i8* nonnull align 1 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @__const.configureCGRA.directoryPath, i32 0, i32 0), i32 20, i1 false), !dbg !169
  %26 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %23, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 %0) #12, !dbg !170
  %27 = call i8* @strcat(i8* nonnull %25, i8* nonnull %23) #12, !dbg !171
  %28 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i32 0, i32 0, !dbg !172
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %28) #12, !dbg !172
  call void @llvm.dbg.declare(metadata [40 x i8]* %4, metadata !127, metadata !DIExpression()), !dbg !173
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %28, i8 0, i32 40, i1 false), !dbg !173
  %29 = getelementptr inbounds [40 x i8], [40 x i8]* %5, i32 0, i32 0, !dbg !174
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %29) #12, !dbg !174
  call void @llvm.dbg.declare(metadata [40 x i8]* %5, metadata !128, metadata !DIExpression()), !dbg !175
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %29, i8 0, i32 40, i1 false), !dbg !175
  %30 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i32 0, i32 0, !dbg !176
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %30) #12, !dbg !176
  call void @llvm.dbg.declare(metadata [40 x i8]* %6, metadata !129, metadata !DIExpression()), !dbg !177
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %30, i8 0, i32 40, i1 false), !dbg !177
  %31 = getelementptr inbounds [40 x i8], [40 x i8]* %7, i32 0, i32 0, !dbg !178
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %31) #12, !dbg !178
  call void @llvm.dbg.declare(metadata [40 x i8]* %7, metadata !130, metadata !DIExpression()), !dbg !179
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %31, i8 0, i32 40, i1 false), !dbg !179
  %32 = getelementptr inbounds [40 x i8], [40 x i8]* %8, i32 0, i32 0, !dbg !180
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %32) #12, !dbg !180
  call void @llvm.dbg.declare(metadata [40 x i8]* %8, metadata !131, metadata !DIExpression()), !dbg !181
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %32, i8 0, i32 40, i1 false), !dbg !181
  %33 = call i8* @strcat(i8* nonnull %28, i8* nonnull %25) #12, !dbg !182
  %34 = call i32 @strlen(i8* nonnull %28), !dbg !183
  %35 = getelementptr [40 x i8], [40 x i8]* %4, i32 0, i32 %34, !dbg !183
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %35, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i32 16, i1 false), !dbg !183
  %36 = call i8* @strcat(i8* nonnull %29, i8* nonnull %25) #12, !dbg !184
  %37 = call i32 @strlen(i8* nonnull %29), !dbg !185
  %38 = getelementptr [40 x i8], [40 x i8]* %5, i32 0, i32 %37, !dbg !185
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %38, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0), i32 16, i1 false), !dbg !185
  %39 = call i8* @strcat(i8* nonnull %30, i8* nonnull %25) #12, !dbg !186
  %40 = call i32 @strlen(i8* nonnull %30), !dbg !187
  %41 = getelementptr [40 x i8], [40 x i8]* %6, i32 0, i32 %40, !dbg !187
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %41, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0), i32 16, i1 false), !dbg !187
  %42 = call i8* @strcat(i8* nonnull %32, i8* nonnull %25) #12, !dbg !188
  %43 = call i32 @strlen(i8* nonnull %32), !dbg !189
  %44 = getelementptr [40 x i8], [40 x i8]* %8, i32 0, i32 %43, !dbg !189
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(17) %44, i8* nonnull align 1 dereferenceable(17) getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i32 0, i32 0), i32 17, i1 false), !dbg !189
  %45 = call %struct._IO_FILE* @fopen(i8* nonnull %28, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0)), !dbg !190
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %45, metadata !54, metadata !DIExpression()), !dbg !148
  %46 = call %struct._IO_FILE* @fopen(i8* nonnull %29, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0)), !dbg !191
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %46, metadata !115, metadata !DIExpression()), !dbg !148
  %47 = call %struct._IO_FILE* @fopen(i8* nonnull %30, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0)), !dbg !192
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %47, metadata !116, metadata !DIExpression()), !dbg !148
  %48 = call %struct._IO_FILE* @fopen(i8* nonnull %32, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !193
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %48, metadata !118, metadata !DIExpression()), !dbg !148
  %49 = bitcast i32* %9 to i8*, !dbg !194
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %49) #12, !dbg !194
  %50 = bitcast i32* %10 to i8*, !dbg !194
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %50) #12, !dbg !194
  %51 = bitcast i32* %11 to i8*, !dbg !194
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %51) #12, !dbg !194
  %52 = bitcast i32* %12 to i8*, !dbg !194
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %52) #12, !dbg !194
  call void @llvm.dbg.value(metadata i32* %9, metadata !132, metadata !DIExpression(DW_OP_deref)), !dbg !148
  %53 = call i32 @fread(i8* nonnull %49, i32 4, i32 1, %struct._IO_FILE* %45), !dbg !195
  call void @llvm.dbg.value(metadata i32* %10, metadata !133, metadata !DIExpression(DW_OP_deref)), !dbg !148
  %54 = call i32 @fread(i8* nonnull %50, i32 4, i32 1, %struct._IO_FILE* %46), !dbg !196
  call void @llvm.dbg.value(metadata i32* %11, metadata !134, metadata !DIExpression(DW_OP_deref)), !dbg !148
  %55 = call i32 @fread(i8* nonnull %51, i32 4, i32 1, %struct._IO_FILE* %47), !dbg !197
  %56 = load i32, i32* %9, align 4, !dbg !198, !tbaa !160
  call void @llvm.dbg.value(metadata i32 %56, metadata !132, metadata !DIExpression()), !dbg !148
  %57 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8, i32 0, i32 0), i32 %56), !dbg !199
  %58 = load i32, i32* %10, align 4, !dbg !200, !tbaa !160
  call void @llvm.dbg.value(metadata i32 %58, metadata !133, metadata !DIExpression()), !dbg !148
  %59 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i32 0, i32 0), i32 %58), !dbg !201
  %60 = load i32, i32* %11, align 4, !dbg !202, !tbaa !160
  call void @llvm.dbg.value(metadata i32 %60, metadata !134, metadata !DIExpression()), !dbg !148
  %61 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0), i32 %60), !dbg !203
  %62 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([37 x i8], [37 x i8]* @.str.11, i32 0, i32 0), i32 4), !dbg !204
  %63 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.12, i32 0, i32 0), i32 8), !dbg !205
  call void @llvm.dbg.value(metadata i32 %56, metadata !132, metadata !DIExpression()), !dbg !148
  %64 = shl i32 %56, 3, !dbg !206
  %65 = call noalias i8* @malloc(i32 %64) #12, !dbg !207
  store i8* %65, i8** bitcast (i32** @epilog to i8**), align 4, !dbg !208, !tbaa !152
  call void @llvm.dbg.value(metadata i32 %58, metadata !133, metadata !DIExpression()), !dbg !148
  %66 = shl i32 %58, 3, !dbg !209
  %67 = call noalias i8* @malloc(i32 %66) #12, !dbg !210
  store i8* %67, i8** bitcast (i32** @prolog to i8**), align 4, !dbg !211, !tbaa !152
  call void @llvm.dbg.value(metadata i32 %60, metadata !134, metadata !DIExpression()), !dbg !148
  %68 = shl i32 %60, 3, !dbg !212
  %69 = call noalias i8* @malloc(i32 %68) #12, !dbg !213
  store i8* %69, i8** bitcast (i32** @kernel to i8**), align 4, !dbg !214, !tbaa !152
  call void @llvm.dbg.value(metadata i32 %56, metadata !132, metadata !DIExpression()), !dbg !148
  %70 = call i32 @fread(i8* %65, i32 8, i32 %56, %struct._IO_FILE* %45), !dbg !215
  %71 = load i8*, i8** bitcast (i32** @prolog to i8**), align 4, !dbg !216, !tbaa !152
  call void @llvm.dbg.value(metadata i32 %58, metadata !133, metadata !DIExpression()), !dbg !148
  %72 = call i32 @fread(i8* %71, i32 8, i32 %58, %struct._IO_FILE* %46), !dbg !217
  %73 = load i8*, i8** bitcast (i32** @kernel to i8**), align 4, !dbg !218, !tbaa !152
  call void @llvm.dbg.value(metadata i32 %60, metadata !134, metadata !DIExpression()), !dbg !148
  %74 = call i32 @fread(i8* %73, i32 8, i32 %60, %struct._IO_FILE* %47), !dbg !219
  %75 = call i8* @strcat(i8* nonnull %31, i8* nonnull %25) #12, !dbg !220
  %76 = call i32 @strlen(i8* nonnull %31), !dbg !221
  %77 = getelementptr [40 x i8], [40 x i8]* %7, i32 0, i32 %76, !dbg !221
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(26) %77, i8* nonnull align 1 dereferenceable(26) getelementptr inbounds ([26 x i8], [26 x i8]* @.str.13, i32 0, i32 0), i32 26, i1 false), !dbg !221
  %78 = call %struct._IO_FILE* @fopen(i8* nonnull %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !222
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %78, metadata !117, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32* %12, metadata !135, metadata !DIExpression(DW_OP_deref)), !dbg !148
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %12) #12, !dbg !223
  %80 = getelementptr inbounds [256 x i8], [256 x i8]* %13, i32 0, i32 0, !dbg !224
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %80) #12, !dbg !224
  call void @llvm.dbg.declare(metadata [256 x i8]* %13, metadata !136, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i32 0, metadata !140, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 0, metadata !141, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 0, metadata !142, metadata !DIExpression()), !dbg !148
  %81 = call i8* @fgets(i8* nonnull %80, i32 256, %struct._IO_FILE* %48), !dbg !226
  %82 = icmp eq i8* %81, null, !dbg !227
  br i1 %82, label %100, label %83, !dbg !227

83:                                               ; preds = %1, %95
  %84 = phi i32 [ %97, %95 ], [ 0, %1 ]
  %85 = phi i32 [ %96, %95 ], [ 0, %1 ]
  %86 = phi i32 [ %87, %95 ], [ 0, %1 ]
  call void @llvm.dbg.value(metadata i32 %84, metadata !140, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 %85, metadata !141, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 %86, metadata !142, metadata !DIExpression()), !dbg !148
  %87 = add nuw nsw i32 %86, 1, !dbg !228
  call void @llvm.dbg.value(metadata i32 %87, metadata !142, metadata !DIExpression()), !dbg !148
  %88 = icmp eq i32 %86, 0, !dbg !230
  br i1 %88, label %89, label %91, !dbg !232

89:                                               ; preds = %83
  call void @llvm.dbg.value(metadata i8* %80, metadata !233, metadata !DIExpression()) #12, !dbg !241
  %90 = call i32 @strtol(i8* nocapture nonnull %80, i8** null, i32 10) #12, !dbg !243
  call void @llvm.dbg.value(metadata i32 %90, metadata !140, metadata !DIExpression()), !dbg !148
  br label %95, !dbg !244

91:                                               ; preds = %83
  %92 = icmp eq i32 %87, 2, !dbg !245
  br i1 %92, label %93, label %100, !dbg !247

93:                                               ; preds = %91
  call void @llvm.dbg.value(metadata i8* %80, metadata !233, metadata !DIExpression()) #12, !dbg !248
  %94 = call i32 @strtol(i8* nocapture nonnull %80, i8** null, i32 10) #12, !dbg !250
  call void @llvm.dbg.value(metadata i32 %94, metadata !141, metadata !DIExpression()), !dbg !148
  br label %95

95:                                               ; preds = %93, %89
  %96 = phi i32 [ %85, %89 ], [ %94, %93 ], !dbg !148
  %97 = phi i32 [ %90, %89 ], [ %84, %93 ], !dbg !148
  call void @llvm.dbg.value(metadata i32 %97, metadata !140, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 %96, metadata !141, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 %87, metadata !142, metadata !DIExpression()), !dbg !148
  %98 = call i8* @fgets(i8* nonnull %80, i32 256, %struct._IO_FILE* %48), !dbg !226
  %99 = icmp eq i8* %98, null, !dbg !227
  br i1 %99, label %100, label %83, !dbg !227, !llvm.loop !251

100:                                              ; preds = %95, %91, %1
  %101 = phi i32 [ 0, %1 ], [ %85, %91 ], [ %96, %95 ], !dbg !255
  %102 = phi i32 [ 0, %1 ], [ %84, %91 ], [ %97, %95 ], !dbg !148
  %103 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([39 x i8], [39 x i8]* @.str.14, i32 0, i32 0), i32 %102, i32 %101), !dbg !256
  call void @llvm.dbg.value(metadata i32 %60, metadata !134, metadata !DIExpression()), !dbg !148
  %104 = mul nsw i32 %102, %101, !dbg !257
  %105 = sdiv i32 %60, %104, !dbg !258
  call void @llvm.dbg.value(metadata i32 %105, metadata !143, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 %56, metadata !132, metadata !DIExpression()), !dbg !148
  %106 = sdiv i32 %56, %104, !dbg !259
  call void @llvm.dbg.value(metadata i32 %106, metadata !144, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 %58, metadata !133, metadata !DIExpression()), !dbg !148
  %107 = sdiv i32 %58, %104, !dbg !260
  call void @llvm.dbg.value(metadata i32 %107, metadata !145, metadata !DIExpression()), !dbg !148
  %108 = load i32*, i32** @initCGRA, align 4, !dbg !261, !tbaa !152
  %109 = getelementptr inbounds i32, i32* %108, i32 %19, !dbg !262
  %110 = getelementptr inbounds i32, i32* %109, i32 2, !dbg !263
  store i32 %105, i32* %110, align 4, !dbg !264, !tbaa !160
  %111 = getelementptr inbounds i32, i32* %109, i32 3, !dbg !265
  store i32 %106, i32* %111, align 4, !dbg !266, !tbaa !160
  %112 = getelementptr inbounds i32, i32* %109, i32 4, !dbg !267
  store i32 %107, i32* %112, align 4, !dbg !268, !tbaa !160
  %113 = load i32, i32* %12, align 4, !dbg !269, !tbaa !160
  call void @llvm.dbg.value(metadata i32 %113, metadata !135, metadata !DIExpression()), !dbg !148
  %114 = sdiv i32 %113, %104, !dbg !270
  %115 = getelementptr inbounds i32, i32* %109, i32 6, !dbg !271
  store i32 %114, i32* %115, align 4, !dbg !272, !tbaa !160
  %116 = call i32 @fclose(%struct._IO_FILE* %45), !dbg !273
  %117 = call i32 @fclose(%struct._IO_FILE* %46), !dbg !274
  %118 = call i32 @fclose(%struct._IO_FILE* %47), !dbg !275
  %119 = call i32 @fclose(%struct._IO_FILE* %78), !dbg !276
  %120 = call i32 @fclose(%struct._IO_FILE* %48), !dbg !277
  %121 = getelementptr inbounds [40 x i8], [40 x i8]* %14, i32 0, i32 0, !dbg !278
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %121) #12, !dbg !278
  call void @llvm.dbg.declare(metadata [40 x i8]* %14, metadata !146, metadata !DIExpression()), !dbg !279
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %121, i8 0, i32 40, i1 false), !dbg !279
  %122 = call i8* @strcat(i8* nonnull %121, i8* nonnull %25) #12, !dbg !280
  %123 = call i32 @strlen(i8* nonnull %121), !dbg !281
  %124 = getelementptr [40 x i8], [40 x i8]* %14, i32 0, i32 %123, !dbg !281
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(18) %124, i8* nonnull align 1 dereferenceable(18) getelementptr inbounds ([18 x i8], [18 x i8]* @.str.15, i32 0, i32 0), i32 18, i1 false), !dbg !281
  %125 = bitcast i32* %15 to i8*, !dbg !282
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %125) #12, !dbg !282
  call void @llvm.dbg.value(metadata i32 0, metadata !147, metadata !DIExpression()), !dbg !148
  store i32 0, i32* %15, align 4, !dbg !283, !tbaa !160
  %126 = call %struct._IO_FILE* @fopen(i8* nonnull %121, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !284
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %126, metadata !117, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32* %15, metadata !147, metadata !DIExpression(DW_OP_deref)), !dbg !148
  %127 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %126, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %15) #12, !dbg !285
  %128 = call i32 @fclose(%struct._IO_FILE* %126), !dbg !286
  %129 = load i32, i32* %15, align 4, !dbg !287, !tbaa !160
  call void @llvm.dbg.value(metadata i32 %129, metadata !147, metadata !DIExpression()), !dbg !148
  %130 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16, i32 0, i32 0), i32 %129), !dbg !288
  %131 = load i32, i32* %15, align 4, !dbg !289, !tbaa !160
  call void @llvm.dbg.value(metadata i32 %131, metadata !147, metadata !DIExpression()), !dbg !148
  %132 = load i32*, i32** @initCGRA, align 4, !dbg !290, !tbaa !152
  %133 = getelementptr inbounds i32, i32* %132, i32 %19, !dbg !291
  %134 = getelementptr inbounds i32, i32* %133, i32 5, !dbg !292
  store i32 %131, i32* %134, align 4, !dbg !293, !tbaa !160
  %135 = load i32*, i32** @prolog, align 4, !dbg !294, !tbaa !152
  %136 = ptrtoint i32* %135 to i32, !dbg !295
  %137 = load i32*, i32** @epilog, align 4, !dbg !296, !tbaa !152
  %138 = ptrtoint i32* %137 to i32, !dbg !297
  %139 = load i32*, i32** @kernel, align 4, !dbg !298, !tbaa !152
  %140 = ptrtoint i32* %139 to i32, !dbg !299
  %141 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([55 x i8], [55 x i8]* @.str.17, i32 0, i32 0), i32 %136, i32 %138, i32 %140), !dbg !300
  %142 = load i32*, i32** @prolog, align 4, !dbg !301, !tbaa !152
  %143 = ptrtoint i32* %142 to i32, !dbg !302
  %144 = load i32*, i32** @prologPtr, align 4, !dbg !303, !tbaa !152
  %145 = getelementptr inbounds i32, i32* %144, i32 %18, !dbg !303
  store i32 %143, i32* %145, align 4, !dbg !304, !tbaa !305
  %146 = load i32*, i32** @epilog, align 4, !dbg !307, !tbaa !152
  %147 = ptrtoint i32* %146 to i32, !dbg !308
  %148 = load i32*, i32** @epilogPtr, align 4, !dbg !309, !tbaa !152
  %149 = getelementptr inbounds i32, i32* %148, i32 %18, !dbg !309
  store i32 %147, i32* %149, align 4, !dbg !310, !tbaa !305
  %150 = load i32*, i32** @kernel, align 4, !dbg !311, !tbaa !152
  %151 = ptrtoint i32* %150 to i32, !dbg !312
  %152 = load i32*, i32** @kernelPtr, align 4, !dbg !313, !tbaa !152
  %153 = getelementptr inbounds i32, i32* %152, i32 %18, !dbg !313
  store i32 %151, i32* %153, align 4, !dbg !314, !tbaa !305
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %125) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %121) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %80) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %52) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %51) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %50) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %49) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %32) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %31) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %30) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %29) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %28) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %25) #12, !dbg !315
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %23) #12, !dbg !315
  ret i32 0, !dbg !316
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #3

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @sprintf(i8* noalias nocapture noundef writeonly, i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare dso_local i8* @strcat(i8* noalias returned writeonly, i8* noalias nocapture readonly) local_unnamed_addr #4

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #5

; Function Attrs: nofree nounwind
declare dso_local noalias noundef %struct._IO_FILE* @fopen(i8* nocapture noundef readonly, i8* nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fread(i8* nocapture noundef, i32 noundef, i32 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i32) local_unnamed_addr #6

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare !dbg !317 dso_local noundef i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare !dbg !321 dso_local noundef i32 @fclose(%struct._IO_FILE* nocapture noundef) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nofree nounwind
define dso_local i32 @configureCGRA(i32 %0) local_unnamed_addr #8 !dbg !324 {
  %2 = alloca [25 x i8], align 1
  %3 = alloca [20 x i8], align 1
  %4 = alloca [40 x i8], align 1
  call void @llvm.dbg.value(metadata i32 %0, metadata !326, metadata !DIExpression()), !dbg !336
  %5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([14 x i8], [14 x i8]* @str.34, i32 0, i32 0)), !dbg !337
  call void @llvm.dbg.value(metadata i32 0, metadata !327, metadata !DIExpression()), !dbg !336
  %6 = load i32*, i32** @initCGRA, align 4, !dbg !339, !tbaa !152
  %7 = add i32 %0, -1, !dbg !340
  %8 = mul i32 %7, 7, !dbg !341
  %9 = getelementptr inbounds i32, i32* %6, i32 %8, !dbg !342
  %10 = getelementptr inbounds i32, i32* %9, i32 5, !dbg !343
  %11 = load i32, i32* %10, align 4, !dbg !344, !tbaa !160
  call void @llvm.dbg.value(metadata i32 %11, metadata !328, metadata !DIExpression()), !dbg !336
  %12 = getelementptr inbounds [25 x i8], [25 x i8]* %2, i32 0, i32 0, !dbg !345
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %12) #12, !dbg !345
  call void @llvm.dbg.declare(metadata [25 x i8]* %2, metadata !330, metadata !DIExpression()), !dbg !346
  %13 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i32 0, i32 0, !dbg !347
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %13) #12, !dbg !347
  call void @llvm.dbg.declare(metadata [20 x i8]* %3, metadata !331, metadata !DIExpression()), !dbg !348
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(20) %13, i8* nonnull align 1 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @__const.configureCGRA.directoryPath, i32 0, i32 0), i32 20, i1 false), !dbg !348
  %14 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %12, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 %0) #12, !dbg !349
  %15 = call i8* @strcat(i8* nonnull %13, i8* nonnull %12) #12, !dbg !350
  %16 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([14 x i8], [14 x i8]* @.str.19, i32 0, i32 0), i8* nonnull %12), !dbg !351
  %17 = icmp slt i32 %11, 1, !dbg !353
  br i1 %17, label %18, label %25, !dbg !354

18:                                               ; preds = %1
  %19 = load i32, i32* @dynamicTCVal, align 4, !dbg !355, !tbaa !160
  %20 = add nsw i32 %19, %11, !dbg !356
  call void @llvm.dbg.value(metadata i32 %20, metadata !332, metadata !DIExpression()), !dbg !357
  %21 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([17 x i8], [17 x i8]* @.str.20, i32 0, i32 0), i32 %11, i32 %19), !dbg !358
  %22 = load i32*, i32** @initCGRA, align 4, !dbg !360, !tbaa !152
  %23 = getelementptr inbounds i32, i32* %22, i32 %8, !dbg !361
  %24 = getelementptr inbounds i32, i32* %23, i32 5, !dbg !362
  store i32 %20, i32* %24, align 4, !dbg !363, !tbaa !160
  br label %25, !dbg !364

25:                                               ; preds = %18, %1
  %26 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i32 0, i32 0, !dbg !365
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %26) #12, !dbg !365
  call void @llvm.dbg.declare(metadata [40 x i8]* %4, metadata !335, metadata !DIExpression()), !dbg !366
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %26, i8* nonnull align 1 dereferenceable(40) getelementptr inbounds ([40 x i8], [40 x i8]* @__const.configureCGRA.initCGRAfile, i32 0, i32 0), i32 40, i1 false), !dbg !366
  %27 = call i32 @strlen(i8* nonnull %26), !dbg !367
  %28 = getelementptr [40 x i8], [40 x i8]* %4, i32 0, i32 %27, !dbg !367
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(14) %28, i8* nonnull align 1 dereferenceable(14) getelementptr inbounds ([14 x i8], [14 x i8]* @.str.21, i32 0, i32 0), i32 14, i1 false), !dbg !367
  %29 = call %struct._IO_FILE* @fopen(i8* nonnull %26, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.22, i32 0, i32 0)), !dbg !368
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %29, metadata !329, metadata !DIExpression()), !dbg !336
  call void @llvm.dbg.value(metadata i32 0, metadata !327, metadata !DIExpression()), !dbg !336
  br label %30, !dbg !369

30:                                               ; preds = %25, %30
  %31 = phi i32 [ 0, %25 ], [ %37, %30 ]
  call void @llvm.dbg.value(metadata i32 %31, metadata !327, metadata !DIExpression()), !dbg !336
  %32 = load i32*, i32** @initCGRA, align 4, !dbg !371, !tbaa !152
  %33 = getelementptr inbounds i32, i32* %32, i32 %8, !dbg !373
  %34 = getelementptr inbounds i32, i32* %33, i32 %31, !dbg !374
  %35 = load i32, i32* %34, align 4, !dbg !375, !tbaa !160
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i32 %35), !dbg !376
  %37 = add nuw nsw i32 %31, 1, !dbg !377
  call void @llvm.dbg.value(metadata i32 %37, metadata !327, metadata !DIExpression()), !dbg !336
  %38 = icmp eq i32 %37, 7, !dbg !378
  br i1 %38, label %39, label %30, !dbg !369, !llvm.loop !379

39:                                               ; preds = %30
  %40 = load i32*, i32** @epilogPtr, align 4, !dbg !381, !tbaa !152
  %41 = getelementptr inbounds i32, i32* %40, i32 %7, !dbg !381
  %42 = load i32, i32* %41, align 4, !dbg !381, !tbaa !305
  %43 = zext i32 %42 to i64, !dbg !382
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %43), !dbg !383
  %45 = load i32*, i32** @prologPtr, align 4, !dbg !384, !tbaa !152
  %46 = getelementptr inbounds i32, i32* %45, i32 %7, !dbg !384
  %47 = load i32, i32* %46, align 4, !dbg !384, !tbaa !305
  %48 = zext i32 %47 to i64, !dbg !385
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %48), !dbg !386
  %50 = load i32*, i32** @kernelPtr, align 4, !dbg !387, !tbaa !152
  %51 = getelementptr inbounds i32, i32* %50, i32 %7, !dbg !387
  %52 = load i32, i32* %51, align 4, !dbg !387, !tbaa !305
  %53 = zext i32 %52 to i64, !dbg !388
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i64 %53), !dbg !389
  %55 = call i32 @fclose(%struct._IO_FILE* %29), !dbg !390
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %26) #12, !dbg !391
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %13) #12, !dbg !391
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %12) #12, !dbg !391
  ret i32 0, !dbg !392
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @checkTotalLoops() local_unnamed_addr #0 !dbg !393 {
  %1 = alloca [40 x i8], align 1
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.35, i32 0, i32 0)), !dbg !399
  %3 = getelementptr inbounds [40 x i8], [40 x i8]* %1, i32 0, i32 0, !dbg !401
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %3) #12, !dbg !401
  call void @llvm.dbg.declare(metadata [40 x i8]* %1, metadata !397, metadata !DIExpression()), !dbg !402
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %3, i8* nonnull align 1 dereferenceable(40) getelementptr inbounds ([40 x i8], [40 x i8]* @__const.checkTotalLoops.myfile, i32 0, i32 0), i32 40, i1 false), !dbg !402
  %4 = call %struct._IO_FILE* @fopen(i8* nonnull %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !403
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %4, metadata !398, metadata !DIExpression()), !dbg !404
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i32* nonnull @totalLoops) #12, !dbg !405
  %6 = tail call i32 @fclose(%struct._IO_FILE* %4), !dbg !406
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %3) #12, !dbg !407
  ret void, !dbg !407
}

; Function Attrs: nounwind
define dso_local i8* @runOnCGRA() local_unnamed_addr #0 !dbg !408 {
  %1 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.36, i32 0, i32 0)), !dbg !411
  tail call void asm sideeffect "mov r11,$0", "r"(i32 15) #12, !dbg !412, !srcloc !413
  ret i8* null, !dbg !414
}

; Function Attrs: nounwind
define dso_local void @accelerateOnCGRA(i32 %0) local_unnamed_addr #0 !dbg !415 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !419, metadata !DIExpression()), !dbg !422
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @str.37, i32 0, i32 0)), !dbg !423
  call void @llvm.dbg.value(metadata i32 0, metadata !420, metadata !DIExpression()), !dbg !422
  %3 = tail call i32 @configureCGRA(i32 %0), !dbg !424
  call void @llvm.dbg.value(metadata i32 0, metadata !421, metadata !DIExpression()), !dbg !422
  %4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([35 x i8], [35 x i8]* @.str.30, i32 0, i32 0), i32 %0), !dbg !425
  %5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.36, i32 0, i32 0)) #12, !dbg !426
  tail call void asm sideeffect "mov r11,$0", "r"(i32 15) #12, !dbg !428, !srcloc !413
  ret void, !dbg !429
}

; Function Attrs: nofree nounwind
define dso_local void @deleteCGRA() local_unnamed_addr #8 !dbg !430 {
  %1 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.38, i32 0, i32 0)), !dbg !431
  ret void, !dbg !432
}

; Function Attrs: nounwind
define dso_local void @createCGRA() local_unnamed_addr #0 !dbg !433 {
  %1 = alloca [40 x i8], align 1
  %2 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.39, i32 0, i32 0)), !dbg !437
  call void @llvm.dbg.value(metadata i32 0, metadata !435, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.value(metadata i32 1, metadata !436, metadata !DIExpression()), !dbg !439
  %3 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str.35, i32 0, i32 0)) #12, !dbg !440
  %4 = getelementptr inbounds [40 x i8], [40 x i8]* %1, i32 0, i32 0, !dbg !442
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %4) #12, !dbg !442
  call void @llvm.dbg.declare(metadata [40 x i8]* %1, metadata !397, metadata !DIExpression()) #12, !dbg !443
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(40) %4, i8* nonnull align 1 dereferenceable(40) getelementptr inbounds ([40 x i8], [40 x i8]* @__const.checkTotalLoops.myfile, i32 0, i32 0), i32 40, i1 false) #12, !dbg !443
  %5 = call %struct._IO_FILE* @fopen(i8* nonnull %4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)) #12, !dbg !444
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %5, metadata !398, metadata !DIExpression()) #12, !dbg !445
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i32* nonnull @totalLoops) #12, !dbg !446
  %7 = tail call i32 @fclose(%struct._IO_FILE* %5) #12, !dbg !447
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %4) #12, !dbg !448
  %8 = load i32, i32* @totalLoops, align 4, !dbg !449, !tbaa !160
  %9 = mul i32 %8, 28, !dbg !450
  %10 = tail call noalias i8* @malloc(i32 %9) #12, !dbg !451
  store i8* %10, i8** bitcast (i32** @initCGRA to i8**), align 4, !dbg !452, !tbaa !152
  %11 = shl i32 %8, 2, !dbg !453
  %12 = tail call noalias i8* @malloc(i32 %11) #12, !dbg !454
  store i8* %12, i8** bitcast (i32** @prologPtr to i8**), align 4, !dbg !455, !tbaa !152
  %13 = tail call noalias i8* @malloc(i32 %11) #12, !dbg !456
  store i8* %13, i8** bitcast (i32** @kernelPtr to i8**), align 4, !dbg !457, !tbaa !152
  %14 = tail call noalias i8* @malloc(i32 %11) #12, !dbg !458
  store i8* %14, i8** bitcast (i32** @epilogPtr to i8**), align 4, !dbg !459, !tbaa !152
  call void @llvm.dbg.value(metadata i32 1, metadata !436, metadata !DIExpression()), !dbg !439
  %15 = icmp eq i32 %8, 0, !dbg !460
  br i1 %15, label %22, label %16, !dbg !463

16:                                               ; preds = %0, %16
  %17 = phi i32 [ %19, %16 ], [ 1, %0 ]
  call void @llvm.dbg.value(metadata i32 %17, metadata !436, metadata !DIExpression()), !dbg !439
  %18 = tail call i32 @initializeParameters(i32 %17), !dbg !464
  %19 = add i32 %17, 1, !dbg !466
  call void @llvm.dbg.value(metadata i32 %19, metadata !436, metadata !DIExpression()), !dbg !439
  %20 = load i32, i32* @totalLoops, align 4, !dbg !467, !tbaa !160
  %21 = icmp ugt i32 %19, %20, !dbg !460
  br i1 %21, label %22, label %16, !dbg !463, !llvm.loop !468

22:                                               ; preds = %16, %0
  %23 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([35 x i8], [35 x i8]* @str.40, i32 0, i32 0)), !dbg !470
  ret void, !dbg !471
}

; Function Attrs: nofree nounwind willreturn
declare dso_local i32 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #9

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #10

; Function Attrs: argmemonly nofree nounwind readonly willreturn
declare i32 @strlen(i8* nocapture) local_unnamed_addr #11

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { argmemonly nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #5 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #6 = { inaccessiblememonly nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #7 = { "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #8 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "min-legal-vector-width"="0" "no-jump-tables"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #9 = { nofree nounwind willreturn "disable-tail-calls"="false" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-thumb-mode" }
attributes #10 = { nofree nounwind }
attributes #11 = { argmemonly nofree nounwind readonly willreturn }
attributes #12 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!42, !43, !44, !45}
!llvm.ident = !{!46}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "totalLoops", scope: !2, file: !18, line: 30, type: !29, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/MPSLab-ASU/CCF-20.04/ 05285de7579f417a4d73ad832b8f4cc497f25235)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/local/ASUAD/quoclon1/publish_ccf_github/scripts/CGRALib/cgra.c", directory: "/home/local/ASUAD/quoclon1/publish_ccf_github/benchmarks/pow")
!4 = !{}
!5 = !{!6, !8, !7, !9, !10, !11, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 32)
!7 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!8 = !DIBasicType(name: "long unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 32)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !{!0, !16, !19, !22, !24, !26, !30, !32, !34, !36, !38}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "dynamicTCVal", scope: !2, file: !18, line: 37, type: !11, isLocal: false, isDefinition: true)
!18 = !DIFile(filename: "scripts/CGRALib/cgra.h", directory: "/home/local/ASUAD/quoclon1/publish_ccf_github")
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "prolog", scope: !2, file: !18, line: 24, type: !21, isLocal: false, isDefinition: true)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 32)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "epilog", scope: !2, file: !18, line: 24, type: !21, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "kernel", scope: !2, file: !18, line: 24, type: !21, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "ArrPtr", scope: !2, file: !18, line: 25, type: !28, isLocal: false, isDefinition: true)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 32)
!29 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "prologPtr", scope: !2, file: !18, line: 27, type: !21, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "kernelPtr", scope: !2, file: !18, line: 27, type: !21, isLocal: false, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "epilogPtr", scope: !2, file: !18, line: 27, type: !21, isLocal: false, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "initCGRA", scope: !2, file: !18, line: 29, type: !10, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "pth", scope: !2, file: !18, line: 32, type: !40, isLocal: false, isDefinition: true)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !41, line: 27, baseType: !8)
!41 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/bits/pthreadtypes.h", directory: "")
!42 = !{i32 7, !"Dwarf Version", i32 4}
!43 = !{i32 2, !"Debug Info Version", i32 3}
!44 = !{i32 1, !"wchar_size", i32 4}
!45 = !{i32 1, !"min_enum_size", i32 4}
!46 = !{!"clang version 13.0.0 (https://github.com/MPSLab-ASU/CCF-20.04/ 05285de7579f417a4d73ad832b8f4cc497f25235)"}
!47 = distinct !DISubprogram(name: "initializeParameters", scope: !48, file: !48, line: 15, type: !49, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !51)
!48 = !DIFile(filename: "scripts/CGRALib/cgra.c", directory: "/home/local/ASUAD/quoclon1/publish_ccf_github")
!49 = !DISubroutineType(types: !50)
!50 = !{!11, !29}
!51 = !{!52, !53, !54, !115, !116, !117, !118, !119, !123, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !140, !141, !142, !143, !144, !145, !146, !147}
!52 = !DILocalVariable(name: "loopID", arg: 1, scope: !47, file: !48, line: 15, type: !29)
!53 = !DILocalVariable(name: "i", scope: !47, file: !48, line: 19, type: !29)
!54 = !DILocalVariable(name: "epi", scope: !47, file: !48, line: 29, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !57, line: 7, baseType: !58)
!57 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/bits/types/FILE.h", directory: "")
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !59, line: 49, size: 1216, elements: !60)
!59 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/bits/types/struct_FILE.h", directory: "")
!60 = !{!61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !76, !78, !79, !80, !84, !86, !88, !92, !95, !99, !102, !105, !106, !107, !110, !111}
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !58, file: !59, line: 51, baseType: !11, size: 32)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !58, file: !59, line: 54, baseType: !13, size: 32, offset: 32)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !58, file: !59, line: 55, baseType: !13, size: 32, offset: 64)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !58, file: !59, line: 56, baseType: !13, size: 32, offset: 96)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !58, file: !59, line: 57, baseType: !13, size: 32, offset: 128)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !58, file: !59, line: 58, baseType: !13, size: 32, offset: 160)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !58, file: !59, line: 59, baseType: !13, size: 32, offset: 192)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !58, file: !59, line: 60, baseType: !13, size: 32, offset: 224)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !58, file: !59, line: 61, baseType: !13, size: 32, offset: 256)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !58, file: !59, line: 64, baseType: !13, size: 32, offset: 288)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !58, file: !59, line: 65, baseType: !13, size: 32, offset: 320)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !58, file: !59, line: 66, baseType: !13, size: 32, offset: 352)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !58, file: !59, line: 68, baseType: !74, size: 32, offset: 384)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 32)
!75 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !59, line: 36, flags: DIFlagFwdDecl)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !58, file: !59, line: 70, baseType: !77, size: 32, offset: 416)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !58, file: !59, line: 72, baseType: !11, size: 32, offset: 448)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !58, file: !59, line: 73, baseType: !11, size: 32, offset: 480)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !58, file: !59, line: 74, baseType: !81, size: 32, offset: 512)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !82, line: 152, baseType: !83)
!82 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/bits/types.h", directory: "")
!83 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !58, file: !59, line: 77, baseType: !85, size: 16, offset: 544)
!85 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !58, file: !59, line: 78, baseType: !87, size: 8, offset: 560)
!87 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !58, file: !59, line: 79, baseType: !89, size: 8, offset: 568)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 8, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 1)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !58, file: !59, line: 81, baseType: !93, size: 32, offset: 576)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !59, line: 43, baseType: null)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !58, file: !59, line: 89, baseType: !96, size: 64, offset: 640)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !82, line: 153, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !82, line: 47, baseType: !98)
!98 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !58, file: !59, line: 91, baseType: !100, size: 32, offset: 704)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 32)
!101 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !59, line: 37, flags: DIFlagFwdDecl)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !58, file: !59, line: 92, baseType: !103, size: 32, offset: 736)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 32)
!104 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !59, line: 38, flags: DIFlagFwdDecl)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !58, file: !59, line: 93, baseType: !77, size: 32, offset: 768)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !58, file: !59, line: 94, baseType: !9, size: 32, offset: 800)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !58, file: !59, line: 95, baseType: !108, size: 32, offset: 832)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !109, line: 46, baseType: !29)
!109 = !DIFile(filename: "sw/lib/clang/13.0.0/include/stddef.h", directory: "/home/local/ASUAD/quoclon1")
!110 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !58, file: !59, line: 96, baseType: !11, size: 32, offset: 864)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !58, file: !59, line: 98, baseType: !112, size: 320, offset: 896)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: 40)
!115 = !DILocalVariable(name: "pro", scope: !47, file: !48, line: 29, type: !55)
!116 = !DILocalVariable(name: "kern", scope: !47, file: !48, line: 29, type: !55)
!117 = !DILocalVariable(name: "count", scope: !47, file: !48, line: 29, type: !55)
!118 = !DILocalVariable(name: "config", scope: !47, file: !48, line: 29, type: !55)
!119 = !DILocalVariable(name: "loopno", scope: !47, file: !48, line: 30, type: !120)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 200, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 25)
!123 = !DILocalVariable(name: "directoryPath", scope: !47, file: !48, line: 31, type: !124)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 160, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 20)
!127 = !DILocalVariable(name: "epifile", scope: !47, file: !48, line: 36, type: !112)
!128 = !DILocalVariable(name: "profile", scope: !47, file: !48, line: 37, type: !112)
!129 = !DILocalVariable(name: "kernfile", scope: !47, file: !48, line: 38, type: !112)
!130 = !DILocalVariable(name: "liveOutfile", scope: !47, file: !48, line: 39, type: !112)
!131 = !DILocalVariable(name: "configfile", scope: !47, file: !48, line: 40, type: !112)
!132 = !DILocalVariable(name: "episize", scope: !47, file: !48, line: 59, type: !11)
!133 = !DILocalVariable(name: "prosize", scope: !47, file: !48, line: 59, type: !11)
!134 = !DILocalVariable(name: "kernelsize", scope: !47, file: !48, line: 59, type: !11)
!135 = !DILocalVariable(name: "livevar_st_size", scope: !47, file: !48, line: 59, type: !11)
!136 = !DILocalVariable(name: "line", scope: !47, file: !48, line: 84, type: !137)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 2048, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 256)
!140 = !DILocalVariable(name: "XDim", scope: !47, file: !48, line: 85, type: !11)
!141 = !DILocalVariable(name: "YDim", scope: !47, file: !48, line: 85, type: !11)
!142 = !DILocalVariable(name: "iter", scope: !47, file: !48, line: 86, type: !11)
!143 = !DILocalVariable(name: "II", scope: !47, file: !48, line: 100, type: !11)
!144 = !DILocalVariable(name: "epiLength", scope: !47, file: !48, line: 101, type: !11)
!145 = !DILocalVariable(name: "prolength", scope: !47, file: !48, line: 102, type: !11)
!146 = !DILocalVariable(name: "loopitfile", scope: !47, file: !48, line: 114, type: !112)
!147 = !DILocalVariable(name: "kernelCount", scope: !47, file: !48, line: 118, type: !11)
!148 = !DILocation(line: 0, scope: !47)
!149 = !DILocation(line: 18, column: 13, scope: !150)
!150 = distinct !DILexicalBlock(scope: !47, file: !48, line: 18, column: 6)
!151 = !DILocation(line: 21, column: 5, scope: !47)
!152 = !{!153, !153, i64 0}
!153 = !{!"any pointer", !154, i64 0}
!154 = !{!"omnipotent char", !155, i64 0}
!155 = !{!"Simple C/C++ TBAA"}
!156 = !DILocation(line: 21, column: 25, scope: !47)
!157 = !DILocation(line: 21, column: 17, scope: !47)
!158 = !DILocation(line: 21, column: 14, scope: !47)
!159 = !DILocation(line: 21, column: 30, scope: !47)
!160 = !{!161, !161, i64 0}
!161 = !{!"int", !154, i64 0}
!162 = !DILocation(line: 22, column: 29, scope: !47)
!163 = !DILocation(line: 22, column: 34, scope: !47)
!164 = !DILocation(line: 23, column: 29, scope: !47)
!165 = !DILocation(line: 30, column: 3, scope: !47)
!166 = !DILocation(line: 24, column: 34, scope: !47)
!167 = !DILocation(line: 30, column: 8, scope: !47)
!168 = !DILocation(line: 31, column: 3, scope: !47)
!169 = !DILocation(line: 31, column: 8, scope: !47)
!170 = !DILocation(line: 33, column: 3, scope: !47)
!171 = !DILocation(line: 34, column: 3, scope: !47)
!172 = !DILocation(line: 36, column: 3, scope: !47)
!173 = !DILocation(line: 36, column: 8, scope: !47)
!174 = !DILocation(line: 37, column: 3, scope: !47)
!175 = !DILocation(line: 37, column: 8, scope: !47)
!176 = !DILocation(line: 38, column: 3, scope: !47)
!177 = !DILocation(line: 38, column: 8, scope: !47)
!178 = !DILocation(line: 39, column: 3, scope: !47)
!179 = !DILocation(line: 39, column: 8, scope: !47)
!180 = !DILocation(line: 40, column: 3, scope: !47)
!181 = !DILocation(line: 40, column: 8, scope: !47)
!182 = !DILocation(line: 42, column: 3, scope: !47)
!183 = !DILocation(line: 43, column: 3, scope: !47)
!184 = !DILocation(line: 45, column: 3, scope: !47)
!185 = !DILocation(line: 46, column: 3, scope: !47)
!186 = !DILocation(line: 48, column: 3, scope: !47)
!187 = !DILocation(line: 49, column: 3, scope: !47)
!188 = !DILocation(line: 51, column: 3, scope: !47)
!189 = !DILocation(line: 52, column: 3, scope: !47)
!190 = !DILocation(line: 54, column: 7, scope: !47)
!191 = !DILocation(line: 55, column: 7, scope: !47)
!192 = !DILocation(line: 56, column: 8, scope: !47)
!193 = !DILocation(line: 57, column: 10, scope: !47)
!194 = !DILocation(line: 59, column: 3, scope: !47)
!195 = !DILocation(line: 61, column: 3, scope: !47)
!196 = !DILocation(line: 62, column: 3, scope: !47)
!197 = !DILocation(line: 63, column: 3, scope: !47)
!198 = !DILocation(line: 65, column: 46, scope: !47)
!199 = !DILocation(line: 65, column: 3, scope: !47)
!200 = !DILocation(line: 66, column: 46, scope: !47)
!201 = !DILocation(line: 66, column: 3, scope: !47)
!202 = !DILocation(line: 67, column: 47, scope: !47)
!203 = !DILocation(line: 67, column: 3, scope: !47)
!204 = !DILocation(line: 68, column: 3, scope: !47)
!205 = !DILocation(line: 69, column: 3, scope: !47)
!206 = !DILocation(line: 71, column: 45, scope: !47)
!207 = !DILocation(line: 71, column: 31, scope: !47)
!208 = !DILocation(line: 71, column: 9, scope: !47)
!209 = !DILocation(line: 72, column: 45, scope: !47)
!210 = !DILocation(line: 72, column: 31, scope: !47)
!211 = !DILocation(line: 72, column: 9, scope: !47)
!212 = !DILocation(line: 73, column: 48, scope: !47)
!213 = !DILocation(line: 73, column: 31, scope: !47)
!214 = !DILocation(line: 73, column: 9, scope: !47)
!215 = !DILocation(line: 75, column: 3, scope: !47)
!216 = !DILocation(line: 76, column: 9, scope: !47)
!217 = !DILocation(line: 76, column: 3, scope: !47)
!218 = !DILocation(line: 77, column: 9, scope: !47)
!219 = !DILocation(line: 77, column: 3, scope: !47)
!220 = !DILocation(line: 79, column: 3, scope: !47)
!221 = !DILocation(line: 80, column: 3, scope: !47)
!222 = !DILocation(line: 81, column: 9, scope: !47)
!223 = !DILocation(line: 82, column: 3, scope: !47)
!224 = !DILocation(line: 84, column: 3, scope: !47)
!225 = !DILocation(line: 84, column: 8, scope: !47)
!226 = !DILocation(line: 88, column: 9, scope: !47)
!227 = !DILocation(line: 88, column: 3, scope: !47)
!228 = !DILocation(line: 90, column: 9, scope: !229)
!229 = distinct !DILexicalBlock(scope: !47, file: !48, line: 89, column: 3)
!230 = !DILocation(line: 91, column: 12, scope: !231)
!231 = distinct !DILexicalBlock(scope: !229, file: !48, line: 91, column: 8)
!232 = !DILocation(line: 91, column: 8, scope: !229)
!233 = !DILocalVariable(name: "__nptr", arg: 1, scope: !234, file: !235, line: 361, type: !238)
!234 = distinct !DISubprogram(name: "atoi", scope: !235, file: !235, line: 361, type: !236, scopeLine: 362, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !240)
!235 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/stdlib.h", directory: "")
!236 = !DISubroutineType(types: !237)
!237 = !{!11, !238}
!238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !239, size: 32)
!239 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!240 = !{!233}
!241 = !DILocation(line: 0, scope: !234, inlinedAt: !242)
!242 = distinct !DILocation(line: 92, column: 14, scope: !231)
!243 = !DILocation(line: 363, column: 16, scope: !234, inlinedAt: !242)
!244 = !DILocation(line: 92, column: 7, scope: !231)
!245 = !DILocation(line: 93, column: 17, scope: !246)
!246 = distinct !DILexicalBlock(scope: !231, file: !48, line: 93, column: 13)
!247 = !DILocation(line: 93, column: 13, scope: !231)
!248 = !DILocation(line: 0, scope: !234, inlinedAt: !249)
!249 = distinct !DILocation(line: 94, column: 14, scope: !246)
!250 = !DILocation(line: 363, column: 16, scope: !234, inlinedAt: !249)
!251 = distinct !{!251, !227, !252, !253, !254}
!252 = !DILocation(line: 97, column: 3, scope: !47)
!253 = !{!"llvm.loop.mustprogress"}
!254 = !{!"llvm.loop.unroll.disable"}
!255 = !DILocation(line: 85, column: 15, scope: !47)
!256 = !DILocation(line: 99, column: 3, scope: !47)
!257 = !DILocation(line: 100, column: 28, scope: !47)
!258 = !DILocation(line: 100, column: 22, scope: !47)
!259 = !DILocation(line: 101, column: 26, scope: !47)
!260 = !DILocation(line: 102, column: 26, scope: !47)
!261 = !DILocation(line: 103, column: 5, scope: !47)
!262 = !DILocation(line: 103, column: 14, scope: !47)
!263 = !DILocation(line: 103, column: 29, scope: !47)
!264 = !DILocation(line: 103, column: 34, scope: !47)
!265 = !DILocation(line: 104, column: 29, scope: !47)
!266 = !DILocation(line: 104, column: 34, scope: !47)
!267 = !DILocation(line: 105, column: 29, scope: !47)
!268 = !DILocation(line: 105, column: 34, scope: !47)
!269 = !DILocation(line: 106, column: 36, scope: !47)
!270 = !DILocation(line: 106, column: 51, scope: !47)
!271 = !DILocation(line: 106, column: 29, scope: !47)
!272 = !DILocation(line: 106, column: 34, scope: !47)
!273 = !DILocation(line: 108, column: 3, scope: !47)
!274 = !DILocation(line: 109, column: 3, scope: !47)
!275 = !DILocation(line: 110, column: 3, scope: !47)
!276 = !DILocation(line: 111, column: 3, scope: !47)
!277 = !DILocation(line: 112, column: 3, scope: !47)
!278 = !DILocation(line: 114, column: 3, scope: !47)
!279 = !DILocation(line: 114, column: 8, scope: !47)
!280 = !DILocation(line: 115, column: 3, scope: !47)
!281 = !DILocation(line: 116, column: 3, scope: !47)
!282 = !DILocation(line: 118, column: 3, scope: !47)
!283 = !DILocation(line: 118, column: 7, scope: !47)
!284 = !DILocation(line: 119, column: 9, scope: !47)
!285 = !DILocation(line: 120, column: 3, scope: !47)
!286 = !DILocation(line: 121, column: 3, scope: !47)
!287 = !DILocation(line: 122, column: 29, scope: !47)
!288 = !DILocation(line: 122, column: 3, scope: !47)
!289 = !DILocation(line: 124, column: 36, scope: !47)
!290 = !DILocation(line: 124, column: 5, scope: !47)
!291 = !DILocation(line: 124, column: 14, scope: !47)
!292 = !DILocation(line: 124, column: 29, scope: !47)
!293 = !DILocation(line: 124, column: 34, scope: !47)
!294 = !DILocation(line: 126, column: 83, scope: !47)
!295 = !DILocation(line: 126, column: 68, scope: !47)
!296 = !DILocation(line: 126, column: 105, scope: !47)
!297 = !DILocation(line: 126, column: 90, scope: !47)
!298 = !DILocation(line: 126, column: 127, scope: !47)
!299 = !DILocation(line: 126, column: 112, scope: !47)
!300 = !DILocation(line: 126, column: 3, scope: !47)
!301 = !DILocation(line: 128, column: 46, scope: !47)
!302 = !DILocation(line: 128, column: 25, scope: !47)
!303 = !DILocation(line: 128, column: 3, scope: !47)
!304 = !DILocation(line: 128, column: 23, scope: !47)
!305 = !{!306, !306, i64 0}
!306 = !{!"long", !154, i64 0}
!307 = !DILocation(line: 129, column: 46, scope: !47)
!308 = !DILocation(line: 129, column: 25, scope: !47)
!309 = !DILocation(line: 129, column: 3, scope: !47)
!310 = !DILocation(line: 129, column: 23, scope: !47)
!311 = !DILocation(line: 130, column: 46, scope: !47)
!312 = !DILocation(line: 130, column: 25, scope: !47)
!313 = !DILocation(line: 130, column: 3, scope: !47)
!314 = !DILocation(line: 130, column: 23, scope: !47)
!315 = !DILocation(line: 134, column: 1, scope: !47)
!316 = !DILocation(line: 133, column: 3, scope: !47)
!317 = !DISubprogram(name: "fgets", scope: !318, file: !318, line: 564, type: !319, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !4)
!318 = !DIFile(filename: "/usr/arm-linux-gnueabi/include/stdio.h", directory: "")
!319 = !DISubroutineType(types: !320)
!320 = !{!13, !13, !11, !77}
!321 = !DISubprogram(name: "fclose", scope: !318, file: !318, line: 213, type: !322, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !4)
!322 = !DISubroutineType(types: !323)
!323 = !{!11, !77}
!324 = distinct !DISubprogram(name: "configureCGRA", scope: !48, file: !48, line: 136, type: !49, scopeLine: 137, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !325)
!325 = !{!326, !327, !328, !329, !330, !331, !332, !335}
!326 = !DILocalVariable(name: "loopID", arg: 1, scope: !324, file: !48, line: 136, type: !29)
!327 = !DILocalVariable(name: "i", scope: !324, file: !48, line: 139, type: !29)
!328 = !DILocalVariable(name: "kernelCount", scope: !324, file: !48, line: 140, type: !11)
!329 = !DILocalVariable(name: "count", scope: !324, file: !48, line: 141, type: !55)
!330 = !DILocalVariable(name: "loopno", scope: !324, file: !48, line: 142, type: !120)
!331 = !DILocalVariable(name: "directoryPath", scope: !324, file: !48, line: 143, type: !124)
!332 = !DILocalVariable(name: "newTC", scope: !333, file: !48, line: 151, type: !11)
!333 = distinct !DILexicalBlock(scope: !334, file: !48, line: 150, column: 3)
!334 = distinct !DILexicalBlock(scope: !324, file: !48, line: 149, column: 6)
!335 = !DILocalVariable(name: "initCGRAfile", scope: !324, file: !48, line: 156, type: !112)
!336 = !DILocation(line: 0, scope: !324)
!337 = !DILocation(line: 138, column: 13, scope: !338)
!338 = distinct !DILexicalBlock(scope: !324, file: !48, line: 138, column: 6)
!339 = !DILocation(line: 140, column: 23, scope: !324)
!340 = !DILocation(line: 140, column: 43, scope: !324)
!341 = !DILocation(line: 140, column: 35, scope: !324)
!342 = !DILocation(line: 140, column: 32, scope: !324)
!343 = !DILocation(line: 140, column: 47, scope: !324)
!344 = !DILocation(line: 140, column: 21, scope: !324)
!345 = !DILocation(line: 142, column: 3, scope: !324)
!346 = !DILocation(line: 142, column: 8, scope: !324)
!347 = !DILocation(line: 143, column: 3, scope: !324)
!348 = !DILocation(line: 143, column: 8, scope: !324)
!349 = !DILocation(line: 145, column: 3, scope: !324)
!350 = !DILocation(line: 146, column: 3, scope: !324)
!351 = !DILocation(line: 147, column: 13, scope: !352)
!352 = distinct !DILexicalBlock(scope: !324, file: !48, line: 147, column: 6)
!353 = !DILocation(line: 149, column: 18, scope: !334)
!354 = !DILocation(line: 149, column: 6, scope: !324)
!355 = !DILocation(line: 151, column: 31, scope: !333)
!356 = !DILocation(line: 151, column: 29, scope: !333)
!357 = !DILocation(line: 0, scope: !333)
!358 = !DILocation(line: 152, column: 15, scope: !359)
!359 = distinct !DILexicalBlock(scope: !333, file: !48, line: 152, column: 8)
!360 = !DILocation(line: 153, column: 7, scope: !333)
!361 = !DILocation(line: 153, column: 16, scope: !333)
!362 = !DILocation(line: 153, column: 31, scope: !333)
!363 = !DILocation(line: 153, column: 36, scope: !333)
!364 = !DILocation(line: 154, column: 3, scope: !333)
!365 = !DILocation(line: 156, column: 3, scope: !324)
!366 = !DILocation(line: 156, column: 8, scope: !324)
!367 = !DILocation(line: 157, column: 3, scope: !324)
!368 = !DILocation(line: 158, column: 11, scope: !324)
!369 = !DILocation(line: 159, column: 3, scope: !370)
!370 = distinct !DILexicalBlock(scope: !324, file: !48, line: 159, column: 3)
!371 = !DILocation(line: 160, column: 30, scope: !372)
!372 = distinct !DILexicalBlock(scope: !370, file: !48, line: 159, column: 3)
!373 = !DILocation(line: 160, column: 39, scope: !372)
!374 = !DILocation(line: 160, column: 54, scope: !372)
!375 = !DILocation(line: 160, column: 28, scope: !372)
!376 = !DILocation(line: 160, column: 5, scope: !372)
!377 = !DILocation(line: 159, column: 18, scope: !372)
!378 = !DILocation(line: 159, column: 13, scope: !372)
!379 = distinct !{!379, !369, !380, !253, !254}
!380 = !DILocation(line: 160, column: 58, scope: !370)
!381 = !DILocation(line: 161, column: 48, scope: !324)
!382 = !DILocation(line: 161, column: 27, scope: !324)
!383 = !DILocation(line: 161, column: 3, scope: !324)
!384 = !DILocation(line: 162, column: 48, scope: !324)
!385 = !DILocation(line: 162, column: 27, scope: !324)
!386 = !DILocation(line: 162, column: 3, scope: !324)
!387 = !DILocation(line: 163, column: 48, scope: !324)
!388 = !DILocation(line: 163, column: 27, scope: !324)
!389 = !DILocation(line: 163, column: 3, scope: !324)
!390 = !DILocation(line: 164, column: 3, scope: !324)
!391 = !DILocation(line: 168, column: 1, scope: !324)
!392 = !DILocation(line: 167, column: 3, scope: !324)
!393 = distinct !DISubprogram(name: "checkTotalLoops", scope: !48, file: !48, line: 170, type: !394, scopeLine: 171, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !396)
!394 = !DISubroutineType(types: !395)
!395 = !{null}
!396 = !{!397, !398}
!397 = !DILocalVariable(name: "myfile", scope: !393, file: !48, line: 173, type: !112)
!398 = !DILocalVariable(name: "count", scope: !393, file: !48, line: 174, type: !55)
!399 = !DILocation(line: 172, column: 15, scope: !400)
!400 = distinct !DILexicalBlock(scope: !393, file: !48, line: 172, column: 8)
!401 = !DILocation(line: 173, column: 5, scope: !393)
!402 = !DILocation(line: 173, column: 10, scope: !393)
!403 = !DILocation(line: 175, column: 13, scope: !393)
!404 = !DILocation(line: 0, scope: !393)
!405 = !DILocation(line: 176, column: 5, scope: !393)
!406 = !DILocation(line: 177, column: 5, scope: !393)
!407 = !DILocation(line: 178, column: 1, scope: !393)
!408 = distinct !DISubprogram(name: "runOnCGRA", scope: !48, file: !48, line: 181, type: !409, scopeLine: 182, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!409 = !DISubroutineType(types: !410)
!410 = !{!9}
!411 = !DILocation(line: 183, column: 5, scope: !408)
!412 = !DILocation(line: 184, column: 5, scope: !408)
!413 = !{i32 5341}
!414 = !DILocation(line: 185, column: 5, scope: !408)
!415 = distinct !DISubprogram(name: "accelerateOnCGRA", scope: !48, file: !48, line: 188, type: !416, scopeLine: 189, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !418)
!416 = !DISubroutineType(types: !417)
!417 = !{null, !29}
!418 = !{!419, !420, !421}
!419 = !DILocalVariable(name: "loopNo", arg: 1, scope: !415, file: !48, line: 188, type: !29)
!420 = !DILocalVariable(name: "result", scope: !415, file: !48, line: 191, type: !11)
!421 = !DILocalVariable(name: "configure", scope: !415, file: !48, line: 193, type: !11)
!422 = !DILocation(line: 0, scope: !415)
!423 = !DILocation(line: 190, column: 5, scope: !415)
!424 = !DILocation(line: 193, column: 21, scope: !415)
!425 = !DILocation(line: 199, column: 5, scope: !415)
!426 = !DILocation(line: 183, column: 5, scope: !408, inlinedAt: !427)
!427 = distinct !DILocation(line: 204, column: 5, scope: !415)
!428 = !DILocation(line: 184, column: 5, scope: !408, inlinedAt: !427)
!429 = !DILocation(line: 210, column: 1, scope: !415)
!430 = distinct !DISubprogram(name: "deleteCGRA", scope: !48, file: !48, line: 212, type: !394, scopeLine: 213, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!431 = !DILocation(line: 214, column: 3, scope: !430)
!432 = !DILocation(line: 222, column: 1, scope: !430)
!433 = distinct !DISubprogram(name: "createCGRA", scope: !48, file: !48, line: 225, type: !394, scopeLine: 226, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !434)
!434 = !{!435, !436}
!435 = !DILocalVariable(name: "result", scope: !433, file: !48, line: 228, type: !11)
!436 = !DILocalVariable(name: "i", scope: !433, file: !48, line: 229, type: !29)
!437 = !DILocation(line: 227, column: 13, scope: !438)
!438 = distinct !DILexicalBlock(scope: !433, file: !48, line: 227, column: 6)
!439 = !DILocation(line: 0, scope: !433)
!440 = !DILocation(line: 172, column: 15, scope: !400, inlinedAt: !441)
!441 = distinct !DILocation(line: 231, column: 3, scope: !433)
!442 = !DILocation(line: 173, column: 5, scope: !393, inlinedAt: !441)
!443 = !DILocation(line: 173, column: 10, scope: !393, inlinedAt: !441)
!444 = !DILocation(line: 175, column: 13, scope: !393, inlinedAt: !441)
!445 = !DILocation(line: 0, scope: !393, inlinedAt: !441)
!446 = !DILocation(line: 176, column: 5, scope: !393, inlinedAt: !441)
!447 = !DILocation(line: 177, column: 5, scope: !393, inlinedAt: !441)
!448 = !DILocation(line: 178, column: 1, scope: !393, inlinedAt: !441)
!449 = !DILocation(line: 232, column: 43, scope: !433)
!450 = !DILocation(line: 232, column: 42, scope: !433)
!451 = !DILocation(line: 232, column: 22, scope: !433)
!452 = !DILocation(line: 232, column: 13, scope: !433)
!453 = !DILocation(line: 233, column: 40, scope: !433)
!454 = !DILocation(line: 233, column: 22, scope: !433)
!455 = !DILocation(line: 233, column: 13, scope: !433)
!456 = !DILocation(line: 234, column: 22, scope: !433)
!457 = !DILocation(line: 234, column: 13, scope: !433)
!458 = !DILocation(line: 235, column: 22, scope: !433)
!459 = !DILocation(line: 235, column: 13, scope: !433)
!460 = !DILocation(line: 241, column: 16, scope: !461)
!461 = distinct !DILexicalBlock(scope: !462, file: !48, line: 241, column: 3)
!462 = distinct !DILexicalBlock(scope: !433, file: !48, line: 241, column: 3)
!463 = !DILocation(line: 241, column: 3, scope: !462)
!464 = !DILocation(line: 243, column: 7, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !48, line: 242, column: 3)
!466 = !DILocation(line: 241, column: 32, scope: !461)
!467 = !DILocation(line: 241, column: 19, scope: !461)
!468 = distinct !{!468, !463, !469, !253, !254}
!469 = !DILocation(line: 244, column: 3, scope: !462)
!470 = !DILocation(line: 247, column: 3, scope: !433)
!471 = !DILocation(line: 254, column: 1, scope: !433)
