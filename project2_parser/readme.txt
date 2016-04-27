How to Compile and Execute my parser analyzer:

1.打"make"指令，會先compile myparser.g & testParser.java 

2.打"make program1" 會parse Ifstatement.c這個測試檔

3.打"make program2" 會parse Whilestatement.c這個測試檔

4.打"make program3" 會parse ifWhile.c這個測試檔

parse成功後，會看到各個測試檔使用到這支parser的哪些rule

--------------------------------------------------------
1. make             (compile myparser.g and testParser.java) 
2. make program1    (parse Ifstatement.c)
3. make program2    (parse Whilestatement.c)
4. make program3    (parse ifWhile.c)

