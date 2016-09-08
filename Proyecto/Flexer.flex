import java.util.Stack;
import java.util.Arrays;
%%
%public
%class Flexer
%standalone
%line
%state INDENT CADENA
%unicode
%{
	static String dedents = "";
	static Stack<Integer> pila = new Stack<Integer>();
	static Integer actual = 0;

	public static boolean indentacion(int espacios){
		if(pila.empty()){
			pila.push(new Integer(0));
		}
		Integer tope = pila.peek();

		if(tope != espacios){
			if(tope > espacios){
				while(pila.peek() > espacios && pila.peek()!=0){
					pila.pop();
					dedents += "DEDENT\r";
				}
				if(pila.peek() == espacios){
					System.out.println(dedents);
					dedents = "";
					return true;
				}
				return false;
			}
			pila.push(espacios);
			System.out.println("INDENT("+actual+")");
			return true;
		}
		return true;
	}
%}
LETRAS = [a-zA-Z]
DIGIT = [1-9]
DIGITZ = [0-9]
PUNTO = "."
MENOS = "-"
IDENTIFICADOR ={LETRAS} | DIGIT | "_" )*
BOOLEANO = True | False
ENTERO = (({DIGIT}({DIGITZ}*)) | 0 ) | (MENOS({DIGIT}({DIGITZ}*)))
REAL = {PUNTO}{DIGIT}+ | {ENTERO}{PUNTO}{DIGIT}+ | {ENTERO}
CADENA = {IDENTIFICADOR} | {OPERADOR} | {ENTERO} | {REAL} | {SEPARADOR}
CADENAS = ("{CADENA}")*
KEYWORD = "and" | "or" | "not" | "for" | "while" | "if" | "else" | "elif" | "print" | "in"
OPERADOR = "+" | "-" | "*" | "**" | "/" | "//" | "%" | ">" | "<" | ">=" | "<=" | "==" | "!=" | "-=" | "+="
SEPARADOR = "(" | ")" | ":" | ";" | "=" 
NEWLINE = [\n$]
TABULADOR = [\t]
ESPACIO = " "
IDENTACION = {ESPACIO}	| {TABULADOR}
NNDIGIT		=       [1-9]
DIGIT		=       [0-9]       
CERO             	=        0
NEWLINE 	= 		"\r"
%%
{CERO} | {NNDIGIT}{DIGIT}*		      	{ System.out.println("INTEGER("+yytext()+")");}
{NEWLINE}								{yybegin(INDENT); actual = 0; System.out.println("NEWLINE"+yytext());}
<INDENT>{
	NEWLINE								{actual = 0;}
	" "									{actual++;}
	\t 									{actual = actual + 4;}
	
}
<<EOF>>									