grammar myCompiler;

options {
    language = Java;
}

@header {
    // import packages here.
    import java.util.HashMap;
    import java.util.ArrayList;
}

@members {
    boolean TRACEON = false;
    HashMap<String,Integer> symtab = new HashMap<String,Integer>();
    int labelCount = 0;
	int L_opt;

	  /*
    public enum TypeInfo {
    StringConstant,
    Integer,
		Float,
		Unknown,
		No_Exist,
		Error
    }
    */

    /* attr_type:
       1 => integer,
       2 => float,
       3 => String constant,
       -1 => do not exist,
       -2 => error
     */
     
    List<String> DataCode = new ArrayList<String>();
    List<String> TextCode = new ArrayList<String>();
 
    public static register reg = new register(0, 10);
    
    /*
     * Output prologue.
     */
    void prologue(String id)
    {
   	   TextCode.add("\n\n/* Text section */");
       TextCode.add("\t.section .text");
       TextCode.add("\t.global " + id);
       TextCode.add("\t.type " + id + ",@function");
       TextCode.add(id + ":");
       
       /* Follow x86 calling convention */
       TextCode.add("\t pushq \%rbp");
       TextCode.add("\t movq \%rsp,\%rbp");
       TextCode.add("\t pushq \%rbx"); //callee saved registers.
       TextCode.add("\t pushq \%r12"); //callee saved registers.
       TextCode.add("\t pushq \%r13"); //callee saved registers.
       TextCode.add("\t pushq \%r14"); //callee saved registers.
       TextCode.add("\t pushq \%r15"); //callee saved registers.
       TextCode.add("\t subq $8,\%rsp\n"); // aligned 16-byte boundary.
    }
    
    /*
     * Output epilogue.
     */
    void epilogue()
    {
       /* handle epilogue */
       
       /* Follow x86 calling convention */
       TextCode.add("\n\t addq $8,\%rsp");
       TextCode.add("\t popq \%r15");
       TextCode.add("\t popq \%r14");
       TextCode.add("\t popq \%r13");
       TextCode.add("\t popq \%r12");
       TextCode.add("\t popq \%rbx");
       TextCode.add("\t popq \%rbp");
	     TextCode.add("\t ret");
    }
    
    
    /* Generate a new label */
    String newLabel()
    {
	  
	
	   labelCount ++;
	   
	   return (new String("L")) + Integer.toString(labelCount);
    } 
	
	
	
    
    
    public List<String> getDataCode()
    {
       return DataCode;
    }
    
    public List<String> getTextCode()
    {
       return TextCode;
    }
}


program
    : declarations functions
    ;


functions
    : function functions
    |
    ;
				  
function
    : type Identifier '(' ')' '{'
      {
         /* output function prologue */
         prologue($Identifier.text);
      }
      l_declarations statements '}'
      {
	     if (TRACEON)
		     System.out.println("type Identifier () {declarations statements}");
	    
		 /* output function epilogue */	  
	     epilogue();
	  }
	;


/* global declaraction */
declarations
    :
	  type Identifier ';' declarations
      { 
	    if (TRACEON) System.out.println("declarations: type Identifier : declarations");
		if (symtab.containsKey($Identifier.text)) {
		    System.out.println("Type Error: " + 
				                $Identifier.getLine() + 
							    ": Redeclared identifier.");
	    } else {
			/* Add ID and its attr_type into the symbol table. */
			symtab.put($Identifier.text, $type.attr_type);	   
	    }
		
		/* code generation */
		switch($type.attr_type) {
		case 1: /* Type: integer, size=> 4 bytes, alignment=> 4 byte boundary. */
		        DataCode.add("\t .common " + $Identifier.text + ",4,4\n");
				break;
		case 2: /* Type: float, size=> 4 bytes, alignment=> 4 byte boundary. */
		        DataCode.add("\t .common " + $Identifier.text + ",4,4\n");
				break;
		
		default:
		}
	  }
    | { if (TRACEON) System.out.println("declarations: ");}
    ;


l_declarations
    :
    type Identifier ';' l_declarations
    {
	
      /* If you want to handle local variables, fix it. */ 
	   { 
	    if (TRACEON) System.out.println("declarations: type Identifier : declarations");
		if (symtab.containsKey($Identifier.text)) {
		    System.out.println("Type Error: " + 
				                $Identifier.getLine() + 
							    ": Redeclared identifier.");
	    } else {
			/* Add ID and its attr_type into the symbol table. */
			symtab.put($Identifier.text, $type.attr_type);	   
	    }
		
		/* code generation */
		switch($type.attr_type) {
		case 1: /* Type: integer, size=> 4 bytes, alignment=> 4 byte boundary. */
		        DataCode.add("\t .common " + $Identifier.text + ",4,4\n");
				break;
		case 2: /* Type: float, size=> 4 bytes, alignment=> 4 byte boundary. */
		        DataCode.add("\t .common " + $Identifier.text + ",4,4\n");
				break;
		
		default:
		}
	  }
    }
    | 
    ;


type returns [int attr_type]
    : INT   { if (TRACEON) System.out.println("type: INT");  $attr_type=1; }
    | FLOAT { if (TRACEON) System.out.println("type: FLOAT");  $attr_type=2; }
    | VOID
    | CHAR  
    ;

statements: statement statements
    |
    ;
		
statement returns [int attr_type,int p,String label]
    : Identifier '=' arith_expression ';'
	  { 
	    
	    if (symtab.containsKey($Identifier.text)) {
	       $attr_type = symtab.get($Identifier.text);
	    } 
		else {
         /* Add codes to report and handle this error */
           System.err.println("Type Error: " + $Identifier.getLine() + ": Undeclared identifier.");
	       $attr_type = -2;
	    }
		  
	    if ($attr_type != $arith_expression.attr_type) {
           System.out.println("Type Error: " + 
		                       $arith_expression.start.getLine() +
 		 	                   ": Type mismatch for the two silde operands in an assignment statement.");
		      $attr_type = -2;
		}
		else{
                if($attr_type == -2 && $arith_expression.attr_type == -2){
                        System.err.println("Type Error: " + $arith_expression.start.getLine() + ": Type mismatch for the two silde operands in an assignment statement.");
                        $attr_type = -2;
                }
        }
	  
	  /* code generation */
	  $p = $arith_expression.p;
		if($p == 1){
		    TextCode.add("\t movl " + "\$" + $arith_expression.str + "," + $Identifier.text + "(\%rip)");
			$p = 0;
		}
	    else{
			if ($arith_expression.reg_num == 0)
				TextCode.add("\t movq " + "\%rax" + "," + $Identifier.text + "(\%rip)");
			else if ($arith_expression.reg_num == 1)       
				TextCode.add("\t movq " + "\%rbx" + "," + $Identifier.text + "(\%rip)");
			else if ($arith_expression.reg_num == 2)
				TextCode.add("\t movq " + "\%rcx" + "," + $Identifier.text + "(\%rip)");
			else if ($arith_expression.reg_num == 3)
				TextCode.add("\t movq " + "\%rdx" + "," + $Identifier.text + "(\%rip)");
			else if ($arith_expression.reg_num == 4)
				TextCode.add("\t movq " + "\%r8" + "," + $Identifier.text + "(\%rip)");
			else if ($arith_expression.reg_num == 5)
				TextCode.add("\t movq " + "\%r9" + "," + $Identifier.text + "(\%rip)");
			else if ($arith_expression.reg_num == 6)
				TextCode.add("\t movq " + "\%r10" + "," + $Identifier.text + "(\%rip)");
			else
				break;
			//TextCode.add("\t movq " + "\%" + $arith_expression.reg_num + "," + $Identifier.text + "(\%rip)");
		}
	  }
        
	 
      //TextCode.add("\t movq " + "\%" + $arith_expression.reg_num + "," + $Identifier.text + "(\%rip)");
	  
    | ifStatement if_then_statements
	{
		TextCode.add("." + $if_then_statements.label + ":");
	}
	| whileStatement while_statement
    | Identifier func_argument
    {
      /* code generation */
      TextCode.add("\t movq " + "$" + $func_argument.label + ",\%rdi");
      TextCode.add("\t call " + $Identifier.text);
    }
    ;


func_argument returns [String label, int attr_type]
    : '(' ')' ';'
      {
        /* handle function calls here. */
      }
    | '(' a = arith_expression 
      {
         /* handle function calls here. */
         if ($a.attr_type == 3) { // handle string type.
            $label = newLabel();
            DataCode.add($label + ":");
            DataCode.add("\t .string " + $a.str);
         }
      }
	(
	',' b = arith_expression
	{
		if($b.attr_type != 1) 
                 System.err.println("MyPrintf don't support this tpye!");
				 
       if ($b.reg_num == 0)
			TextCode.add("\t movq " + "\%rax" + "," + "\%rsi");
       else if ($b.reg_num == 1)       
            TextCode.add("\t movq " + "\%rbx" + "," + "\%rsi");
       else if ($b.reg_num == 2)
            TextCode.add("\t movq " + "\%rcx" + "," + "\%rsi");
       else if ($b.reg_num == 3)
            TextCode.add("\t movq " + "\%rdx" + "," + "\%rsi");
       else if ($b.reg_num == 4)
            TextCode.add("\t movq " + "\%r8" + "," + "\%rsi");
       else if ($b.reg_num == 5)
            TextCode.add("\t movq " + "\%r9" + "," + "\%rsi");
       else if ($b.reg_num == 6)
            TextCode.add("\t movq " + "\%r10" + "," + "\%rsi");
       else
            break;
         //TextCode.add("\t movq " + $b.str + "(\%rip), \%rsi"); 
	}
	)* 
	')' 
	';'
    ;

	
arith_expression returns [int attr_type, int reg_num, String str, int p, String label]
	: a = multExpr
	{
	         $attr_type = $a.attr_type;
	         $reg_num = $a.reg_num;
	         $str = $a.str;
			 $p = $a.p;
			 $label = $a.label;
			 
	}
    ( '+' b = multExpr
	{ 
	        if ($a.attr_type != $b.attr_type) {
			     System.out.println("Type Error: " + $a.start.getLine() + ": Type mismatch for the operator + in an expression.");
		         $attr_type = -2;
		    }
			else {
				if($a.attr_type == -2 && $b.attr_type == -2) {
					System.err.println("Type Error: " + $a.start.getLine() +": Type mismatch for the operator + in an expression.");
					$attr_type = -2;
				}
			}
		
		  /* code generation */
		    if ($b.reg_num == 0){
				if ($reg_num == 0)
					TextCode.add("\t addq " + "\%rax" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t addq " + "\%rax" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t addq " + "\%rax" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t addq " + "\%rax" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t addq " + "\%rax" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t addq " + "\%rax" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t addq " + "\%rax" + ", \%r10");
				else 
					break;
			}
			else if ($b.reg_num == 1){
				if ($reg_num == 0)
					TextCode.add("\t addq " + "\%rbx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t addq " + "\%rbx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t addq " + "\%rbx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t addq " + "\%rbx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t addq " + "\%rbx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t addq " + "\%rbx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t addq " + "\%rbx" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 2){
				if ($reg_num == 0)
					TextCode.add("\t addq " + "\%rcx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t addq " + "\%rcx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t addq " + "\%rcx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t addq " + "\%rcx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t addq " + "\%rcx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t addq " + "\%rcx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t addq " + "\%rcx" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 3){
				if ($reg_num == 0)
					TextCode.add("\t addq " + "\%rdx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t addq " + "\%rdx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t addq " + "\%rdx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t addq " + "\%rdx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t addq " + "\%rdx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t addq " + "\%rdx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t addq " + "\%rdx" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 4){
				if ($reg_num == 0)
					TextCode.add("\t addq " + "\%r8" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t addq " + "\%r8" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t addq " + "\%r8" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t addq " + "\%r8" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t addq " + "\%r8" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t addq " + "\%r8" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t addq " + "\%r8" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 5){
				if ($reg_num == 0)
					TextCode.add("\t addq " + "\%r9" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t addq " + "\%r9" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t addq " + "\%r9" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t addq " + "\%r9" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t addq " + "\%r9" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t addq " + "\%r9" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t addq " + "\%r9" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 6){
				if ($reg_num == 0)
					TextCode.add("\t addq " + "\%r10" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t addq " + "\%r10" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t addq " + "\%r10" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t addq " + "\%r10" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t addq " + "\%r10" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t addq " + "\%r10" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t addq " + "\%r10" + ", \%r10");
				else
					break;
			}
			else 
				break;
          //TextCode.add("\t addq " + "\%" + $b.reg_num + ", \%" + $reg_num);
    }
	  | '-' c = multExpr
	  {
	    if ($a.attr_type != $c.attr_type){
                System.err.println("Type Error: " + $a.start.getLine() + ": Type mismatch for the operator - in an expression.");
                $attr_type = -2;
        }
        else{
                if($a.attr_type == -2 && $c.attr_type == -2){
                        System.err.println("Type Error: " + $a.start.getLine() +": Type mismatch for the operator - in an expression.");
                        $attr_type = -2;
                }
        }
		/* code generation */
		if ($c.reg_num == 0){
				if ($reg_num == 0)
					TextCode.add("\t subq " + "\%rax" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t subq " + "\%rax" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t subq " + "\%rax" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t subq " + "\%rax" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t subq " + "\%rax" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t subq " + "\%rax" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t subq " + "\%rax" + ", \%r10");
				else 
					break;
			}
		else if ($c.reg_num == 1){
				if ($reg_num == 0)
					TextCode.add("\t subq " + "\%rbx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t subq " + "\%rbx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t subq " + "\%rbx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t subq " + "\%rbx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t subq " + "\%rbx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t subq " + "\%rbx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t subq " + "\%rbx" + ", \%r10");
				else
					break;
			}
		else if ($c.reg_num == 2){
				if ($reg_num == 0)
					TextCode.add("\t subq " + "\%rcx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t subq " + "\%rcx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t subq " + "\%rcx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t subq " + "\%rcx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t subq " + "\%rcx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t subq " + "\%rcx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t subq " + "\%rcx" + ", \%r10");
				else
					break;
			}
		else if ($c.reg_num == 3){
				if ($reg_num == 0)
					TextCode.add("\t subq " + "\%rdx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t subq " + "\%rdx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t subq " + "\%rdx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t subq " + "\%rdx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t subq " + "\%rdx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t subq " + "\%rdx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t subq " + "\%rdx" + ", \%r10");
				else
					break;
			}
		else if ($c.reg_num == 4){
				if ($reg_num == 0)
					TextCode.add("\t subq " + "\%r8" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t subq " + "\%r8" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t subq " + "\%r8" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t subq " + "\%r8" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t subq " + "\%r8" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t subq " + "\%r8" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t subq " + "\%r8" + ", \%r10");
				else
					break;
			}
		else if ($c.reg_num == 5){
				if ($reg_num == 0)
					TextCode.add("\t subq " + "\%r9" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t subq " + "\%r9" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t subq " + "\%r9" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t subq " + "\%r9" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t subq " + "\%r9" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t subq " + "\%r9" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t subq " + "\%r9" + ", \%r10");
				else
					break;
			}
		else if ($c.reg_num == 6){
				if ($reg_num == 0)
					TextCode.add("\t subq " + "\%r10" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t subq " + "\%r10" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t subq " + "\%r10" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t subq " + "\%r10" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t subq " + "\%r10" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t subq " + "\%r10" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t subq " + "\%r10" + ", \%r10");
				else
					break;
			}
		else 
				break;
	  }
	  )*
	;

	
multExpr returns [int attr_type, int reg_num, String str, int p, String label]
	: a = condExpr 
	  { 
	     $attr_type = $a.attr_type;
	     $reg_num = $a.reg_num;
	     $str = $a.str;
		 $p = $a.p;
		 $label = $a.label;
	  }
      ( '*' b = condExpr
	  {
			if($a.attr_type != $b.attr_type){
                System.err.println("Type Error: " + $a.start.getLine() +": Type mismatch for the operator * in an expression.");
                $attr_type = -2;
			}
			else{
					if($a.attr_type == -2 && $b.attr_type == -2){
                        System.err.println("Type Error: " + $a.start.getLine() +": Type mismatch for the operator * in an expression.");
                        $attr_type = -2;
                }
			}
			if ($b.reg_num == 0){
				if ($reg_num == 0)
					TextCode.add("\t imulq " + "\%rax" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t imulq " + "\%rax" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t imulq " + "\%rax" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t imulq " + "\%rax" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t imulq " + "\%rax" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t imulq " + "\%rax" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t imulq " + "\%rax" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 1){
				if ($reg_num == 0)
					TextCode.add("\t imulq " + "\%rbx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t imulq " + "\%rbx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t imulq " + "\%rbx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t imulq " + "\%rbx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t imulq " + "\%rbx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t imulq " + "\%rbx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t imulq " + "\%rbx" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 2){
				if ($reg_num == 0)
					TextCode.add("\t imulq " + "\%rcx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t imulq " + "\%rcx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t imulq " + "\%rcx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t imulq " + "\%rcx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t imulq " + "\%rcx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t imulq " + "\%rcx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t imulq " + "\%rcx" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 3){
				if ($reg_num == 0)
					TextCode.add("\t imulq " + "\%rdx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t imulq " + "\%rdx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t imulq " + "\%rdx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t imulq " + "\%rdx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t imulq " + "\%rdx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t imulq " + "\%rdx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t imulq " + "\%rdx" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 4){
					if ($reg_num == 0)
					TextCode.add("\t imulq " + "\%r8" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t imulq " + "\%r8" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t imulq " + "\%r8" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t imulq " + "\%r8" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t imulq " + "\%r8" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t imulq " + "\%r8" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t imulq " + "\%r8" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 5){
				if ($reg_num == 0)
					TextCode.add("\t imulq " + "\%r9" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t imulq " + "\%r9" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t imulq " + "\%r9" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t imulq " + "\%r9" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t imulq " + "\%r9" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t imulq " + "\%r9" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t imulq " + "\%r9" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 6){
				if ($reg_num == 0)
					TextCode.add("\t imulq " + "\%r10" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t imulq " + "\%r10" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t imulq " + "\%r10" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t imulq " + "\%r10" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t imulq " + "\%r10" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t imulq " + "\%r10" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t imulq " + "\%r10" + ", \%r10");
				else
					break;
			}
			else
				break;
	  }
      | '/' c = condExpr
	 
	  )*
	;


condExpr returns [int attr_type, int reg_num, String str, int p, String label]
	: a = primaryExpr
	  { 
	     $attr_type = $a.attr_type;
	     $reg_num = $a.reg_num;
	     $str = $a.str; 
		 $p = $a.p;
		 $label = $a.label;
	  }
	( '<=' b = primaryExpr
	{
			//System.out.println(" cmpq1 =" + $b.str + "cmpq2 =" +$str);
			if ($b.reg_num == 0){
				if ($reg_num == 0)
					TextCode.add("\t cmpq " + "\%rax" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t cmpq " + "\%rax" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t cmpq " + "\%rax" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t cmpq " + "\%rax" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t cmpq " + "\%rax" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t cmpq " + "\%rax" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t cmpq " + "\%rax" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 1){
				if ($reg_num == 0)
					TextCode.add("\t cmpq " + "\%rbx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t cmpq " + "\%rbx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t cmpq " + "\%rbx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t cmpq " + "\%rbx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t cmpq " + "\%rbx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t cmpq " + "\%rbx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t cmpq " + "\%rbx" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 2){
				if ($reg_num == 0)
					TextCode.add("\t cmpq " + "\%rcx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t cmpq " + "\%rcx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t cmpq " + "\%rcx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t cmpq " + "\%rcx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t cmpq " + "\%rcx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t cmpq " + "\%rcx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t cmpq " + "\%rcx" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 3){
				if ($reg_num == 0)
					TextCode.add("\t cmpq " + "\%rdx" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t cmpq " + "\%rdx" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t cmpq " + "\%rdx" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t cmpq " + "\%rdx" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t cmpq " + "\%rdx" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t cmpq " + "\%rdx" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t cmpq " + "\%rdx" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 4){
					if ($reg_num == 0)
					TextCode.add("\t cmpq " + "\%r8" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t cmpq " + "\%r8" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t cmpq " + "\%r8" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t cmpq " + "\%r8" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t cmpq " + "\%r8" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t cmpq " + "\%r8" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t cmpq " + "\%r8" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 5){
				if ($reg_num == 0)
					TextCode.add("\t cmpq " + "\%r9" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t cmpq " + "\%r9" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t cmpq " + "\%r9" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t cmpq " + "\%r9" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t cmpq " + "\%r9" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t cmpq " + "\%r9" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t cmpq " + "\%r9" + ", \%r10");
				else
					break;
			}
			else if ($b.reg_num == 6){
				if ($reg_num == 0)
					TextCode.add("\t cmpq " + "\%r10" + ", \%rax");
				else if ($reg_num == 1)
					TextCode.add("\t cmpq " + "\%r10" + ", \%rbx");
				else if ($reg_num == 2)
					TextCode.add("\t cmpq " + "\%r10" + ", \%rcx");
				else if ($reg_num == 3)
					TextCode.add("\t cmpq " + "\%r10" + ", \%rdx");
				else if ($reg_num == 4)
					TextCode.add("\t cmpq " + "\%r10" + ", \%r8");
				else if ($reg_num == 5)
					TextCode.add("\t cmpq " + "\%r10" + ", \%r9");
				else if ($reg_num == 6)
					TextCode.add("\t cmpq " + "\%r10" + ", \%r10");
				else
					break;
			}
			else
				break;
			
	  
	}
	)*
  ;


primaryExpr returns [int attr_type, int reg_num, String str,int p,String label]
    : Integer_constant
      { 
         $attr_type = 1;
         $str = $Integer_constant.text;
         
         $p = 1;
		 
		
	
         /* code generation */
         //$reg_num = reg.get();  /* get an register */
		
         //TextCode.add("\t movq " + "\$" + $Integer_constant.text + ", \%" + $reg_num); 
		 
      }
    | Floating_point_constant  
	{ $attr_type = 2; 
        $str = $Floating_point_constant.text;
         
        $p = 1;
		 
	}
    | STRING_LITERAL { $attr_type = 3; $str = $STRING_LITERAL.text; }
    | Identifier
    {
		if(symtab.containsKey($Identifier.text)){
                $attr_type = symtab.get($Identifier.text);
        }
        else{
                System.err.println("Type Error: " + $Identifier.getLine() + ": Undeclared identifier.");
                $attr_type = -2;
        }
         $attr_type = symtab.get($Identifier.text);
         $str = $Identifier.text;
         
         /* code generation */
         $reg_num = reg.get(); /* get an register */
	    if ($reg_num == 0)
			TextCode.add("\t movq " + $Identifier.text + "(\%rip), \%rax");
		else if ($reg_num == 1)
			TextCode.add("\t movq " + $Identifier.text + "(\%rip), \%rbx");
		else if ($reg_num == 2)
			TextCode.add("\t movq " + $Identifier.text + "(\%rip), \%rcx");
		else if ($reg_num == 3)
			TextCode.add("\t movq " + $Identifier.text + "(\%rip), \%rdx");
		else if ($reg_num == 4)
			TextCode.add("\t movq " + $Identifier.text + "(\%rip), \%r8");
		else if ($reg_num == 5)
			TextCode.add("\t movq " + $Identifier.text + "(\%rip), \%r9");
		else if ($reg_num == 6)
			TextCode.add("\t movq " + $Identifier.text + "(\%rip), \%r10");
		else
			break;
         //TextCode.add("\t movq " + $Identifier.text + "(\%rip), \%" + $reg_num);
     }
	 | '(' arith_expression ')' { $attr_type = $arith_expression.attr_type; }
    ;

whileStatement returns [String label]
  :  WHILE 
     { 
		$label = newLabel();
		
		TextCode.add("\t jmp " + "." + $label);
		TextCode.add("." + $label + ":");
	
	 }
	 '(' arith_expression ')' 
				 
  ;  
  
while_statement returns [String label]
  :
  {		
		$label = newLabel();
		L_opt = labelCount+1;
		TextCode.add("\t jg " + ".L" + L_opt);
		TextCode.add("." + $label + ":");
  }  
  statement 
  {
		$label = newLabel();
		System.out.println("\t1" + L_opt);
		TextCode.add("." + $label + ":");
  }  
  ;
  
ifStatement returns [String label]
  : IF
  '(' arith_expression ')'

  ;
  
if_then_statements returns [String label]
   :
	{
		 
		$label = newLabel();
		TextCode.add("\t jg " + "." + $label);
		//TextCode.add("." + $label + ":");
  
	}
	statement
	| '{' statements '}'
	;

	
/* description of the tokens */
FLOAT:'float';
INT:'int';
VOID: 'void';
CHAR: 'char';
IF: 'if';
WHILE: 'while';

Identifier:('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*;
Integer_constant:'0'..'9'+;
Floating_point_constant:'0'..'9'+ '.' '0'..'9'+;

STRING_LITERAL
    :  '"' ( EscapeSequence | ~('\\'|'"') )* '"'
    ;

fragment
EscapeSequence
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    ;


WS:( ' ' | '\t' | '\r' | '\n' ) {$channel=HIDDEN;};
COMMENT:'/*' .* '*/' {$channel=HIDDEN;};