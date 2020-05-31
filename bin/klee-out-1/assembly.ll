; ModuleID = '1.bc'
source_filename = "1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 2, i32* %2, align 4, !dbg !12
  call void @llvm.dbg.declare(metadata i32* %3, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %4, metadata !15, metadata !DIExpression()), !dbg !16
  %5 = bitcast i32* %3 to i8*, !dbg !17
  call void @klee_make_symbolic(i8* %5, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)), !dbg !18
  br label %6, !dbg !19

; <label>:6:                                      ; preds = %14, %0
  %7 = load i32, i32* %2, align 4, !dbg !20
  %8 = icmp ne i32 %7, 0, !dbg !19
  br i1 %8, label %9, label %17, !dbg !19

; <label>:9:                                      ; preds = %6
  %10 = load i32, i32* %3, align 4, !dbg !21
  %11 = icmp sgt i32 %10, 10, !dbg !24
  br i1 %11, label %12, label %13, !dbg !25

; <label>:12:                                     ; preds = %9
  store i32 2, i32* %4, align 4, !dbg !26
  br label %14, !dbg !28

; <label>:13:                                     ; preds = %9
  store i32 6, i32* %4, align 4, !dbg !29
  br label %14

; <label>:14:                                     ; preds = %13, %12
  %15 = load i32, i32* %2, align 4, !dbg !31
  %16 = add nsw i32 %15, -1, !dbg !31
  store i32 %16, i32* %2, align 4, !dbg !31
  br label %6, !dbg !19, !llvm.loop !32

; <label>:17:                                     ; preds = %6
  ret i32 0, !dbg !34
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "1.c", directory: "/home/strahinja/repo/bin")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !8, isLocal: false, isDefinition: true, scopeLine: 7, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 8, type: !10)
!12 = !DILocation(line: 8, column: 6, scope: !7)
!13 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 8, type: !10)
!14 = !DILocation(line: 8, column: 13, scope: !7)
!15 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 8, type: !10)
!16 = !DILocation(line: 8, column: 16, scope: !7)
!17 = !DILocation(line: 10, column: 21, scope: !7)
!18 = !DILocation(line: 10, column: 2, scope: !7)
!19 = !DILocation(line: 12, column: 2, scope: !7)
!20 = !DILocation(line: 12, column: 9, scope: !7)
!21 = !DILocation(line: 13, column: 7, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 13, column: 7)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 12)
!24 = !DILocation(line: 13, column: 9, scope: !22)
!25 = !DILocation(line: 13, column: 7, scope: !23)
!26 = !DILocation(line: 14, column: 6, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !1, line: 13, column: 15)
!28 = !DILocation(line: 15, column: 3, scope: !27)
!29 = !DILocation(line: 17, column: 6, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !1, line: 16, column: 8)
!31 = !DILocation(line: 19, column: 4, scope: !23)
!32 = distinct !{!32, !19, !33}
!33 = !DILocation(line: 20, column: 2, scope: !7)
!34 = !DILocation(line: 22, column: 2, scope: !7)
