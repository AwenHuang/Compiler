all:
	java -cp antlr-3.5.1-complete-no-st3.jar \org.antlr.Tool myCompiler.g
	javac -cp antlr-3.5.1-complete-no-st3.jar:. myCompiler_test.java
p1:
	java -cp antlr-3.5.1-complete-no-st3.jar:. myCompiler_test arith.c
	mv asscode.s arith.s
	gcc arith.s -o p1
p2:
	java -cp antlr-3.5.1-complete-no-st3.jar:. myCompiler_test ifStatement_f.c
	mv asscode.s ifStatement_f.s
	gcc ifStatement_f.s -o p2
p3:
	java -cp antlr-3.5.1-complete-no-st3.jar:. myCompiler_test ifStatement_t.c
	mv asscode.s ifStatement_t.s
	gcc ifStatement_t.s -o p3
p4:
	java -cp antlr-3.5.1-complete-no-st3.jar:. myCompiler_test whileStatement_f.c
	mv asscode.s whileStatement_f.s
	gcc whileStatement_f.s -o p4
p5:
	java -cp antlr-3.5.1-complete-no-st3.jar:. myCompiler_test whileStatement_t.c
	mv asscode.s whileStatement_t.s
	gcc whileStatement_t.s -o p5
	

