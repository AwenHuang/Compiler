// $ANTLR 3.5.1 mylexer.g 2014-06-21 22:52:41

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class mylexer extends Lexer {
	public static final int EOF=-1;
	public static final int Add=4;
	public static final int And=5;
	public static final int Assign=6;
	public static final int Char=7;
	public static final int Colon=8;
	public static final int Comma=9;
	public static final int Comment1=10;
	public static final int Comment2=11;
	public static final int Digit=12;
	public static final int Div=13;
	public static final int Double=14;
	public static final int EQ=15;
	public static final int Else=16;
	public static final int Float=17;
	public static final int FloatNumber=18;
	public static final int FloatNumber1=19;
	public static final int FloatNumber2=20;
	public static final int FloatNumber3=21;
	public static final int For=22;
	public static final int GT=23;
	public static final int GTE=24;
	public static final int Identifier=25;
	public static final int If=26;
	public static final int Int=27;
	public static final int LBrace=28;
	public static final int LBracket=29;
	public static final int LParen=30;
	public static final int LT=31;
	public static final int LTE=32;
	public static final int Letter=33;
	public static final int Mod=34;
	public static final int Mul=35;
	public static final int NE=36;
	public static final int Newline=37;
	public static final int Number=38;
	public static final int Or=39;
	public static final int Print=40;
	public static final int RBrace=41;
	public static final int RBracket=42;
	public static final int RParen=43;
	public static final int Return=44;
	public static final int SColon=45;
	public static final int String=46;
	public static final int Sub=47;
	public static final int Void=48;
	public static final int While=49;
	public static final int WhiteSpace=50;

	// delegates
	// delegators
	public Lexer[] getDelegates() {
		return new Lexer[] {};
	}

	public mylexer() {} 
	public mylexer(CharStream input) {
		this(input, new RecognizerSharedState());
	}
	public mylexer(CharStream input, RecognizerSharedState state) {
		super(input,state);
	}
	@Override public String getGrammarFileName() { return "mylexer.g"; }

	// $ANTLR start "Int"
	public final void mInt() throws RecognitionException {
		try {
			int _type = Int;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:8:5: ( 'int' )
			// mylexer.g:8:7: 'int'
			{
			match("int"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Int"

	// $ANTLR start "Char"
	public final void mChar() throws RecognitionException {
		try {
			int _type = Char;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:9:6: ( 'char' )
			// mylexer.g:9:8: 'char'
			{
			match("char"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Char"

	// $ANTLR start "Void"
	public final void mVoid() throws RecognitionException {
		try {
			int _type = Void;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:10:6: ( 'void' )
			// mylexer.g:10:8: 'void'
			{
			match("void"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Void"

	// $ANTLR start "Float"
	public final void mFloat() throws RecognitionException {
		try {
			int _type = Float;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:11:7: ( 'float' )
			// mylexer.g:11:9: 'float'
			{
			match("float"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Float"

	// $ANTLR start "Double"
	public final void mDouble() throws RecognitionException {
		try {
			int _type = Double;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:12:8: ( 'double' )
			// mylexer.g:12:10: 'double'
			{
			match("double"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Double"

	// $ANTLR start "Print"
	public final void mPrint() throws RecognitionException {
		try {
			int _type = Print;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:14:7: ( 'printf' )
			// mylexer.g:14:9: 'printf'
			{
			match("printf"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Print"

	// $ANTLR start "If"
	public final void mIf() throws RecognitionException {
		try {
			int _type = If;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:15:4: ( 'if' )
			// mylexer.g:15:6: 'if'
			{
			match("if"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "If"

	// $ANTLR start "Else"
	public final void mElse() throws RecognitionException {
		try {
			int _type = Else;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:16:6: ( 'else' )
			// mylexer.g:16:8: 'else'
			{
			match("else"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Else"

	// $ANTLR start "While"
	public final void mWhile() throws RecognitionException {
		try {
			int _type = While;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:17:7: ( 'while' )
			// mylexer.g:17:9: 'while'
			{
			match("while"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "While"

	// $ANTLR start "For"
	public final void mFor() throws RecognitionException {
		try {
			int _type = For;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:18:5: ( 'for' )
			// mylexer.g:18:7: 'for'
			{
			match("for"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "For"

	// $ANTLR start "Return"
	public final void mReturn() throws RecognitionException {
		try {
			int _type = Return;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:19:8: ( 'return' )
			// mylexer.g:19:10: 'return'
			{
			match("return"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Return"

	// $ANTLR start "Or"
	public final void mOr() throws RecognitionException {
		try {
			int _type = Or;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:21:4: ( '||' )
			// mylexer.g:21:6: '||'
			{
			match("||"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Or"

	// $ANTLR start "And"
	public final void mAnd() throws RecognitionException {
		try {
			int _type = And;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:22:5: ( '&&' )
			// mylexer.g:22:7: '&&'
			{
			match("&&"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "And"

	// $ANTLR start "EQ"
	public final void mEQ() throws RecognitionException {
		try {
			int _type = EQ;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:23:4: ( '==' )
			// mylexer.g:23:6: '=='
			{
			match("=="); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "EQ"

	// $ANTLR start "NE"
	public final void mNE() throws RecognitionException {
		try {
			int _type = NE;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:24:4: ( '!=' )
			// mylexer.g:24:6: '!='
			{
			match("!="); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "NE"

	// $ANTLR start "GTE"
	public final void mGTE() throws RecognitionException {
		try {
			int _type = GTE;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:25:5: ( '>=' )
			// mylexer.g:25:7: '>='
			{
			match(">="); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "GTE"

	// $ANTLR start "LTE"
	public final void mLTE() throws RecognitionException {
		try {
			int _type = LTE;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:26:5: ( '<=' )
			// mylexer.g:26:7: '<='
			{
			match("<="); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "LTE"

	// $ANTLR start "GT"
	public final void mGT() throws RecognitionException {
		try {
			int _type = GT;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:27:4: ( '>' )
			// mylexer.g:27:6: '>'
			{
			match('>'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "GT"

	// $ANTLR start "LT"
	public final void mLT() throws RecognitionException {
		try {
			int _type = LT;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:28:4: ( '<' )
			// mylexer.g:28:6: '<'
			{
			match('<'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "LT"

	// $ANTLR start "Add"
	public final void mAdd() throws RecognitionException {
		try {
			int _type = Add;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:29:5: ( '+' )
			// mylexer.g:29:7: '+'
			{
			match('+'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Add"

	// $ANTLR start "Sub"
	public final void mSub() throws RecognitionException {
		try {
			int _type = Sub;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:30:5: ( '-' )
			// mylexer.g:30:7: '-'
			{
			match('-'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Sub"

	// $ANTLR start "Mul"
	public final void mMul() throws RecognitionException {
		try {
			int _type = Mul;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:31:5: ( '*' )
			// mylexer.g:31:7: '*'
			{
			match('*'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Mul"

	// $ANTLR start "Div"
	public final void mDiv() throws RecognitionException {
		try {
			int _type = Div;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:32:5: ( '/' )
			// mylexer.g:32:7: '/'
			{
			match('/'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Div"

	// $ANTLR start "Mod"
	public final void mMod() throws RecognitionException {
		try {
			int _type = Mod;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:33:5: ( '%' )
			// mylexer.g:33:7: '%'
			{
			match('%'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Mod"

	// $ANTLR start "LBrace"
	public final void mLBrace() throws RecognitionException {
		try {
			int _type = LBrace;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:34:10: ( '{' )
			// mylexer.g:34:12: '{'
			{
			match('{'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "LBrace"

	// $ANTLR start "RBrace"
	public final void mRBrace() throws RecognitionException {
		try {
			int _type = RBrace;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:35:10: ( '}' )
			// mylexer.g:35:12: '}'
			{
			match('}'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "RBrace"

	// $ANTLR start "LBracket"
	public final void mLBracket() throws RecognitionException {
		try {
			int _type = LBracket;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:36:10: ( '[' )
			// mylexer.g:36:12: '['
			{
			match('['); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "LBracket"

	// $ANTLR start "RBracket"
	public final void mRBracket() throws RecognitionException {
		try {
			int _type = RBracket;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:37:10: ( ']' )
			// mylexer.g:37:12: ']'
			{
			match(']'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "RBracket"

	// $ANTLR start "LParen"
	public final void mLParen() throws RecognitionException {
		try {
			int _type = LParen;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:38:10: ( '(' )
			// mylexer.g:38:12: '('
			{
			match('('); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "LParen"

	// $ANTLR start "RParen"
	public final void mRParen() throws RecognitionException {
		try {
			int _type = RParen;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:39:10: ( ')' )
			// mylexer.g:39:12: ')'
			{
			match(')'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "RParen"

	// $ANTLR start "SColon"
	public final void mSColon() throws RecognitionException {
		try {
			int _type = SColon;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:40:10: ( ';' )
			// mylexer.g:40:12: ';'
			{
			match(';'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "SColon"

	// $ANTLR start "Assign"
	public final void mAssign() throws RecognitionException {
		try {
			int _type = Assign;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:41:10: ( '=' )
			// mylexer.g:41:12: '='
			{
			match('='); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Assign"

	// $ANTLR start "Comma"
	public final void mComma() throws RecognitionException {
		try {
			int _type = Comma;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:42:10: ( ',' )
			// mylexer.g:42:12: ','
			{
			match(','); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Comma"

	// $ANTLR start "Colon"
	public final void mColon() throws RecognitionException {
		try {
			int _type = Colon;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:43:10: ( ':' )
			// mylexer.g:43:12: ':'
			{
			match(':'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Colon"

	// $ANTLR start "Identifier"
	public final void mIdentifier() throws RecognitionException {
		try {
			int _type = Identifier;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:46:2: ( ( Letter ) ( Letter | Digit )* )
			// mylexer.g:46:4: ( Letter ) ( Letter | Digit )*
			{
			if ( (input.LA(1) >= 'A' && input.LA(1) <= 'Z')||input.LA(1)=='_'||(input.LA(1) >= 'a' && input.LA(1) <= 'z') ) {
				input.consume();
			}
			else {
				MismatchedSetException mse = new MismatchedSetException(null,input);
				recover(mse);
				throw mse;
			}
			// mylexer.g:46:12: ( Letter | Digit )*
			loop1:
			while (true) {
				int alt1=2;
				int LA1_0 = input.LA(1);
				if ( ((LA1_0 >= '0' && LA1_0 <= '9')||(LA1_0 >= 'A' && LA1_0 <= 'Z')||LA1_0=='_'||(LA1_0 >= 'a' && LA1_0 <= 'z')) ) {
					alt1=1;
				}

				switch (alt1) {
				case 1 :
					// mylexer.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9')||(input.LA(1) >= 'A' && input.LA(1) <= 'Z')||input.LA(1)=='_'||(input.LA(1) >= 'a' && input.LA(1) <= 'z') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					break loop1;
				}
			}

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Identifier"

	// $ANTLR start "String"
	public final void mString() throws RecognitionException {
		try {
			int _type = String;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:52:3: ( '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"' | '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\'' )
			int alt4=2;
			int LA4_0 = input.LA(1);
			if ( (LA4_0=='\"') ) {
				alt4=1;
			}
			else if ( (LA4_0=='\'') ) {
				alt4=2;
			}

			else {
				NoViableAltException nvae =
					new NoViableAltException("", 4, 0, input);
				throw nvae;
			}

			switch (alt4) {
				case 1 :
					// mylexer.g:52:6: '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"'
					{
					match('\"'); 
					// mylexer.g:52:11: (~ ( '\"' | '\\\\' ) | '\\\\' . )*
					loop2:
					while (true) {
						int alt2=3;
						int LA2_0 = input.LA(1);
						if ( ((LA2_0 >= '\u0000' && LA2_0 <= '!')||(LA2_0 >= '#' && LA2_0 <= '[')||(LA2_0 >= ']' && LA2_0 <= '\uFFFF')) ) {
							alt2=1;
						}
						else if ( (LA2_0=='\\') ) {
							alt2=2;
						}

						switch (alt2) {
						case 1 :
							// mylexer.g:52:12: ~ ( '\"' | '\\\\' )
							{
							if ( (input.LA(1) >= '\u0000' && input.LA(1) <= '!')||(input.LA(1) >= '#' && input.LA(1) <= '[')||(input.LA(1) >= ']' && input.LA(1) <= '\uFFFF') ) {
								input.consume();
							}
							else {
								MismatchedSetException mse = new MismatchedSetException(null,input);
								recover(mse);
								throw mse;
							}
							}
							break;
						case 2 :
							// mylexer.g:52:29: '\\\\' .
							{
							match('\\'); 
							matchAny(); 
							}
							break;

						default :
							break loop2;
						}
					}

					match('\"'); 
					}
					break;
				case 2 :
					// mylexer.g:53:6: '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\''
					{
					match('\''); 
					// mylexer.g:53:11: (~ ( '\\'' | '\\\\' ) | '\\\\' . )*
					loop3:
					while (true) {
						int alt3=3;
						int LA3_0 = input.LA(1);
						if ( ((LA3_0 >= '\u0000' && LA3_0 <= '&')||(LA3_0 >= '(' && LA3_0 <= '[')||(LA3_0 >= ']' && LA3_0 <= '\uFFFF')) ) {
							alt3=1;
						}
						else if ( (LA3_0=='\\') ) {
							alt3=2;
						}

						switch (alt3) {
						case 1 :
							// mylexer.g:53:12: ~ ( '\\'' | '\\\\' )
							{
							if ( (input.LA(1) >= '\u0000' && input.LA(1) <= '&')||(input.LA(1) >= '(' && input.LA(1) <= '[')||(input.LA(1) >= ']' && input.LA(1) <= '\uFFFF') ) {
								input.consume();
							}
							else {
								MismatchedSetException mse = new MismatchedSetException(null,input);
								recover(mse);
								throw mse;
							}
							}
							break;
						case 2 :
							// mylexer.g:53:29: '\\\\' .
							{
							match('\\'); 
							matchAny(); 
							}
							break;

						default :
							break loop3;
						}
					}

					match('\''); 
					}
					break;

			}
			state.type = _type;
			state.channel = _channel;
			 
			  setText(getText().substring(1, getText().length()-1).replaceAll("\\\\(.)", "$1")); 

		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "String"

	// $ANTLR start "Number"
	public final void mNumber() throws RecognitionException {
		try {
			int _type = Number;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:56:8: ( ( '0' | ( '1' .. '9' ) ( Digit )* ) )
			// mylexer.g:56:10: ( '0' | ( '1' .. '9' ) ( Digit )* )
			{
			// mylexer.g:56:10: ( '0' | ( '1' .. '9' ) ( Digit )* )
			int alt6=2;
			int LA6_0 = input.LA(1);
			if ( (LA6_0=='0') ) {
				alt6=1;
			}
			else if ( ((LA6_0 >= '1' && LA6_0 <= '9')) ) {
				alt6=2;
			}

			else {
				NoViableAltException nvae =
					new NoViableAltException("", 6, 0, input);
				throw nvae;
			}

			switch (alt6) {
				case 1 :
					// mylexer.g:56:11: '0'
					{
					match('0'); 
					}
					break;
				case 2 :
					// mylexer.g:56:17: ( '1' .. '9' ) ( Digit )*
					{
					if ( (input.LA(1) >= '1' && input.LA(1) <= '9') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					// mylexer.g:56:27: ( Digit )*
					loop5:
					while (true) {
						int alt5=2;
						int LA5_0 = input.LA(1);
						if ( ((LA5_0 >= '0' && LA5_0 <= '9')) ) {
							alt5=1;
						}

						switch (alt5) {
						case 1 :
							// mylexer.g:
							{
							if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
								input.consume();
							}
							else {
								MismatchedSetException mse = new MismatchedSetException(null,input);
								recover(mse);
								throw mse;
							}
							}
							break;

						default :
							break loop5;
						}
					}

					}
					break;

			}

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Number"

	// $ANTLR start "FloatNumber"
	public final void mFloatNumber() throws RecognitionException {
		try {
			int _type = FloatNumber;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:59:2: ( FloatNumber1 | FloatNumber2 | FloatNumber3 )
			int alt7=3;
			alt7 = dfa7.predict(input);
			switch (alt7) {
				case 1 :
					// mylexer.g:59:4: FloatNumber1
					{
					mFloatNumber1(); 

					}
					break;
				case 2 :
					// mylexer.g:59:19: FloatNumber2
					{
					mFloatNumber2(); 

					}
					break;
				case 3 :
					// mylexer.g:59:34: FloatNumber3
					{
					mFloatNumber3(); 

					}
					break;

			}
			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "FloatNumber"

	// $ANTLR start "FloatNumber1"
	public final void mFloatNumber1() throws RecognitionException {
		try {
			// mylexer.g:62:2: ( ( Digit )+ '.' ( Digit )* )
			// mylexer.g:62:4: ( Digit )+ '.' ( Digit )*
			{
			// mylexer.g:62:4: ( Digit )+
			int cnt8=0;
			loop8:
			while (true) {
				int alt8=2;
				int LA8_0 = input.LA(1);
				if ( ((LA8_0 >= '0' && LA8_0 <= '9')) ) {
					alt8=1;
				}

				switch (alt8) {
				case 1 :
					// mylexer.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					if ( cnt8 >= 1 ) break loop8;
					EarlyExitException eee = new EarlyExitException(8, input);
					throw eee;
				}
				cnt8++;
			}

			match('.'); 
			// mylexer.g:62:15: ( Digit )*
			loop9:
			while (true) {
				int alt9=2;
				int LA9_0 = input.LA(1);
				if ( ((LA9_0 >= '0' && LA9_0 <= '9')) ) {
					alt9=1;
				}

				switch (alt9) {
				case 1 :
					// mylexer.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					break loop9;
				}
			}

			}

		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "FloatNumber1"

	// $ANTLR start "FloatNumber2"
	public final void mFloatNumber2() throws RecognitionException {
		try {
			// mylexer.g:64:2: ( '.' ( Digit )+ )
			// mylexer.g:64:4: '.' ( Digit )+
			{
			match('.'); 
			// mylexer.g:64:7: ( Digit )+
			int cnt10=0;
			loop10:
			while (true) {
				int alt10=2;
				int LA10_0 = input.LA(1);
				if ( ((LA10_0 >= '0' && LA10_0 <= '9')) ) {
					alt10=1;
				}

				switch (alt10) {
				case 1 :
					// mylexer.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					if ( cnt10 >= 1 ) break loop10;
					EarlyExitException eee = new EarlyExitException(10, input);
					throw eee;
				}
				cnt10++;
			}

			}

		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "FloatNumber2"

	// $ANTLR start "FloatNumber3"
	public final void mFloatNumber3() throws RecognitionException {
		try {
			// mylexer.g:66:2: ( ( Digit )+ )
			// mylexer.g:66:4: ( Digit )+
			{
			// mylexer.g:66:4: ( Digit )+
			int cnt11=0;
			loop11:
			while (true) {
				int alt11=2;
				int LA11_0 = input.LA(1);
				if ( ((LA11_0 >= '0' && LA11_0 <= '9')) ) {
					alt11=1;
				}

				switch (alt11) {
				case 1 :
					// mylexer.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					if ( cnt11 >= 1 ) break loop11;
					EarlyExitException eee = new EarlyExitException(11, input);
					throw eee;
				}
				cnt11++;
			}

			}

		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "FloatNumber3"

	// $ANTLR start "Comment1"
	public final void mComment1() throws RecognitionException {
		try {
			int _type = Comment1;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:68:9: ( '//' ( . )* '\\n' )
			// mylexer.g:68:11: '//' ( . )* '\\n'
			{
			match("//"); 

			// mylexer.g:68:15: ( . )*
			loop12:
			while (true) {
				int alt12=2;
				int LA12_0 = input.LA(1);
				if ( (LA12_0=='\n') ) {
					alt12=2;
				}
				else if ( ((LA12_0 >= '\u0000' && LA12_0 <= '\t')||(LA12_0 >= '\u000B' && LA12_0 <= '\uFFFF')) ) {
					alt12=1;
				}

				switch (alt12) {
				case 1 :
					// mylexer.g:68:16: .
					{
					matchAny(); 
					}
					break;

				default :
					break loop12;
				}
			}

			match('\n'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Comment1"

	// $ANTLR start "Comment2"
	public final void mComment2() throws RecognitionException {
		try {
			int _type = Comment2;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:69:9: ( '/*' ( options {greedy=false; } : . )* '*/' )
			// mylexer.g:69:11: '/*' ( options {greedy=false; } : . )* '*/'
			{
			match("/*"); 

			// mylexer.g:69:15: ( options {greedy=false; } : . )*
			loop13:
			while (true) {
				int alt13=2;
				int LA13_0 = input.LA(1);
				if ( (LA13_0=='*') ) {
					int LA13_1 = input.LA(2);
					if ( (LA13_1=='/') ) {
						alt13=2;
					}
					else if ( ((LA13_1 >= '\u0000' && LA13_1 <= '.')||(LA13_1 >= '0' && LA13_1 <= '\uFFFF')) ) {
						alt13=1;
					}

				}
				else if ( ((LA13_0 >= '\u0000' && LA13_0 <= ')')||(LA13_0 >= '+' && LA13_0 <= '\uFFFF')) ) {
					alt13=1;
				}

				switch (alt13) {
				case 1 :
					// mylexer.g:69:40: .
					{
					matchAny(); 
					}
					break;

				default :
					break loop13;
				}
			}

			match("*/"); 

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Comment2"

	// $ANTLR start "WhiteSpace"
	public final void mWhiteSpace() throws RecognitionException {
		try {
			int _type = WhiteSpace;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:72:2: ( ( ' ' | '\\r' | '\\t' )+ )
			// mylexer.g:72:4: ( ' ' | '\\r' | '\\t' )+
			{
			// mylexer.g:72:4: ( ' ' | '\\r' | '\\t' )+
			int cnt14=0;
			loop14:
			while (true) {
				int alt14=2;
				int LA14_0 = input.LA(1);
				if ( (LA14_0=='\t'||LA14_0=='\r'||LA14_0==' ') ) {
					alt14=1;
				}

				switch (alt14) {
				case 1 :
					// mylexer.g:
					{
					if ( input.LA(1)=='\t'||input.LA(1)=='\r'||input.LA(1)==' ' ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					if ( cnt14 >= 1 ) break loop14;
					EarlyExitException eee = new EarlyExitException(14, input);
					throw eee;
				}
				cnt14++;
			}

			skip();
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "WhiteSpace"

	// $ANTLR start "Newline"
	public final void mNewline() throws RecognitionException {
		try {
			int _type = Newline;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// mylexer.g:74:9: ( '\\n' )
			// mylexer.g:74:11: '\\n'
			{
			match('\n'); 
			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Newline"

	// $ANTLR start "Letter"
	public final void mLetter() throws RecognitionException {
		try {
			// mylexer.g:78:2: ( 'a' .. 'z' | 'A' .. 'Z' | '_' )
			// mylexer.g:
			{
			if ( (input.LA(1) >= 'A' && input.LA(1) <= 'Z')||input.LA(1)=='_'||(input.LA(1) >= 'a' && input.LA(1) <= 'z') ) {
				input.consume();
			}
			else {
				MismatchedSetException mse = new MismatchedSetException(null,input);
				recover(mse);
				throw mse;
			}
			}

		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Letter"

	// $ANTLR start "Digit"
	public final void mDigit() throws RecognitionException {
		try {
			// mylexer.g:81:2: ( '0' .. '9' )
			// mylexer.g:
			{
			if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
				input.consume();
			}
			else {
				MismatchedSetException mse = new MismatchedSetException(null,input);
				recover(mse);
				throw mse;
			}
			}

		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "Digit"

	@Override
	public void mTokens() throws RecognitionException {
		// mylexer.g:1:8: ( Int | Char | Void | Float | Double | Print | If | Else | While | For | Return | Or | And | EQ | NE | GTE | LTE | GT | LT | Add | Sub | Mul | Div | Mod | LBrace | RBrace | LBracket | RBracket | LParen | RParen | SColon | Assign | Comma | Colon | Identifier | String | Number | FloatNumber | Comment1 | Comment2 | WhiteSpace | Newline )
		int alt15=42;
		alt15 = dfa15.predict(input);
		switch (alt15) {
			case 1 :
				// mylexer.g:1:10: Int
				{
				mInt(); 

				}
				break;
			case 2 :
				// mylexer.g:1:14: Char
				{
				mChar(); 

				}
				break;
			case 3 :
				// mylexer.g:1:19: Void
				{
				mVoid(); 

				}
				break;
			case 4 :
				// mylexer.g:1:24: Float
				{
				mFloat(); 

				}
				break;
			case 5 :
				// mylexer.g:1:30: Double
				{
				mDouble(); 

				}
				break;
			case 6 :
				// mylexer.g:1:37: Print
				{
				mPrint(); 

				}
				break;
			case 7 :
				// mylexer.g:1:43: If
				{
				mIf(); 

				}
				break;
			case 8 :
				// mylexer.g:1:46: Else
				{
				mElse(); 

				}
				break;
			case 9 :
				// mylexer.g:1:51: While
				{
				mWhile(); 

				}
				break;
			case 10 :
				// mylexer.g:1:57: For
				{
				mFor(); 

				}
				break;
			case 11 :
				// mylexer.g:1:61: Return
				{
				mReturn(); 

				}
				break;
			case 12 :
				// mylexer.g:1:68: Or
				{
				mOr(); 

				}
				break;
			case 13 :
				// mylexer.g:1:71: And
				{
				mAnd(); 

				}
				break;
			case 14 :
				// mylexer.g:1:75: EQ
				{
				mEQ(); 

				}
				break;
			case 15 :
				// mylexer.g:1:78: NE
				{
				mNE(); 

				}
				break;
			case 16 :
				// mylexer.g:1:81: GTE
				{
				mGTE(); 

				}
				break;
			case 17 :
				// mylexer.g:1:85: LTE
				{
				mLTE(); 

				}
				break;
			case 18 :
				// mylexer.g:1:89: GT
				{
				mGT(); 

				}
				break;
			case 19 :
				// mylexer.g:1:92: LT
				{
				mLT(); 

				}
				break;
			case 20 :
				// mylexer.g:1:95: Add
				{
				mAdd(); 

				}
				break;
			case 21 :
				// mylexer.g:1:99: Sub
				{
				mSub(); 

				}
				break;
			case 22 :
				// mylexer.g:1:103: Mul
				{
				mMul(); 

				}
				break;
			case 23 :
				// mylexer.g:1:107: Div
				{
				mDiv(); 

				}
				break;
			case 24 :
				// mylexer.g:1:111: Mod
				{
				mMod(); 

				}
				break;
			case 25 :
				// mylexer.g:1:115: LBrace
				{
				mLBrace(); 

				}
				break;
			case 26 :
				// mylexer.g:1:122: RBrace
				{
				mRBrace(); 

				}
				break;
			case 27 :
				// mylexer.g:1:129: LBracket
				{
				mLBracket(); 

				}
				break;
			case 28 :
				// mylexer.g:1:138: RBracket
				{
				mRBracket(); 

				}
				break;
			case 29 :
				// mylexer.g:1:147: LParen
				{
				mLParen(); 

				}
				break;
			case 30 :
				// mylexer.g:1:154: RParen
				{
				mRParen(); 

				}
				break;
			case 31 :
				// mylexer.g:1:161: SColon
				{
				mSColon(); 

				}
				break;
			case 32 :
				// mylexer.g:1:168: Assign
				{
				mAssign(); 

				}
				break;
			case 33 :
				// mylexer.g:1:175: Comma
				{
				mComma(); 

				}
				break;
			case 34 :
				// mylexer.g:1:181: Colon
				{
				mColon(); 

				}
				break;
			case 35 :
				// mylexer.g:1:187: Identifier
				{
				mIdentifier(); 

				}
				break;
			case 36 :
				// mylexer.g:1:198: String
				{
				mString(); 

				}
				break;
			case 37 :
				// mylexer.g:1:205: Number
				{
				mNumber(); 

				}
				break;
			case 38 :
				// mylexer.g:1:212: FloatNumber
				{
				mFloatNumber(); 

				}
				break;
			case 39 :
				// mylexer.g:1:224: Comment1
				{
				mComment1(); 

				}
				break;
			case 40 :
				// mylexer.g:1:233: Comment2
				{
				mComment2(); 

				}
				break;
			case 41 :
				// mylexer.g:1:242: WhiteSpace
				{
				mWhiteSpace(); 

				}
				break;
			case 42 :
				// mylexer.g:1:253: Newline
				{
				mNewline(); 

				}
				break;

		}
	}


	protected DFA7 dfa7 = new DFA7(this);
	protected DFA15 dfa15 = new DFA15(this);
	static final String DFA7_eotS =
		"\1\uffff\1\4\3\uffff";
	static final String DFA7_eofS =
		"\5\uffff";
	static final String DFA7_minS =
		"\2\56\3\uffff";
	static final String DFA7_maxS =
		"\2\71\3\uffff";
	static final String DFA7_acceptS =
		"\2\uffff\1\2\1\1\1\3";
	static final String DFA7_specialS =
		"\5\uffff}>";
	static final String[] DFA7_transitionS = {
			"\1\2\1\uffff\12\1",
			"\1\3\1\uffff\12\1",
			"",
			"",
			""
	};

	static final short[] DFA7_eot = DFA.unpackEncodedString(DFA7_eotS);
	static final short[] DFA7_eof = DFA.unpackEncodedString(DFA7_eofS);
	static final char[] DFA7_min = DFA.unpackEncodedStringToUnsignedChars(DFA7_minS);
	static final char[] DFA7_max = DFA.unpackEncodedStringToUnsignedChars(DFA7_maxS);
	static final short[] DFA7_accept = DFA.unpackEncodedString(DFA7_acceptS);
	static final short[] DFA7_special = DFA.unpackEncodedString(DFA7_specialS);
	static final short[][] DFA7_transition;

	static {
		int numStates = DFA7_transitionS.length;
		DFA7_transition = new short[numStates][];
		for (int i=0; i<numStates; i++) {
			DFA7_transition[i] = DFA.unpackEncodedString(DFA7_transitionS[i]);
		}
	}

	protected class DFA7 extends DFA {

		public DFA7(BaseRecognizer recognizer) {
			this.recognizer = recognizer;
			this.decisionNumber = 7;
			this.eot = DFA7_eot;
			this.eof = DFA7_eof;
			this.min = DFA7_min;
			this.max = DFA7_max;
			this.accept = DFA7_accept;
			this.special = DFA7_special;
			this.transition = DFA7_transition;
		}
		@Override
		public String getDescription() {
			return "58:1: FloatNumber : ( FloatNumber1 | FloatNumber2 | FloatNumber3 );";
		}
	}

	static final String DFA15_eotS =
		"\1\uffff\11\36\2\uffff\1\61\1\uffff\1\63\1\65\3\uffff\1\70\14\uffff\2"+
		"\71\3\uffff\1\36\1\74\11\36\12\uffff\1\71\1\106\1\uffff\3\36\1\112\5\36"+
		"\1\uffff\1\120\1\121\1\36\1\uffff\2\36\1\125\2\36\2\uffff\1\130\2\36\1"+
		"\uffff\1\133\1\36\1\uffff\1\135\1\136\1\uffff\1\137\3\uffff";
	static final String DFA15_eofS =
		"\140\uffff";
	static final String DFA15_minS =
		"\1\11\1\146\1\150\1\157\1\154\1\157\1\162\1\154\1\150\1\145\2\uffff\1"+
		"\75\1\uffff\2\75\3\uffff\1\52\14\uffff\2\56\3\uffff\1\164\1\60\1\141\1"+
		"\151\1\157\1\162\1\165\1\151\1\163\1\151\1\164\12\uffff\1\56\1\60\1\uffff"+
		"\1\162\1\144\1\141\1\60\1\142\1\156\1\145\1\154\1\165\1\uffff\2\60\1\164"+
		"\1\uffff\1\154\1\164\1\60\1\145\1\162\2\uffff\1\60\1\145\1\146\1\uffff"+
		"\1\60\1\156\1\uffff\2\60\1\uffff\1\60\3\uffff";
	static final String DFA15_maxS =
		"\1\175\1\156\1\150\3\157\1\162\1\154\1\150\1\145\2\uffff\1\75\1\uffff"+
		"\2\75\3\uffff\1\57\14\uffff\2\71\3\uffff\1\164\1\172\1\141\1\151\1\157"+
		"\1\162\1\165\1\151\1\163\1\151\1\164\12\uffff\1\71\1\172\1\uffff\1\162"+
		"\1\144\1\141\1\172\1\142\1\156\1\145\1\154\1\165\1\uffff\2\172\1\164\1"+
		"\uffff\1\154\1\164\1\172\1\145\1\162\2\uffff\1\172\1\145\1\146\1\uffff"+
		"\1\172\1\156\1\uffff\2\172\1\uffff\1\172\3\uffff";
	static final String DFA15_acceptS =
		"\12\uffff\1\14\1\15\1\uffff\1\17\2\uffff\1\24\1\25\1\26\1\uffff\1\30\1"+
		"\31\1\32\1\33\1\34\1\35\1\36\1\37\1\41\1\42\1\43\1\44\2\uffff\1\46\1\51"+
		"\1\52\13\uffff\1\16\1\40\1\20\1\22\1\21\1\23\1\47\1\50\1\27\1\45\2\uffff"+
		"\1\7\11\uffff\1\1\3\uffff\1\12\5\uffff\1\2\1\3\3\uffff\1\10\2\uffff\1"+
		"\4\2\uffff\1\11\1\uffff\1\5\1\6\1\13";
	static final String DFA15_specialS =
		"\140\uffff}>";
	static final String[] DFA15_transitionS = {
			"\1\43\1\44\2\uffff\1\43\22\uffff\1\43\1\15\1\37\2\uffff\1\24\1\13\1\37"+
			"\1\31\1\32\1\22\1\20\1\34\1\21\1\42\1\23\1\40\11\41\1\35\1\33\1\17\1"+
			"\14\1\16\2\uffff\32\36\1\27\1\uffff\1\30\1\uffff\1\36\1\uffff\2\36\1"+
			"\2\1\5\1\7\1\4\2\36\1\1\6\36\1\6\1\36\1\11\3\36\1\3\1\10\3\36\1\25\1"+
			"\12\1\26",
			"\1\46\7\uffff\1\45",
			"\1\47",
			"\1\50",
			"\1\51\2\uffff\1\52",
			"\1\53",
			"\1\54",
			"\1\55",
			"\1\56",
			"\1\57",
			"",
			"",
			"\1\60",
			"",
			"\1\62",
			"\1\64",
			"",
			"",
			"",
			"\1\67\4\uffff\1\66",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"\1\42\1\uffff\12\42",
			"\1\42\1\uffff\12\72",
			"",
			"",
			"",
			"\1\73",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"\1\75",
			"\1\76",
			"\1\77",
			"\1\100",
			"\1\101",
			"\1\102",
			"\1\103",
			"\1\104",
			"\1\105",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"\1\42\1\uffff\12\72",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"",
			"\1\107",
			"\1\110",
			"\1\111",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"\1\113",
			"\1\114",
			"\1\115",
			"\1\116",
			"\1\117",
			"",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"\1\122",
			"",
			"\1\123",
			"\1\124",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"\1\126",
			"\1\127",
			"",
			"",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"\1\131",
			"\1\132",
			"",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"\1\134",
			"",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"",
			"\12\36\7\uffff\32\36\4\uffff\1\36\1\uffff\32\36",
			"",
			"",
			""
	};

	static final short[] DFA15_eot = DFA.unpackEncodedString(DFA15_eotS);
	static final short[] DFA15_eof = DFA.unpackEncodedString(DFA15_eofS);
	static final char[] DFA15_min = DFA.unpackEncodedStringToUnsignedChars(DFA15_minS);
	static final char[] DFA15_max = DFA.unpackEncodedStringToUnsignedChars(DFA15_maxS);
	static final short[] DFA15_accept = DFA.unpackEncodedString(DFA15_acceptS);
	static final short[] DFA15_special = DFA.unpackEncodedString(DFA15_specialS);
	static final short[][] DFA15_transition;

	static {
		int numStates = DFA15_transitionS.length;
		DFA15_transition = new short[numStates][];
		for (int i=0; i<numStates; i++) {
			DFA15_transition[i] = DFA.unpackEncodedString(DFA15_transitionS[i]);
		}
	}

	protected class DFA15 extends DFA {

		public DFA15(BaseRecognizer recognizer) {
			this.recognizer = recognizer;
			this.decisionNumber = 15;
			this.eot = DFA15_eot;
			this.eof = DFA15_eof;
			this.min = DFA15_min;
			this.max = DFA15_max;
			this.accept = DFA15_accept;
			this.special = DFA15_special;
			this.transition = DFA15_transition;
		}
		@Override
		public String getDescription() {
			return "1:1: Tokens : ( Int | Char | Void | Float | Double | Print | If | Else | While | For | Return | Or | And | EQ | NE | GTE | LTE | GT | LT | Add | Sub | Mul | Div | Mod | LBrace | RBrace | LBracket | RBracket | LParen | RParen | SColon | Assign | Comma | Colon | Identifier | String | Number | FloatNumber | Comment1 | Comment2 | WhiteSpace | Newline );";
		}
	}

}
