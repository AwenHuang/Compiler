How to Compile and Execute:

1.打"make"指令，會先compile myChecker.g & myChecker_test.java 

2.打"make program1" 會check example.c這個測試檔

3.打"make program2" 會check typecheck.c這個測試檔

4.打"make program3" 會check typecheck2.c這個測試檔

如果程式中有type error，會看到該程式哪一行有error，並顯示出是什麼樣的type error

----------------------------------------------------------------

1. make		   (compile myChecker.g and myChecker_test.java)
2. make program1   (check example.c)
3. make program2   (check typecheck.c)
4. make program3   (check typecheck2.c)