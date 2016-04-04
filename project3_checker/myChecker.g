grammar myChecker;

@header {
// import packages here.
import java.util.HashMap;
}

@members {
boolean TRACEON = false;
HashMap<String,Integer> symtab = new HashMap<String,Integer>();

}
program : prog|;
prog : Header prog {if (TRACEON) System.out.println("Header");}| type MAIN OParen CParen OBrace declarations statements CBrace{if (TRACEON) System.out.println("Type MAIN () {declarations statements}");};
type returns [int attr_type]:INT { if (TRACEON) System.out.println("type: INT"); $attr_type = 1;}
| CHAR { if (TRACEON) System.out.println("type: CHAR"); $attr_type = 4;}
| DOUBLE { if (TRACEON) System.out.println("type: DOUBLE");$attr_type = 3;}
| VOID { if (TRACEON) System.out.println("type: VOID"); $attr_type = 5;}
| FLOAT {if (TRACEON) System.out.println("type: FLOAT"); $attr_type = 2;};
declarations:type Identifier Line_sym declarations
{
        if (TRACEON) System.out.println("declarations: type Identifier : declarations");
        if (symtab.containsKey($Identifier.text)) {
                System.out.println("Type Error: " +
                                $Identifier.getLine() +
                                ": Redeclared Identifier.");
        } else {
                /* Add Identifier and its attr_type into the symbol table. */
                symtab.put($Identifier.text, $type.attr_type);
        }}
| type Identifier Assign primary_expression Line_sym declarations
{
        if (TRACEON) System.out.println("declarations: type Identifier Assign primary_expression: declarations");
        if (symtab.containsKey($Identifier.text)) {
                System.out.println("Type Error: " +
                                $Identifier.getLine() +
                                ": Redeclared Identifier.");
        } else {
                /* Add Identifier and its attr_type into the symbol table. */
                if($type.attr_type != $primary_expression.attr_type)
                {System.out.println("Type Error: " +$Identifier.getLine() +": Type mismatch for the two silde operands in an assignment statement.");}
                else
                {symtab.put($Identifier.text, $type.attr_type);}
        }}
|{ if (TRACEON) System.out.println("declarations: ");} ;




statements:statement statements
|;


arith_expression returns [int attr_type]:a = arith_term { $attr_type = $a.attr_type; }
(Add b = arith_term
 { if ($a.attr_type != $b.attr_type || $attr_type == -2) {
 System.out.println("Type Error: " +
         $a.start.getLine() +
         ": Type mismatch for the operator + in an expression.");
 $attr_type = -2;
 }
 }
 | Subtract c = arith_term
 { if ($a.attr_type != $c.attr_type || $attr_type == -2) {
 System.out.println("Type Error: " +
         $a.start.getLine() +
         ": Type mismatch for the operator - in an expression.");
 $attr_type = -2;
 }
 }
 |op_statement d = arith_term
 { if ($a.attr_type != $d.attr_type || $attr_type == -2) {
 System.out.println("Type Error: " +
         $a.start.getLine() +
         ": Type mismatch for the operator op_statement in an expression.");
 $attr_type = -2;
                                     }
 }
 )*;

arith_term returns [int attr_type]:a = arith_factor  { $attr_type = $a.attr_type; }
(Multiply b = arith_factor
 { if ($a.attr_type != $b.attr_type || $attr_type == -2) {
 System.out.println("Type Error: " +
         $a.start.getLine() +
         ": Type mismatch for the operator * in an expression.");
 $attr_type = -2;
 }
 }
 | Divide c = arith_factor
 { if ($a.attr_type != $c.attr_type || $attr_type == -2) {
 System.out.println("Type Error: " +
         $a.start.getLine() +
         ": Type mismatch for the operator / in an expression.");
 $attr_type = -2;
 }
 }
 )*;

arith_factor returns [int attr_type]: Subtract primary_expression { $attr_type = $primary_expression.attr_type; }
| primary_expression { $attr_type = $primary_expression.attr_type; };

primary_expression  returns [int attr_type]:Number { $attr_type = 1; }
| Float_Number { $attr_type = 2; }
| Identifier         {if (symtab.containsKey($Identifier.text)) {
        $attr_type = symtab.get($Identifier.text);
} else {
        /* Add codes to report and handle this error */
	    
        $attr_type = -2;
        return $attr_type;
}}
| Operate_variable { $attr_type = 6; }
| Single_Quotation primary_expression Single_Quotation { $attr_type = 4; }
| OParen arith_expression CParen
{ $attr_type = $arith_expression.attr_type; };

statement : statement1 | statement2;
statement1 returns [int attr_type]: Identifier Assign (arith_expression Line_sym
                {
                if (symtab.containsKey($Identifier.text)) {
                $attr_type = symtab.get($Identifier.text);
                } else {
                /* Add codes to report and handle this error */
					 System.out.println("Type Error: " +
                                $Identifier.getLine() +
                                ": Undeclared Identifier.");
                $attr_type = -2;
                return $attr_type;
                }
                if ($attr_type != $arith_expression.attr_type) {
                System.out.println("Type Error: " +
                        $arith_expression.start.getLine() +
                        ": Type mismatch for the two silde operands in an assignment statement.");
                $attr_type = -2;
                }
                }
                | Printf Line_sym
                {
                if (symtab.containsKey($Identifier.text)) {
                $attr_type = symtab.get($Identifier.text);
                } else {
                        /* Add codes to report and handle this error */
                        $attr_type = -2;
                        return $attr_type;
                }
                if ($attr_type != $arith_expression.attr_type) {
                        System.out.println("Type Error: " +
                                        $arith_expression.start.getLine() +
                                        ": Type mismatch for the two silde operands in an assignment statement.");
                        $attr_type = -2;
                }
                }
);

statement2   returns [int attr_type]:   key_function OParen parameter CParen statement3;
statement3 : OBrace statements CBrace {if (TRACEON) System.out.println("statement : key function(loop,while,if)");}
|  Line_sym {if (TRACEON) System.out.println("statement : common function");};

key_function: Determine {if (TRACEON) System.out.println("statement : if ");}
| Loop {if (TRACEON) System.out.println("statement : for or while ");}
| Printf;

parameter : Double_Quotation (Identifier | Number | Float_Number | Operate_variable | cal_statement | Special_String) Double_Quotation parameter{if (TRACEON) System.out.println("parameter style1.1");}
|(Identifier | Number | Float_Number | Operate_variable | cal_statement | Special_String)  parameter{if (TRACEON) System.out.println("parameter style1.2");}
| Line_sym (Identifier | Number | Float_Number |  Operate_variable | cal_statement | Special_String) parameter{if (TRACEON) System.out.println("parameter style2");}
|','  (Identifier | Number | Float_Number | Operate_variable | cal_statement | Special_String)  parameter{if (TRACEON) System.out.println("parameter style3");}|;

cal_statement : x = primary_expression (cal_op | op_statement | Assign)
y = primary_expression
{
        if($x.attr_type != $y.attr_type) System.out.println("Type Error::Type mismatch for the operator logical in an expression.");
        if (TRACEON) System.out.println("function in parameter");};
cal_op : Subtract|Add|Multiply|Divide;
op_statement : Operate | Logical;
 

/* description of the tokens */

FLOAT	:	'float';
INT		:	'int';
DOUBLE	: 	'double';
CHAR	:	'char';
MAIN	: 	'main';
VOID	: 	'void';


Printf	:	'printf';
Return	:	'return';

Special_type : '%'('d' | 'f' | 'c' | 's' | 'lf' | 'ld');
Operate_variable : (Operate)(Number | Float_Number | Identifier);
Operate : Increase | Decrease | Not | Modulus;
Assign : '=';

Logical : '<<'|'>>'|'<'|'>'|'||'|'&&'|'=='|'<='|'>='|'!='|'=';

fragment And : '&&';
fragment Or : '||';
fragment Modulus : '%';
fragment Equal : '==';
fragment LTEquals :'<=';
fragment GTEquals : '>=';
fragment Not_equal : '!=';
fragment Not : '!';
fragment Increase : '++';
fragment Decrease : '--';
Add : '+';
Subtract : '-';
Multiply : '*';
Divide : '/';
fragment Shift_Right : '<<';
fragment Shift_Left : '>>';
fragment LT : '<';
fragment GT : '>';
OBrace : '{';
CBrace : '}';
OBracket : '[';
CBracket : ']';
OParen : '(';
CParen : ')';


Line_sym	: ';';
Comma	: ',';
Single_Quotation	:	('\'')*;
WS:( ' ' | '\t' | '\r' | '\n'|'\\''n'|'\\i''t'|'\\''r' )+ {$channel=HIDDEN;};

Number	:	('0' | ('1'..'9')(Digit)*);

Loop	:	'While' | 'for';
Determine : ('if' | 'else if' | 'else') | Switch_Case;
Header :  (Include_System | Include_Lib);
Identifier : (Charactor)(Charactor | Digit)*;
Special_String : (Charactor | Digit | Special_type | Logical)*;

Float_Number: Float_Number1 | Float_Number2;
fragment Float_Number1: (Digit)+'.'(Digit)*;
fragment Float_Number2: '.'(Digit)+;

Comment1 : '//'(.)*'\n' {$channel=HIDDEN;};
Comment2 : '/*' (options{greedy=false;}: .)* '*/' {$channel=HIDDEN;};



fragment Digit : '0'..'9';
fragment Include_System : '#include'(WS)*'<'Identifier'.h''>';
fragment Include_Lib : '#include'(WS)*'"'Identifier'.h''"';

fragment Switch_Case : 'switch' | 'case';
fragment Charactor : 'a'..'z' | 'A'..'Z' | '_';

Double_Quotation : ('\"');
