all:
	java -cp antlr-3.5.1-complete-no-st3.jar \org.antlr.Tool myChecker.g
	javac -cp antlr-3.5.1-complete-no-st3.jar:. myChecker_test.java
program1:
	java -cp antlr-3.5.1-complete-no-st3.jar:. myChecker_test example.c
	
program2:
	java -cp antlr-3.5.1-complete-no-st3.jar:. myChecker_test typecheck.c

program3:
	java -cp antlr-3.5.1-complete-no-st3.jar:. myChecker_test typecheck2.c

