How to Compile and Execute my parser analyzer:

1.打"make"指令
會先compile myCompiler.g & myCompiler_test.java 

2.打"make p1"
會編譯arith.c這個測試檔
印出生成的x86 code
並生成arith.s以及p1執行檔

3.打"make p2"
會編譯ifStatement_f.c這個測試檔
印出生成的x86 code
並生成ifStatement_f.s以及p2執行檔

4.打"make p3"
會編譯ifStatement_t.c這個測試檔
印出生成的x86 code
並生成ifStatement_t.s以及p3執行檔

5.打"make p4"
會編譯whileStatement_f.c這個測試檔
印出生成的x86 code
並生成whileStatement_f.s以及p4執行檔

6.
5.打"make p5"
會編譯whileStatement_t.c這個測試檔
印出生成的x86 code
並生成whileStatement_t.s以及p5執行檔

-----------------------------------------------
1. make		(compile myCompiler.g and myCompiler_test.java)
2. make p1	(compile arith.c, create x86 code、arith.s and excute file p1) 
3. make p2	(compile ifStatement_f.c, create x86 code、ifStatement_f.s and excute file p2) 
4. make p3	(compile ifStatement_t.c, create x86 code、ifStatement_t.s and excute file p3) 
5. make p4	(compile whileStatement_f.c, create x86 code、whileStatement_f.s and excute file p4) 
6. make p5	(compile whileStatement_t.c, create x86 code、whileStatement_t.s and excute file p5) 