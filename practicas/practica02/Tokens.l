/********************************************************************************
**  Proyecto 1: Analizador léxico para p--, subconjunto de Python.                               **
**                                                                                                **
*********************************************************************************/
import java.util.Stack;
import java.util.Arrays;
%%
%public
%class Tokens
%byaccj
%line
%unicode
%debug
%{
    private Parser yyparser;

    /** Nuevo constructor
    * @param FileReader r
    * @param Parser parser - parser
    */
    public Tokens(java.io.Reader r, Parser parser){
    	   this(r);
    	   this.yyparser = parser;
    }

%}
NUMBER = 0 | [1-9][0-9]*
SUM = "+"
SUB = "-"
DIV = "/"
MULT = "*"
%%

{SUM}						{ yyparser.yylval = new ParserVal(yytext()); 
							return Parser.SUM;}
{SUB}						{ yyparser.yylval = new ParserVal(yytext()); 
							return Parser.SUB;}
{DIV}						{ yyparser.yylval = new ParserVal(yytext()); 
							return Parser.DIV;}
{MULT}						{ yyparser.yylval = new ParserVal(yytext()); 
							return Parser.MULT;}
{NUMBER}					{ yyparser.yylval = new ParserVal(Integer.parseInt(yytext())); 
							return Parser.NUMBER;}

<<EOF>>           			{ return 0;}
[^]					{}