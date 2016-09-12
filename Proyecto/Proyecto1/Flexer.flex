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
		int a = 0;

		if(tope != espacios){
			if(tope > espacios){
				while(pila.peek() > espacios && pila.peek()!=0){
					a = pila.pop();
					dedents += "DEDENT("+a+")\n";
				}
				if(pila.peek() == espacios){
					System.out.print(dedents);
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
KEYWORD = "and" | "from" | "def" | "as" | "or" | "not" | "for" | "while" | "if" | "else" | "elif" | "print" | "in"
LETRASM = [a-z]
LETRASMA = [A-Z]
LETRAS = {LETRASM}|{LETRASMA}
DIGIT = [1-9]
DIGITZ = [0-9]
PUNTO = "."
IDENTIFICADOR = ({LETRAS} | "_")({LETRAS} | {DIGIT} | "_" )*
BOOLEANO = True | False
ENTERO = (({DIGIT}({DIGITZ}*)) | 0 )
REAL = {PUNTO}{DIGITZ}+ | {ENTERO}{PUNTO}{DIGITZ}+ | {ENTERO}
OPERACION = "++" | "--" | "+" | "-" | "*" | "**" | "/" | "//" | "%" | ">" | "<" | ">=" | "<=" | "==" | "!=" | "-=" | "+="
SEPARADOR = "(" | ")" | ":" | ";" | "=" 
NEWLINE = "\n"
TABULADOR = "\t"
ESPACIO = " "     
CHAR_LITERAL = {LETRAS} | {DIGITZ} | "_" | " " | "$" | {OPERACION} | {ESPACIO} | {TABULADOR} | {OPERACION} | {SEPARADOR} | {PUNTO}
COMENTARIO = "#"
COMENTARIOS = {COMENTARIO}({LETRAS} | {COMENTARIO} | {IDENTIFICADOR} | {DIGITZ} | {KEYWORD} | {OPERACION} | {SEPARADOR} | {PUNTO} | {ESPACIO} | {TABULADOR} | "_" | ",")*{NEWLINE}

%%
/*Estado para identificar cadenas*/
<CADENA>{
	{CHAR_LITERAL}*\"					{System.out.print("Cadena("+yytext().substring(0,yylength()-1)+")"); yybegin(YYINITIAL);}
	{CHAR_LITERAL}*\'					{System.out.print("Cadena("+yytext().substring(0,yylength()-1)+")"); yybegin(YYINITIAL);}
	{NEWLINE}							{System.out.println("Cadena mal hecha en línea "+ (yyline+1)); System.exit(1);}
}
/*Estado base encargado de llamar a otros estados e identificar a la mayoría de los tokens*/
<YYINITIAL>{
	{COMENTARIOS}						{System.out.print(/*"COMENTARIO("+yytext()+")"*/"");}
	\"									{yybegin(CADENA);}
	\'									{yybegin(CADENA);}
	{ESPACIO}							{System.out.print("");}	
	{KEYWORD}							{System.out.print("KEYWORD("+yytext()+")");}
	{BOOLEANO}							{System.out.print("BOOLEANO("+yytext()+")");}
	{IDENTIFICADOR}						{System.out.print("IDENTIFICADOR("+yytext()+")");}
	{ENTERO}							{System.out.print("ENTERO("+yytext()+")");}
	{REAL}								{System.out.print("REAL("+yytext()+")");}
	{SEPARADOR}							{System.out.print("SEPARADOR("+yytext()+")");}
	{OPERACION}							{System.out.print("OPERADOR("+yytext()+")");}
	{NEWLINE}							{yybegin(INDENT); actual = 0; System.out.print("NEWLINE"+yytext());}
	<<EOF>>								{yybegin(INDENT); actual = 0; System.out.println("NEWLINE");}

	
}
/*Estado encargado de revisar los idents y dedents*/
<INDENT>{
	{NEWLINE}							{actual = 0;}
	{ESPACIO}							{actual++;}
	{TABULADOR}							{actual = actual + 4;}
	.									{yypushback(1);
											if(!indentacion(actual)){
												System.out.println("Error de indentacion, linea " +(yyline+1));
												System.exit(1);
											}
											yybegin(YYINITIAL);
										}
	
	<<EOF>>								{indentacion(0); System.exit(0);}
	
	
}
/*Caso de error*/
[^]									{System.out.println("Caracter no reconocido en la linea "+ (yyline+1)+ "("+yytext()+")");System.exit(1);}
