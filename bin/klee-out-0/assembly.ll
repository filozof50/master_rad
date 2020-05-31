; ModuleID = '1.bc'
source_filename = "1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"n != 0\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"1.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"1 is neither prime nor composite.\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"%d is a prime number.\0A\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"%d is not a prime number.\0A\00", align 1
@.str.6 = private unnamed_addr constant [66 x i8] c"/home/strahinja/repo/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.7 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.8 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 !dbg !9 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %3, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %4, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %4, align 4, !dbg !18
  %5 = bitcast i32* %2 to i8*, !dbg !19
  call void @klee_make_symbolic(i8* %5, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)), !dbg !20
  store i32 2, i32* %3, align 4, !dbg !21
  br label %6, !dbg !23

; <label>:6:                                      ; preds = %17, %0
  %7 = load i32, i32* %3, align 4, !dbg !24
  %8 = load i32, i32* %2, align 4, !dbg !26
  %9 = sdiv i32 %8, 2, !dbg !27
  %10 = icmp sle i32 %7, %9, !dbg !28
  br i1 %10, label %11, label %20, !dbg !29

; <label>:11:                                     ; preds = %6
  %12 = load i32, i32* %2, align 4, !dbg !30
  %13 = load i32, i32* %3, align 4, !dbg !33
  %int_cast_to_i64 = zext i32 %13 to i64, !dbg !34
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !34
  %14 = srem i32 %12, %13, !dbg !34, !klee.check.div !35
  %15 = icmp eq i32 %14, 0, !dbg !36
  br i1 %15, label %16, label %17, !dbg !37

; <label>:16:                                     ; preds = %11
  store i32 1, i32* %4, align 4, !dbg !38
  br label %20, !dbg !40

; <label>:17:                                     ; preds = %11
  %18 = load i32, i32* %3, align 4, !dbg !41
  %19 = add nsw i32 %18, 1, !dbg !41
  store i32 %19, i32* %3, align 4, !dbg !41
  br label %6, !dbg !42, !llvm.loop !43

; <label>:20:                                     ; preds = %16, %6
  %21 = load i32, i32* %2, align 4, !dbg !45
  %22 = icmp ne i32 %21, 0, !dbg !45
  br i1 %22, label %24, label %23, !dbg !45

; <label>:23:                                     ; preds = %20
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 222, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #5, !dbg !45
  unreachable, !dbg !45

; <label>:24:                                     ; preds = %20
  %25 = load i32, i32* %2, align 4, !dbg !46
  %26 = icmp eq i32 %25, 1, !dbg !48
  br i1 %26, label %27, label %29, !dbg !49

; <label>:27:                                     ; preds = %24
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i32 0, i32 0)), !dbg !50
  br label %37, !dbg !52

; <label>:29:                                     ; preds = %24
  %30 = load i32, i32* %4, align 4, !dbg !53
  %31 = icmp eq i32 %30, 0, !dbg !56
  %32 = load i32, i32* %2, align 4
  br i1 %31, label %33, label %35, !dbg !57

; <label>:33:                                     ; preds = %29
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i32 %32), !dbg !58
  br label %37, !dbg !58

; <label>:35:                                     ; preds = %29
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.5, i32 0, i32 0), i32 %32), !dbg !59
  br label %37

; <label>:37:                                     ; preds = %33, %35, %27
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define void @klee_div_zero_check(i64) #0 !dbg !61 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  call void @llvm.dbg.declare(metadata i64* %2, metadata !65, metadata !DIExpression()), !dbg !66
  %3 = load i64, i64* %2, align 8, !dbg !67
  %4 = icmp eq i64 %3, 0, !dbg !69
  br i1 %4, label %5, label %6, !dbg !70

; <label>:5:                                      ; preds = %1
  call void @klee_report_error(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.6, i32 0, i32 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.7, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.8, i32 0, i32 0)) #6, !dbg !71
  unreachable, !dbg !71

; <label>:6:                                      ; preds = %1
  ret void, !dbg !72
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0, !3}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8, !8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "1.c", directory: "/home/strahinja/repo/bin")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C89, file: !4, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!4 = !DIFile(filename: "/home/strahinja/repo/klee/runtime/Intrinsic/klee_div_zero_check.c", directory: "/home/strahinja/repo/runtime/Intrinsic")
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 209, type: !10, isLocal: false, isDefinition: true, scopeLine: 209, isOptimized: false, unit: !0, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "n", scope: !9, file: !1, line: 210, type: !12)
!14 = !DILocation(line: 210, column: 9, scope: !9)
!15 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 210, type: !12)
!16 = !DILocation(line: 210, column: 12, scope: !9)
!17 = !DILocalVariable(name: "flag", scope: !9, file: !1, line: 210, type: !12)
!18 = !DILocation(line: 210, column: 15, scope: !9)
!19 = !DILocation(line: 212, column: 24, scope: !9)
!20 = !DILocation(line: 212, column: 5, scope: !9)
!21 = !DILocation(line: 214, column: 12, scope: !22)
!22 = distinct !DILexicalBlock(scope: !9, file: !1, line: 214, column: 5)
!23 = !DILocation(line: 214, column: 10, scope: !22)
!24 = !DILocation(line: 214, column: 17, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !1, line: 214, column: 5)
!26 = !DILocation(line: 214, column: 22, scope: !25)
!27 = !DILocation(line: 214, column: 24, scope: !25)
!28 = !DILocation(line: 214, column: 19, scope: !25)
!29 = !DILocation(line: 214, column: 5, scope: !22)
!30 = !DILocation(line: 216, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 216, column: 13)
!32 = distinct !DILexicalBlock(scope: !25, file: !1, line: 214, column: 34)
!33 = !DILocation(line: 216, column: 17, scope: !31)
!34 = !DILocation(line: 216, column: 15, scope: !31)
!35 = !{!"True"}
!36 = !DILocation(line: 216, column: 19, scope: !31)
!37 = !DILocation(line: 216, column: 13, scope: !32)
!38 = !DILocation(line: 217, column: 18, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !1, line: 216, column: 25)
!40 = !DILocation(line: 218, column: 13, scope: !39)
!41 = !DILocation(line: 214, column: 29, scope: !25)
!42 = !DILocation(line: 214, column: 5, scope: !25)
!43 = distinct !{!43, !29, !44}
!44 = !DILocation(line: 220, column: 5, scope: !22)
!45 = !DILocation(line: 222, column: 5, scope: !9)
!46 = !DILocation(line: 224, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !9, file: !1, line: 224, column: 9)
!48 = !DILocation(line: 224, column: 11, scope: !47)
!49 = !DILocation(line: 224, column: 9, scope: !9)
!50 = !DILocation(line: 225, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 224, column: 17)
!52 = !DILocation(line: 226, column: 5, scope: !51)
!53 = !DILocation(line: 228, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 228, column: 13)
!55 = distinct !DILexicalBlock(scope: !47, file: !1, line: 227, column: 10)
!56 = !DILocation(line: 228, column: 18, scope: !54)
!57 = !DILocation(line: 228, column: 13, scope: !55)
!58 = !DILocation(line: 229, column: 13, scope: !54)
!59 = !DILocation(line: 231, column: 13, scope: !54)
!60 = !DILocation(line: 234, column: 5, scope: !9)
!61 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4, file: !4, line: 12, type: !62, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, unit: !3, variables: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{null, !64}
!64 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!65 = !DILocalVariable(name: "z", arg: 1, scope: !61, file: !4, line: 12, type: !64)
!66 = !DILocation(line: 12, column: 36, scope: !61)
!67 = !DILocation(line: 13, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !61, file: !4, line: 13, column: 7)
!69 = !DILocation(line: 13, column: 9, scope: !68)
!70 = !DILocation(line: 13, column: 7, scope: !61)
!71 = !DILocation(line: 14, column: 5, scope: !68)
!72 = !DILocation(line: 15, column: 1, scope: !61)
