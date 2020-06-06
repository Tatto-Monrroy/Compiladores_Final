package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Punto */
( "." ) {return new Symbol(sym.Punto, yychar, yyline, yytext());}

/* Comillas */
( "\"" | "\'" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Comillas Simples */
( "\'" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Tipo de dato Integer */
( Integer ) {return new Symbol(sym.Integer, yychar, yyline, yytext());}

/* Tipo de dato Char */
( Char ) {return new Symbol(sym.Char, yychar, yyline, yytext());}

/* Tipo de dato Boolean */
( Boolean ) {return new Symbol(sym.Boolean, yychar, yyline, yytext());}

/* Tipo de dato Real */
( Real ) {return new Symbol(sym.Real, yychar, yyline, yytext());}

/* Tipo de dato String */
( String ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Tipo variables X Y Z W U */
( "X" | "Y" | "Z" | "W" | "U" | "Valor1" | "Palabra" ) {return new Symbol(sym.Variable, yychar, yyline, yytext());}

/* Palabra reservada Variable1 */
( "Variable1" ) {return new Symbol(sym.Variable, yychar, yyline, yytext());}

/* Palabra reservada Variable2 */
( "Variable2" ) {return new Symbol(sym.Variable, yychar, yyline, yytext());}

/* Palabra reservada Variable3 */
( "Variable3" ) {return new Symbol(sym.Variable, yychar, yyline, yytext());}

/* Palabra reservada Variable4 */
( "Variable4" ) {return new Symbol(sym.Variable, yychar, yyline, yytext());}

/* Palabra reservada Variable5 */
( "Variable5" ) {return new Symbol(sym.Variable, yychar, yyline, yytext());}

/* Palabra reservada Formula1 */
( "Formula1" ) {return new Symbol(sym.Formula, yychar, yyline, yytext());}

/* Palabra reservada Formula2 */
( "Formula2" ) {return new Symbol(sym.Formula, yychar, yyline, yytext());}

/* Palabra reservada Formula3 */
( "Formula3" ) {return new Symbol(sym.Formula, yychar, yyline, yytext());}

/* Palabra reservada Formula4 */
( "Formula4" ) {return new Symbol(sym.Formula, yychar, yyline, yytext());}

/* Palabra reservada Formula5 */
( "Formula5" ) {return new Symbol(sym.Formula, yychar, yyline, yytext());}

/* Palabra reservada As*/
( As ) {return new Symbol(sym.As, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}

/* Operador Igual */
( = ) {return new Symbol(sym.Igual_F, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
