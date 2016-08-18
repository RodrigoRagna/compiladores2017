import java.util.Stack;
import java.util.Arrays;
%%
%public
%class Flexer
%standalone
%line

SIGNO 		= 		[-]
NNDIGIT		=       [1-9]
DIGIT		=       [0-9]       
PUNTO		= 		.
CERO        =        0
LETRAS 		= 		[A-Z]
LETRASMINUS = 		[a-z]
SIGNOS		= 		[^$|_|\n|\b|+|-|*|/|if|else|for|switch|int|float|char|String|double|boolean|static|public|void|null|private|main|abstract|assert|break|byte|case|catch|class|const|continue|default|do|enum|extends|finall|finally|goto|implements|import|instanceof|interface|long|native|new|package|protected|short|return|strictfp|super|synchronized|this|throw|throws|try|transient|volatile|while|//|/*|*/\t|\udddd|\\|\'|\"|\r|=|%|&|#|!|¡|¿|?|:|;|,|.|~|<|>]

%%

({SIGNO}{CERO} | {NNDIGIT}{DIGIT}*)	| ({CERO} | {NNDIGIT}{DIGIT}*)							{System.out.println("ENTERO("+ yytext() +")");}
({SIGNO} ({CERO}{PUNTO}{NNDIGIT}{DIGIT}* | {NNDIGIT}{DIGIT}*{PUNTO}{NNDIGIT}{DIGIT}*))|({CERO}{PUNTO}{NNDIGIT}{DIGIT}* | {NNDIGIT}{DIGIT}*{PUNTO}{NNDIGIT}{DIGIT}*)		{System.out.println("REAL("+ yytext() +")");}
({DIGIT}|{LETRAS}|LETRASMINUS|SIGNOS)*														{System.out.println("IDENTIFICADOR("+ yytext() 
+")");}
[^]																							{System.out.println("NO RECONOCIDO("+ yytext() 
+")");}
