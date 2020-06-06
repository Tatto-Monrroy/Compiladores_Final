package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Punto */
( "." ) {lexeme=yytext(); return Punto;}

/* Comillas */
( "\"" | "\'" ) {lexeme=yytext(); return Comillas;}

/* Tipo de Dato Integer */
(  Integer  ) {lexeme=yytext(); return Integer;}

/* Tipo de Dato Char */
( Char ) {lexeme=yytext(); return Char;}

/* Tipo de Dato Boolean */
( Boolean ) {lexeme=yytext(); return Boolean;}

/* Tipo de Dato Real */
(  Real ) {lexeme=yytext(); return Real;}

/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Tipos variables X, Y, Z, W, U */
( "X" | "Y" | "Z" | "W" | "U" | "Valor1" | "Palabra" ) {lexeme=yytext(); return Variable;}

/* Tipo variable1 */
( "Variable1" ) {lexeme=yytext(); return Variable;}

/* Tipo variable2 */
( "Variable2" ) {lexeme=yytext(); return Variable;}

/* Tipo variable3 */
( "Variable3" ) {lexeme=yytext(); return Variable;}

/* Tipo variable4 */
( "Variable4" ) {lexeme=yytext(); return Variable;}

/* Tipo variable5 */
( "Variable5" ) {lexeme=yytext(); return Variable;}

/* Tipo Formula1 */
( "Formula1" ) {lexeme=yytext(); return Formula;}

/* Tipo Formula2 */
( "Formula2" ) {lexeme=yytext(); return Formula;}

/* Tipo Formula3 */
( "Formula3" ) {lexeme=yytext(); return Formula;}

/* Tipo Formula4 */
( "Formula4" ) {lexeme=yytext(); return Formula;}

/* Tipo Formula5 */
( "Formula5" ) {lexeme=yytext(); return Formula;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada As */
( As ) {lexeme=yytext(); return As;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Igual */
( = ) {lexeme=yytext(); return Igual_F;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}
