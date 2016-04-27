How to compile and execute?

Step by step 

1.java -jar ./antlr-3.5.1-complete-no-st3.jar
2.java -cp ./antlr-3.5.1-complete-no-st3.jar org.antlr.Tool
3.java -cp ./antlrworks-1.5.jar org.antlr.Tool
4.make tokens

[compile]
make compile

[execute 3 testprograms]
java -cp ./antlr-complete-no-str.jar:. testLexer Compute.c
java -cp ./antlr-complete-no-str.jar:. testLexer bubble.c
java -cp ./antlr-complete-no-str.jar:. testLexer binarytree.c