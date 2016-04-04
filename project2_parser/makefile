#bulid
all:
	java -cp antlr-3.5.1-complete-no-st3.jar \org.antlr.Tool myparser.g
	javac -cp antlr-3.5.1-complete-no-st3.jar:. testParser.java
program1:
	java -cp antlr-3.5.1-complete-no-st3.jar:. testParser Ifstatement.c
program2:
	java -cp antlr-3.5.1-complete-no-st3.jar:. testParser Whilestatement.c
program3:
	java -cp antlr-3.5.1-complete-no-st3.jar:. testParser ifWhile.c
