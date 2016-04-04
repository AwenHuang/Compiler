grammar myparser;

@header {
// import packages here.
import java.util.HashMap;
}

@members {
boolean TRACEON = true;

}

head: Poundsign Include '<' Identifier '.' Identifier '>' program;

program: VOID MAIN '(' ')' '{' declarations statements end '}'
        {if (TRACEON) System.out.println("VOID MAIN () {declarations statements}");};

declarations:type Identifier ';' declarations
             { if (TRACEON) System.out.println("declarations: type Identifier : declarations"); }
           | { if (TRACEON) System.out.println("declarations: ");} ;

end	:	Return Integer_constant ';' {if (TRACEON) System.out.println("Return Integer_constant ");};

type:INT { if (TRACEON) System.out.println("type: INT"); }
   | FLOAT {if (TRACEON) System.out.println("type: FLOAT"); };

statements:		statement  statements		{if (TRACEON) System.out.println("statements: statement statements");}
		  |		'{' statement+ '}' statements  	{if (TRACEON) System.out.println("statements: {statement statements}");}
		  |
		  ;
		
statement	:	assignment ';' 		{if (TRACEON) System.out.println("statement: assignment;");}
			|	ifStatement	   		{if (TRACEON) System.out.println("statement: ifStatement");}
			|	whileStatement 		{if (TRACEON) System.out.println("statement: whileStatement");}
			| 	output				{if (TRACEON) System.out.println("statement: output");}
			;

assignment	:	Identifier '=' expression 		{if (TRACEON) System.out.println("assignment: Identifier = expression");} ;

expression	:	condExpr   {if (TRACEON) System.out.println("expression: condExpr");};

condExpr	:	orExpr ('?' expression ':' expression )? ;

orExpr	:	andExpr ('||' andExpr)* ;   

andExpr	:	equExpr ('&&' equExpr)* ;   

equExpr	:	relExpr (('==' | '!=') relExpr)*;	

relExpr	:	addExpr (('>=' | '<=' | '>' | '<') addExpr)*;   

addExpr	:	mulExpr (('+' | '-') mulExpr)*  ;

mulExpr	: 	powExpr(('*' | '/' | '%') powExpr)* ;

powExpr	:	unaryExpr ('^' unaryExpr)* ;

unaryExpr	:	'-' atom
			|	'!' atom
			|	atom ;
			
atom	:	'null'         		        {if (TRACEON) System.out.println("atom: null");}
		|   Identifier      	        {if (TRACEON) System.out.println("atom: Identifier");}
		|  	Integer_constant    	    {if (TRACEON) System.out.println("atom: Integer_constant");}
		| 	Floating_point_constant     {if (TRACEON) System.out.println("atom: Floating_point_constant");}
		;
		
output	:	Printf '(' String ')' ';'    {if (TRACEON) System.out.println("output: Printf( String );");};

ifStatement  
  :  ifStat    		{if (TRACEON) System.out.println("ifStatement: ifStat");}
  |	 elseIfStat     {if (TRACEON) System.out.println("ifStatement: elseIfStat");}
  |	 elseStat	    {if (TRACEON) System.out.println("ifStatement: elseStat");}
  ;  
  
ifStat  
  :  If '(' expression ')'
  ;  
  
elseIfStat  
  :  Else If '(' expression ')' 
  ;  
  
elseStat  
  :  Else assignment ';' ;  
  
whileStatement  
  :  While '(' expression ')'
  ;  
  

/* description of the tokens */
Poundsign	:	'#';
Include	:	'include';

FLOAT	:	'float';
INT		:	'int';
MAIN	: 	'main';
VOID	: 	'void';

If		:	'if';
Else	:	'else';
While	:	'while';

Printf	:	'printf';
Return	:	'return';

String  
@after { 
  setText(getText().substring(1, getText().length()-1).replaceAll("\\\\(.)", "$1")); 
}  
  :  '"'  (~('"' | '\\')  | '\\' .)* '"'   
  |  '\'' (~('\'' | '\\') | '\\' .)* '\''   
  ;  
 
 
Identifier:('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*;
Integer_constant:'0'..'9'+;
Floating_point_constant:'0'..'9'+ '.' '0'..'9'+;

WS:( ' ' | '\t' | '\r' | '\n' ) {$channel=HIDDEN;};

COMMENT:'/*' .* '*/' {$channel=HIDDEN;};