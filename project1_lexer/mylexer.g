lexer grammar mylexer;

options {
	language = Java;
	}


Int	:	'int';
Char	:	'char';
Void	:	'void';
Float	:	'float';
Double	:	'double';

Print	:	'printf';
If	:	'if';
Else	:	'else';
While	:	'while';
For	:	'for';
Return	:	'return';

Or	:	'||';
And	:	'&&';
EQ	:	'==';
NE	:	'!=';
GTE	:	'>=';
LTE	:	'<=';
GT	:	'>';
LT	:	'<';
Add	:	'+';
Sub	:	'-';
Mul	:	'*';
Div	:	'/';
Mod	:	'%';
LBrace   : '{';  
RBrace   : '}';  
LBracket : '[';  
RBracket : ']';  
LParen   : '(';  
RParen   : ')';  
SColon   : ';';  
Assign   : '=';  
Comma    : ',';  
Colon    : ':';  

Identifier
	:	(Letter)(Letter | Digit)*;
	
String  
@after { 
  setText(getText().substring(1, getText().length()-1).replaceAll("\\\\(.)", "$1")); 
}  
  :  '"'  (~('"' | '\\')  | '\\' .)* '"'   
  |  '\'' (~('\'' | '\\') | '\\' .)* '\''   
  ;  

Number	:	('0' | ('1'..'9')(Digit)*);

FloatNumber
	:	FloatNumber1 | FloatNumber2 | FloatNumber3;

fragment FloatNumber1
	:	(Digit)+'.'(Digit)*;
fragment FloatNumber2
	:	'.'(Digit)+;
fragment FloatNumber3
	:	(Digit)+;

Comment1:	'//'(.)*'\n';
Comment2:	'/*'(options{greedy=false;}: .)* '*/';

WhiteSpace
	:	(' ' | '\r' | '\t'  )+{skip();};

Newline	:	'\n';


fragment Letter
	:	'a'..'z' | 'A'..'Z' | '_';

fragment Digit
	:	'0'..'9';



