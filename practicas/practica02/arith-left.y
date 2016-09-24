%{
  import java.lang.Math;
  import java.io.*;
%}
/* YACC Declarations */
%token<ival> NUMBER
%token<sval>SUM 
%token<sval>SUB
%token<sval>DIV
%token<sval> MULT
%type<ival> E
%type<ival> T 
%type<ival> F
%type<ival> Start

/* Grammar follows  --- LEFT RECURSION --- */
%%

Start:  E           {dump_stacks(stateptr); System.out.println("Reconocimiento exitoso de: "+$$);};

E: E SUM T      {dump_stacks(stateptr); $$ = $1+$3;}
| E SUB T       {dump_stacks(stateptr); $$ = $1-$3;}
| T             {dump_stacks(stateptr); $$ = $1;};

T: T MULT F     {dump_stacks(stateptr); $$ = $1*$3;}
| T DIV F       {dump_stacks(stateptr); $$ = $1/$3;}
| F             {dump_stacks(stateptr); $$ = $1;};

F: NUMBER       {dump_stacks(stateptr); $$ = $1;}
| SUB NUMBER    {dump_stacks(stateptr); $$ = $2-($2*2);};

%%

/* a reference to the lexer object */
private Tokens lexer;

/* interface to the lexer */
private int yylex () {
    int yyl_return = -1;
    try {
      yyl_return = lexer.yylex();
    }
    catch (IOException e) {
      System.err.println("IO error :"+e);
    }
    return yyl_return;
}

/* error reporting */ 
public void yyerror (String error) {
    System.err.println ("Error: " + error);
}

/* lexer is created in the constructor */
public Parser(Reader r) {
    lexer = new Tokens(r, this);
    
}

/* that's how you use the parser */
public static void main(String args[]) throws IOException {
    Parser yyparser = new Parser(new FileReader(args[0]));
    yyparser.yyparse();    
}