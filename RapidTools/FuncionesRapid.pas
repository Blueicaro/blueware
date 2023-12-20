{       Unidad para la extracción de datos e información de un programa RAPID
Version 1.93: 2022/08/14
        Se corrige bug en extración de rutinas.
Version 1.92: 2021/04/16
        Se añade la función BuscaPuntosEx
Version 1.91; 30/08/2017
      La función CambiaAsterisco, el parametro aPunto que era un string con el
      nombre del punto ahora es stringlist los nombres para las instrucciones
      que tienen más de un punto. Y el parámetro aDefinición que devolvia un
      string con la declaración del punto, ahora devuelve un stringlist con
      las declaraciones de los puntos.
      La función CambiaAsterisco se corregió para soportar instrucciones con
      \ID, necesarias para el multimove
Version 1.9; 14/06/2016
     Añadida la rutina BuscaSpots que devuelve los spotdata encontrados en un
     modulo.
     Añadida la rutirna ExtraerSpotData
Version 1.82 28-10-2007
      Añadida la rutina EsRutina para saber si una línea pasada como parámetro
      es un rutino o no y de que tipo.
      Añadida la función CabeceraModulo. Esta función extrae todo el contenido
      de la cabecera de un módulo.
      Ahora la rutina BuscaPuntos, también puede localizar puntos definidos como
      LOCAL o TASK
      Añadida la rutina NombreModulo, la cual devuelve el nombre de un módulos,
      pasado como parámtro, en el caso de que no se pueda devuelve la cadena
      vacia   
Version 1.81 26-10-2007
      Añadida la rutina ExtraerRutina, que extrae el contenido de un rutina
      Añadida la rutina EsRutina para saber si una línea pasada como parámetro
      es un rutino o no y de que tipo.

Version 1.8; 7-10-2007
      Añadida la rutina ListaRutinas, la cual devuelve la lista de rutinas,
      procedemientos, traps o funciones, que tiene un programa pasado como
      dato.

Version 1.7; 7-6-2007
      Se modifica lo rutina BuscaPuntos, para que ahora devuelve los puntos
      declarados como Persistentes y variables, aparte de los constantes.
      Se añade la función CambiaAsterisco, con la cual se cambia en una línea
      que sea orden de movimiento, el punto definido como asterisco por un
      punto declarado.
      Se añade la función BuscaWobjData, para localizar los objetos de trabajo.
      Corregido un bug en la función BuscaLoadData, ahora las cadenas del
      StringList van sin espacios al principio ni al final.

Versión 1.6; 4-5-2006
      Corregido un bug en la función ExtraerModulo, ya que solo encontraba el
      módulo buscado si este era el primero en el fichero

Versión 1.5; 30-11-2005
      Se añade la función BuscaLoadData para buscar la lista de LoadData que
      que tiene un programa o módulo. Dicha función usa como apoyo una función
      genérica llamada BuscaDato, que recibe dos parámetros. El primero es la
      declaración del dato buscado, y el otro la línea que se quiere comprobar.
      Devuelve el nombre del dato encontrado

Versión 1.41; 6-5-2004

       La funcion BuscaProc, cuando encontraba una función en lugar de
       devolver el nombre de la rutina, en su lugar devolvía el nombre de la
       rutina, además del tipo de dato que devuelve, por ejemplo:
       Func num Mifuncion(), devolvía num Mifuncion en lugar de Mifuncion.
       Corregido un bug en el función EsOrdenMovimiento, por el cual cuando
       había dos ordenes de movimientos parecidas, MoveJ y MoveJDO, por ejemplo
       encontraba MoveJDo y lo comparaba con MoveJ, y estrair mal el nombre del
       punto, ya que la comparación la hacía por la función Pos, ahora la hace
       por la función PalabraEntera, por lo cual ahora extrae la primera palabra
       existente en la línea, y la compara con cada una de las instrucciones
       pasadas a la rutina. Por tanto debe usar esta unidad con la unidad
       CadenasUtiles.

       Se añade la constante FuncionesRapidVersion , que devuelve la versión de
       la unidad con la que fue compilada la aplicación. Para uso desde la
       aplicaciones que usan esta unidad.

Versión 1.4; 20-3-2004
         Añadida la Función EsOrdenMovimiento, la cual permite comprobar si
         una línea es una orden de movimiento y devuelve el punto asociado a él.

Versión 1.3; 13-3-2004
        Añadida función EsFicheroRapid, la cual permite comprobar la validez
        de un fichero

Versión 1.2; 09-12-2003
        Añadido como instrucciones de movimiento las órdenes: SpotLi y SpotL

Versión 1.1; 22-11-2002
        Añadida Function BuscaProcTipo para buscar un solo tipo de rutina
        Añadido Procedimiento RetirarParentesis

Versión 1.0; Algún día del 2002.
         Primera versión operativa
        (c) Jorge Turiel
        jorge.turiel@es.abb.com
}
unit FuncionesRapid;

interface

uses Classes, SysUtils, CadenasUtiles, strutils;

const
  //Versión de esta unidad. Se debe incluir este valor en el programa que use
  //esta rutina para conocer que versión está usando el programa.
  FuncionesRapidVersion: string = ('1.91');

  //Constante que contiene las palabras claves con las que se declaran una
  //rutina en Rapid

  DeclaraRutina: array [0..2] of string = ('PROC', 'FUNC', 'TRAP');
  //Constante que contiene las palabras claves con las que se declaran un
  //punto de movimiento en Rapid
  DeclaraPunto: array [0..2] of string = ('CONST ROBTARGET', 'PERS ROBTARGET',
    'VAR ROBTARGET');
  //Usado en la rutina BuscaPuntos

  //Declaraciones del ámbito posible de las variables
  //El primer elemento tiene que estar vacio, porque así indica scope ninguno
  //Ej: Local RobTarget (..)
  //DEja un espacio al final del nombre para asegurar que cuando el elemento es
  //sumado a la declaración este quede separado uno del otro
  Ambito: array [0..2] of string = ('', 'LOCAL ', 'TASK ');
  // Constante que define la marca con la que empieza un modulo
  Modulo: string = 'module';

  //Matriz de cadenas que contiene la lista de instrucciones de movimiento
  Max: integer = 5;
  Movimientos: array [0..5] of string = ('Sin Definir', 'MoveJ', 'MoveL', 'SpotLi',
    'SpotL', 'MoveC');



type
  TTipoRutina = (Trap, Proc, Func);
  TipoRutina = set of TTipoRutina;

{----------------------------------------------------------------------------}
//Esta rutina devuelve un TStringList con la lista de declaración de
//puntos que encontro.
function BuscaRobTarget(aFile: TStringList): TStringList;
//Esta función devuelve el nombre del módulo pasado como parámetro
function NombreModulo(aModulo: TStringList): string;
//Function NombreRutna devuelve el nombre de la rutina pasada como parámetro
function NombreRutina(aRutina: TStringList): string;
//Esta función extrae todo el contenido de la cabecera de un módulo
function CabeceraModulo(aModulo: TStringList): TStringList;
//Esta función devuelve  true o falso según sea una rutina o no. Adenás
//por el parámetro aTipoRutina devuelve el tipo de rutina que es.
function EsRutina(aLinea: string; var aLocaL: boolean;
  var aTipoRutina: TipoRutina): boolean;
//Esta función extrae una rutina
function ExtraerRutina(aFile: TStringList; aNombre: string): TStringList;
//Rutina que devuelve la lista de rutina/funciones/trap que hay en un programa
function ListaRutinas(const aFName: TStringList): TStringList;
//Esta función busca los objetos de trabajo dentro de un StringList y
//los devuelve
function BuscaWobjData(const aFname: TStringList): TStringList;
//Esta función Cambia la punto definido como asterisco en una línea, por
//un punto definido. aLinea es una cadena que contiene la línea a modificar.
//aPunto, es el nombre del punto que se usara para declarlo. aDefinicion Devuelve
//la definición del punto para añadir al programa, pero sin tipo, antes de añadirla
//al módulo hay que indicar si es constante, persistente, etc.
function CambiaAsterisco(const aLinea, aPunto: string; var aDefinicion: string): string;
function CambiaAsterisco(const aLinea: string; aPunto: TStringList;
  var aDefinicion: TStringList): string;

function CambiaAsterisco(const aLinea: string; Prefijo: string;
  Indice: integer; Incremento: integer; var aDefinicion: TStringList;
  var Siguiente: integer): string;
//Esta función busca las declaraciones de LoadData en el fichero pasado
// y devuelve la lista de nombres que ha encontrado
function BuscaLoadData(const aFname: TStringList): TStringList;

//Esta función busca las declaraciones de ToolData en el fichero pasado
// y devuelve la lista de nombres que ha encontrado
function BuscaToolData(const aFname: TStringList): TStringList;

//Esta función es de apoyo a las rutinas de buscada de tipos de datos
function BuscaDato(const aTipoDato: string; var aLinea: string): string;

// Esta funcion busca la declaracion de spotdata, copia el nombre
// de este lo almacena en una lista, que la devuelve como resultado de la
// función
function BuscaSpotData(const aFname: TStringList): TStringList;

//Busca el spotdata pasado como parámetro y devuelve todo su contenido.
function ExtraerSpot(const aSpotName: string; aModulo: TStringList): string;

// Esta funcion busca la declaracion de puntos robot target, copia el nombre
// de este, y lo almacena en una lista, que la devuelve como resultado de la
// función

function BuscaPuntos(const aFname: TStringList): TStringList;

{ Esta función BuscaPuntos declarados en el módulo pasado como parámetro
 y devuelve un tstringlist que contiene los puntos que encontro.
 Devuelve la línea entera}
function BuscaPuntosEx(aFname: TStringList): TStringList;


{Esta función busca procedimientos funciones o traps y devuelve una lista
 con el nombre de los procedimientos encontrados}
function BuscaProc(const aFname: TStringList): TStringList;


//Esta función devuelve verdadero si la linea pasada como
//parametro es una instrucción de movimiento y tiene como punto un *
//y por TipoMove devuelve la instrucción de movimiento
function EsMoveAsterico(const aString: string; var TipoMove: string): boolean;

{Esta función devuelve verdadero si la linea pasada como
parametro es una instrucción de movimiento y tiene como punto un *
y por TipoMove devuelve la instrucción de movimiento. Y Por Cantidad indica si
el número de puntos que tiene la instrucción}
function EsMoveAsterico(const aString: string; var TipoMove: string;
  var Cantidad: integer): boolean;
{
 Esta función devuelve una línea nueva, dónde la línea contiene una orden
 de movimiento y un punto declarado como variable. Y lo reemplaza por un
 asterísco
}
function PonerAsterisco (const aLinea:string;  valor:string):string;

{ Esta función localiza los módulos que contiene un programa
  y devuelve una lista }
function BuscaModulos(const aFname: TStringList): TStringList;

//Esta función devuelve modulo y todo su contenido
function ExtraerModulo(const aFname: TStringList; const aModulo: string): TStringList;

//Esta función extrae el nombre del punto de una linea pasada como parametro
function ExtraerPunto(const aString: string): string;

//Nombre Modulo
function NombreModulo (const aModulo:string):string;

//Busca procediminetos o funciones que empiezen por un tipo de declaracion
//especificada en el parametro aTipo. Devuelve una lista con el nombre de las funciones
//encontradas en la Lista pasada en aFname
function BuscaProcTipo(const aFname: TStringList; const aTipo: string): TStringList;
//Este procedimiento retira todos los parentesis que existan al final de una cadena
procedure RetiraParentesis(var aCadena: string);

{Esta función comprueba si el fichero pasasdo como parámetro (TStringList) es un
fichero Rapid Válido. Comprobando si contiene una cabecera válida.
Cabecera buscada:
%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%
Las 4 primeras líneas tiene que contener ésta cabecera en los sistemas S4.
En Irc5 es opcional
}
function EsFicheroRapid(const aTexto: TStringList): boolean;

{Esta función devuelve TRUE en el caso que la cadena pasada por el
parámetro aCadena, si es una orden de movimiento especificada por el parámetro
aMove, que es un array abierto de cadenas. En caso de ser un movimiento con un
punto declarado (P10 por ejemplo) se devuelte el nombre del punto por la variable
aNombrePunto, sino devuelve un asterisco si el punto no está declarado}
function EsOrdenMovimiento(const aCadena: string; const aMove: array of string;
  var aNombrePunto: string; var Valor: string): boolean;


implementation
//Esta función Cambia la punto definido como asterisco en una línea, por
//un punto definido. aLinea es una cadena que contiene la línea a modificar.
//aPunto, es el nombre del punto que se usara para declarlo. aDefinicion Devuelve
//la definición del punto para añadir al programa, pero sin tipo, antes de añadirla
//al módulo hay que indicar si es constante, persistente, etc.
//MoveJ [[401.99,1158.33,912.11],[0.936163,0.05512,-0.036828,0.345262],[1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v200,z20,t_Antorcha;
function CambiaAsterisco(const aLinea, aPunto: string; var aDefinicion: string): string;
var
  Cadena,  //Cadena de uso general
  Orden,   // Contiene la orden de moviemiento Ej : MoveJ
  Final, //Contiene lo que hay en la línea después del asterisco
  Asterisco: string;
  Posicion: integer;
  n: SizeInt;

begin
  // Retirar orden de movimiento
  Posicion := Pos(' ', UpperCase(aLinea));
  //Contiene la orden o instruccion de movimiento
  Orden := trim(Copy(aLinea, 1, Posicion));

  Cadena := Copy(aLinea, Posicion, Length(aLinea));
  //Retirar el punto. El asterisco acaba con ]],

  Posicion := (Pos(']]', Cadena));


  Asterisco := Copy(Cadena, 1, Posicion);


  Final := Copy(Cadena, Posicion + 2, Length(Cadena));
  aDefinicion := Asterisco + ']';
  ;
  //Posicion := (Pos (Cadena,']],'))+3;

  Result := Orden + ' ' + Apunto + '' + Final;

end;

function CambiaAsterisco(const aLinea: string; aPunto: TStringList;
  var aDefinicion: TStringList): string;
var
  Cadena,  //Cadena de uso general
  Orden,   // Contiene la orden de moviemiento Ej : MoveJ
  Final, //Contiene lo que hay en la línea después del asterisco
  Asterisco: string;
  Posicion, Limite, I: integer;

begin
  // Retirar orden de movimiento
  Posicion := Pos(' ', UpperCase(trim(aLinea)));
  //Contiene la orden o instruccion de movimiento
  Orden := trim(Copy(aLinea, 1, Posicion));

  Cadena := Copy(aLinea, Posicion + 1, Length(aLinea));
  //Retirar el punto. El asterisco acaba con ]],

  Posicion := (Pos(']]', trim(Cadena)));
  //Mientras se siga encontrando ]], hay más declaraciones de puntos
  //debemos volver a crear otro astericos
  while Posicion > 0 do
  begin
    Asterisco := Copy(trim(Cadena), 1, Posicion + 1);
    if Pos(',', Asterisco) = 1 then
    begin
      Asterisco := RightStr(Asterisco, Length(Asterisco) - 1);
    end;
    aDefinicion.Add(Asterisco);
    Cadena := Copy(Trim(cadena), Posicion + 2, Length(Cadena));
    Posicion := (Pos(']]', Cadena));
  end;

  Final := Copy(Cadena, Posicion, Length(Cadena));
  //  aDefinicion := Asterisco + ']';
  //Posicion := (Pos (Cadena,']],'))+3;
  Limite := aPunto.Count;
  if aPunto.Count > aDefinicion.Count then
  begin
    Limite := aDefinicion.Count;
  end;
  Cadena := '';
  for I := 0 to Limite - 1 do
  begin
    Cadena := Cadena + Apunto[I] + ',';
  end;
  if Limite < aDefinicion.Count then
  begin
    for I := Limite to aDefinicion.Count - 1 do
    begin
      Cadena := cadena + aDefinicion[I] + ',';
    end;
  end;
  Cadena := Leftstr(Cadena, Length(Cadena) - 1);
  Result := Orden + ' ' + Cadena + Final;
  // Result := Orden + ' ' + Apunto + '' + Final;

end;



// Esta función busca la declaracion de spotdata, copia el nombre
// de este lo almacena en una lista, que la devuelve como resultado de la
// función
function BuscaSpotData(const aFname: TStringList): TStringList;
var
  I: integer;
  Cadena: string;
  Fin, P: SizeInt;
  Lista: TStringList;
begin
  Lista := TStringList.Create;

  for I := 0 to aFname.Count - 1 do
  begin
    Cadena := Trim(aFname[I]);
    P := Pos('PERS', UpperCase(Cadena));
    if P > 0 then
    begin
      P := Pos('SPOTDATA', UpperCase(Cadena));
      if p > 0 then
      begin
        Cadena := Trim(Copy(Cadena, P + (Length('SPOTDATA'))));
        Fin := Pos(':=', Cadena);
        if (Fin > 0) then
        begin
          Cadena := Copy(Cadena, 1, Fin - 1);
          Lista.Add(Cadena);
        end;
      end;
    end;
  end;
  Result := Lista;

end;

function ExtraerSpot(const aSpotName: string; aModulo: TStringList): string;
var
  //aModulo: TStringList;
  I: integer;
  Cadena: string;
  P: SizeInt;
begin
  Result := '';
  // aModulo := CabeceraModulo(aModulo);
  I := 0;
  while I < aModulo.Count - 1 do
  begin
    Cadena := Trim(aModulo[I]);
    P := Pos('PERS', UpperCase(Cadena));
    if P > 0 then
    begin
      P := Pos('SPOTDATA', UpperCase(Cadena));
      if p > 0 then
      begin
        P := Pos(aSpotName, Cadena);
        if P > 0 then
        begin
          Result := Cadena;
          I := aModulo.Count;
        end;
      end;
    end;
    I := I + 1;
  end;
end;

// Esta funcion busca la declaracion de puntos robot target, copia el nombre
// de este lo almacena en una lista, que la devuelve como resultado de la
// función


function BuscaPuntos(const aFname: TStringList): TStringList;
var
  Hasta,//Variable usada para indicar el indice del caracter hasta el que se copia
  X, I, J: integer;
  Cadena: string;
  StPunto: string;
  Puntos: TStringList;

begin
  Puntos := TStringList.Create;
  try
    for I := 0 to aFname.Count - 1 do
    begin
      Cadena := aFname[i];
      Cadena := UpperCase(TrimLeft(Cadena));
      for X := 0 to High(Ambito) do
      begin
        for J := 0 to High(DeclaraPunto) do
        begin
          if Pos(Ambito[x] + DeclaraPunto[j], Cadena) = 1 then
          begin
            Hasta := (Pos(':', Cadena)) - 2;
            stPunto := Copy(Cadena, Length(Ambito[X] + DeclaraPunto[j]) +
              2, (Hasta - Length(Ambito[x] + DeclaraPunto[j])));
            Puntos.Add(stPunto);
          end;
     {  If Pos ('LOCAL '+DeclaraPunto[j],Cadena) = 1 Then
      Begin
        Hasta := (Pos (':',Cadena)) -2;
        Cadena := Copy (Cadena,Length ('Local '+DeclaraPunto[j])+2, (Hasta - Length ('Local '+DeclaraPunto[j])));

        Puntos.Add (Cadena);
      end;    }
        end; //Final de For J := 0...
      end;
    end;
  finally
    Result := Puntos;
  end;
end;

{2021-04-16}
function BuscaPuntosEx(aFname: TStringList): TStringList;
var
  Puntos: TStringList;
  I: integer;
  Cadena: string;
  Iniciar: boolean;
begin
  Puntos := TStringList.Create;
  Result := Puntos;
  Iniciar := False;
  I := 0;
  while I < aFname.Count do
  begin
    Cadena := UpperCase(Trim(aFname[I]));
    if WordCount(Cadena, [' ']) > 0 then
    begin
      if Iniciar = True then
      begin
        if (IsWordPresent('ROBTARGET', Cadena, [' '])) and
          (not StartsStr('!', Cadena)) = True then
        begin
          Result.Add(Trim(aFname[I]));
        end;
      end;
      if ExtractWord(1, Cadena, [' ']) = 'MODULE' then
      begin
        Iniciar := True;
      end;
      if (ExtractWord(1, Cadena, [' ']) = 'ENDMODULE') and (Iniciar = True) then
      begin
        I := aFname.Count;
      end;
    end;
    I := I + 1;
  end;
end;

//Esta función devuelve un valor superior a cero si la linea pasada como
//parametro es una instrucción de movimiento y tiene como punto un *
function EsMoveAsterico(const aString: string; var TipoMove: string): boolean;
var
  I: integer;
  Fin: boolean;
  Cadena: string;
begin
  Result := False;
  Fin := False;
  I := 0;
  TipoMove := Movimientos[0];
  //Analiza la cadena para cada uno de los tipos de movimientos
  //devuelve true si es un movimiento
  while (I <= Max) and (not Fin) do
  begin
    if Pos(Movimientos[i], aString) > 0 then
    begin

      TipoMove := Movimientos[i];
      Fin := True;
    end;
    Inc(i);
  end;
  if Fin = True then
  begin
    Cadena := '';
    Cadena := ExtraerPunto(aString);
    if Cadena[1] = '[' then
      Result := True;
  end;
end;
//Esta función extrae el nombre del punto de una linea pasada como parametro
function ExtraerPunto(const aString: string): string;
var
  CadenaTemp: string;
  Fin: boolean;
  indice: integer;
begin
  Result := '';
  indice := 1;
  CadenaTemp := Trimleft(aString);
  Fin := False;
  //Borra los primeros caracteres  hasta encontrar un espacio
  while (indice <= Length(CadenaTemp)) and (Fin = False) do
  begin
    if CadenaTemp[indice] = ' ' then
    begin
      CadenaTemp := Copy(CadenaTemp, indice, length(CadenaTemp));
      Fin := True;
    end;
    Inc(Indice);
  end;
  //Despues del bucle lo que queda es un punto
  CadenaTemp := TrimLeft(CadenaTemp);
  //Lo copiamos
  Fin := False;
  Indice := 0;
  while (indice <= Length(CadenaTemp)) and (Fin = False) do
  begin
    if CadenaTemp[indice] = ':' then
    begin
      CadenaTemp := Copy(CadenaTemp, 1, indice - 1);
      Fin := True;
    end;
    Inc(Indice);
  end;
  Result := CadenaTemp;
end;
//Revisar esta función
function BuscaProc(const aFname: TStringList): TStringList;
const
  Max: integer = 2;
  Declaraciones: array [0..2] of string = ('proc', 'func', 'trap');
var
  Procs: TStringList;
  Temp, Cadena: string;
  Declaracion: string;
  Hasta, //Indica donde acaba el nombre de la función a Extraer.
  I, X: integer;
  NombreFuncion: string;
  Desde: integer;
begin
  Procs := TStringList.Create;
  try
    for I := 0 to aFname.Count - 1 do
    begin
      Cadena := aFname[i];
      Cadena := lowerCase(TrimLeft(Cadena));
      for X := 0 to Max do
      begin
        Declaracion := Declaraciones[X];
        if Pos(Declaracion, Cadena) = 1 then
        begin
          //Si no es una trap lleva parentesis
          if Declaracion = 'proc' then
          begin
            Hasta := Pos('(', Cadena);
            Hasta := Hasta - (length(Declaracion) + 2);
          end
          else
          if Declaracion = 'func' then //Si es una función hay que quitar tb
          begin                        //la declaracion del tipo de dato que devuevle
            Hasta := Pos('(', Cadena);
            Hasta := Hasta - (length(Declaracion) + 2);
            NombreFuncion := Copy(Cadena, length(declaracion) + 2, Hasta);
            NombreFuncion := Trim(NombreFuncion);
            Desde := (Pos(' ', NombreFuncion)) + 1;
            Cadena := Copy(NombreFuncion, Desde, Hasta);
          end
          else
          begin
            hasta := length(Cadena) - Length(Declaracion[3]);
          end;

          Temp := Copy(Cadena, Length(declaracion) + 2, Hasta);
          Procs.Add(Temp);
        end;
      end;
    end;
  finally
    Result := Procs;
  end;
end;

function EsMoveAsterico(const aString: string; var TipoMove: string;
  var Cantidad: integer): boolean;
var
  I: integer;
  Fin: boolean;
  Cadena: string;
  N: SizeInt;
begin
  Result := False;
  Fin := False;
  I := 0;
  Cantidad := 0;
  TipoMove := Movimientos[0];
  //Analiza la cadena para cada uno de los tipos de movimientos
  //devuelve true si es un movimiento
  while (I <= Max) and (not Fin) do
  begin
    if Pos(Movimientos[i], aString) > 0 then
    begin

      TipoMove := Movimientos[i];
      Fin := True;
    end;
    Inc(i);
  end;
  if Fin = True then
  begin
    N := WordCount(astring, ['[']);
    Cantidad := N div 4;
  end;

end;

function PonerAsterisco(const aLinea: string; valor: string): string;
var
  Cadena, Orden, Resto, NombrePunto: String;
begin
//Result :=   ReplaceStr(aLinea,);
  Orden := ExtractWord(1,aLinea,[#32]);
  Cadena := ExtractWord(2,aLinea,[#32]);

  NombrePunto := ExtractWord(1,Cadena,[',']);

  Cadena := ReplaceStr(aLinea,NombrePunto,Valor);

Result := Cadena;

end;

{ Esta función localiza los módulos que contiene un programa
  y devuelve una lista }
function BuscaModulos(const aFname: TStringList): TStringList;
var
  ListaModulos: TStringList;
  Temp, Cadena: string;
  Hasta, //Indica donde acaba el nombre de la función a Extraer.
  I: integer;

begin
  ListaModulos := TStringList.Create;
  try
    for I := 0 to aFname.Count - 1 do
    begin
      Cadena := aFname[i];
      Cadena := lowerCase(TrimLeft(Cadena));
      if Pos(Modulo, Cadena) = 1 then
      begin
        hasta := length(Cadena) - Length(Modulo);
        Temp := Copy(Cadena, Length(Modulo) + 2, Hasta);
        ListaModulos.Add(Temp);
      end;
    end;
  finally
    Result := ListaModulos;
  end;
end;
//Esta función devuelve modulo y todo su contenido
function ExtraerModulo(const aFname: TStringList; const aModulo: string): TStringList;
var
  Resultado: TStringList;
  Buscar, Cadena: string;
  Encontrado, Fin: boolean;
  I: integer;
begin
  Resultado := TStringList.Create;
  try
    Fin := False;
    i := 1;
    Encontrado := False;
    Buscar := LowerCase(Modulo + ' ' + aModulo);
    while (I < aFname.Count) and (Fin = False) do
    begin
      Cadena := trim(LowerCase(aFname[i]));
      if Pos(Buscar, Cadena) = 1 then
        Encontrado := True;

      if Encontrado then
        Resultado.Add(aFname[i]);

      if (Pos('endmodule', Cadena) = 1) and (Encontrado = True) then
        Fin := True;

      Inc(i);
    end;
  finally
    Result := Resultado;
  end;
end;

function NombreModulo(const aModulo: string): string;
var
  I: Integer;
  ModuloAcual: TStringList;
  Cadena: String;
begin
  Result := '';
  ModuloAcual := TStringList.Create;
  ModuloAcual.Text:= aModulo;
  I := 0;
  While I < ModuloAcual.Count do
  begin
    Cadena := trim (upperCase(ModuloAcual[i]));
    if not (StartsText('!',Cadena)) then
    begin
      if WordCount(Cadena,[#32])=2 then
      begin
        if ExtractWord(1,Cadena,[#32]) = 'MODULE' then
        begin
          Cadena := ExtractWord(2,Cadena,[#32]);
          Cadena := ExtractWord(1,Cadena,['(']);
          Result := Cadena;
          I := ModuloAcual.Count;
        end;
      end;
    end;
    I := I+1;
  end;
  FreeAndNil(ModuloAcual);
end;

//Busca procediminetos o funciones que empiezen por un tipo de declaracion
//especificada en el parametro aTipo. Devuelve una lista con el nombre de las funciones
//encontradas en la Lista pasada en aFname
function BuscaProcTipo(const aFname: TStringList; const aTipo: string): TStringList;
var
  ListaProcs: TStringList;
  Tipo, Temp, Cadena: string;
  Hasta, //Indica donde acaba el nombre de la función a Extraer.
  I: integer;

begin
  Tipo := LowerCase(aTipo);
  Result := TStringList.Create;
  for I := 0 to aFname.Count - 1 do
  begin
    Cadena := aFname[i];
    Cadena := lowerCase(TrimLeft(Cadena));
    if Pos(Tipo, Cadena) = 1 then
    begin
      hasta := length(Cadena) - Length(Tipo);
      Temp := trim(Copy(Cadena, Length(Tipo) + 2, Hasta));
      Temp := ExtractDelimited(1,Temp,['(']);
     // RetiraParentesis(Temp);
      Result.Add(Temp);
    end;
  end;

end;
//Este procedimiento retira todos los parentesis que existan al final de una cadena
procedure RetiraParentesis(var aCadena: string);
var
  Fin: boolean;
  Caracter: string;
begin
  Fin := False;
  while (Fin = False) and (Length(aCadena) > 0) do
  begin
    Caracter := Copy(aCadena, Length(aCadena), 1);
    if (Caracter = '(') or (Caracter = ')') then
    begin
      aCadena := Copy(aCadena, 1, length(aCadena) - 1);
    end
    else
      Fin := True;
  end;
end;

{Esta función comprueba si el fichero pasasdo como parámetro (TStringList) es un
fichero Rapid Válido. Comprobando si contiene una cabecera válida.
Cabecera comprobada:
%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%
Las 4 primeras líneas tienen que contener ésta cabecera.
}
function EsFicheroRapid(const aTexto: TStringList): boolean;

begin
  Result := False;
  if aTexto.Count > 4 then //Si el fichero tiene 4 líneas puede ser un fichero rapid
  begin
    if (aTexto[0] = '%%%') and (aTexto[1] = '  VERSION:1') and
      (aTexto[2] = '  LANGUAGE:ENGLISH') and (aTexto[3] = '%%%') then
      Result := True;
  end;

end;

{
Esta función devuelve TRUE en el caso que la cadena pasada por el
parámetro aCadena, si es una orden de movimiento especificada por el parámetro
aMove, que es un array abierto de cadenas. En caso de ser un movimiento con un
punto declarado (P10 por ejemplo) se devuelte el nombre del punto por la variable
aNombrePunto, sino devuelve un asterisco si el punto no está declarado
Por el parámetro Valor, devucelve una cadena que contiene el la declaración del punto
en el caso que sea un asterisco. De lo contrario lo envia vacio

}
function EsOrdenMovimiento(const aCadena: string; const aMove: array of string;
  var aNombrePunto: string; var Valor: string): boolean;
var
  Cadena: string; //Cadena de uso general
  Move: string; //Cadena que contiene el movimiento analizado
  I: integer; //Contador de uso general
  posicioncoma: integer; //Indice que indica donde esta la coma
  Linea: string; //Contiene la linea actual
  Limitador: TLimitadores;
begin
  Valor := '';
  Limitador := [' '];
  //Recorremos el array de movimientos pasados como parámetros
  Result := False;
  //Cadena := upperCase(aCadena); //Ponemos en mayusculas
  //Cadena := TrimLeft(Cadena);  //Retiramos lo que sobre por la izquierda
  Cadena := TrimLeft(aCadena);
  for I := Low(aMove) to High(aMove) do
  begin
    Move := upperCase(aMove[I]);

    //Linea := PalabraEntera (Cadena,1,Limitador);
    //Linea := UpperCase(PalabraEntera(Cadena, 1, Limitador));
    Linea := (PalabraEntera(Cadena, 1, Limitador));

    if (uppercase(Move) = uppercase(Linea)) then
    begin
      //Eliminamos el nombre de la orden de movimiento, por ejemplo si
      //la línea es: MoveJ p20,v3000,z50,t_pinza\WObj:=wobjpieza
      //Se retira MoveJ

      Cadena := Copy(Cadena, (Length(Move) + 2), (Length(Cadena)));

      if not (Cadena[1] = '[') then //sino empieza por [ no tiene asterisco
      begin
        PosicionComa := Pos(',', Cadena);
        aNombrePunto := Copy(Cadena, 1, PosicionComa - 1);
        Result := True;
      end
      else
      begin
        aNombrePunto := '*';
        Valor := Cadena + ']]';
        Result := True;
      end; //Final del If Not (Cadena[1] = '[') Then

    end; //Final If Pos (Move,Cadena) = 1
  end; //Final del For  I := Low (aMove) To High (aMove) Do
end;


//Esta función busca las declaraciones de LoadData en el fichero pasado
// y devuelve la lista de nombres que ha encontrado
function BuscaToolData(const aFname: TStringList): TStringList;
var
  I: integer; //indice de uso general en bucles
  Lista: TStringList; //Lista de datos encontrados
  Cadena: string;
begin
  Lista := TStringList.Create;
  Lista.Clear;
  Result := Lista;
  //Recorremos el fichero de principio a fin
  for I := 0 to aFName.Count - 1 do
  begin
    Cadena := (TrimLeft(aFname[i]));
    Cadena := BuscaDato('PERS tooldata', Cadena);
    if Cadena <> '' then
    begin
      Lista.Add(Trim(Cadena));
    end;
  end;
  Result := lista;

end;

function CambiaAsterisco(const aLinea: string; Prefijo: string;
  Indice: integer; Incremento: integer; var aDefinicion: TStringList;
  var Siguiente: integer): string;
var
  Cadena,  //Cadena de uso general
  Orden,   // Contiene la orden de moviemiento Ej : MoveJ
  Final, //Contiene lo que hay en la línea después del asterisco
  Asterisco, Puntos, Nombre: string;
  Posicion, I, Numero: integer;
  Nombres: TStringList;

begin
  Nombres := TStringList.Create;
  Nombres.Clear;
  aDefinicion.Clear;
  // Retirar orden de movimiento
  Posicion := Pos(' ', UpperCase(trim(aLinea)));
  //Contiene la orden o instruccion de movimiento
  Orden := trim(Copy(aLinea, 1, Posicion));

  Cadena := Copy(aLinea, Posicion + 1, Length(aLinea));
  //Retirar el punto. El asterisco acaba con ]],

  Posicion := (Pos(']]', trim(Cadena)));
  //Mientras se siga encontrando ]], hay más declaraciones de puntos
  //debemos volver a crear otro astericos
  Numero := Indice;
  while Posicion > 0 do
  begin
    Asterisco := Copy(trim(Cadena), 1, Posicion + 1);
    if Pos(',', Asterisco) = 1 then
    begin
      Asterisco := RightStr(Asterisco, Length(Asterisco) - 1);
    end;
    Nombre := Prefijo + IntToStr(Numero);
    Nombres.Add(Nombre);
    Asterisco := Nombre + ':=' + Asterisco + ';';
    aDefinicion.Add(Asterisco);
    Numero := Numero + Incremento;
    Cadena := Copy(Trim(cadena), Posicion + 2, Length(Cadena));
    Posicion := (Pos(']]', Cadena));
  end;
  Siguiente := Numero;// Devuelve el número que debería llevar el siguiente punto
  Puntos := '';
  for  I := 0 to Nombres.Count - 1 do
  begin
    Puntos := Puntos + Nombres[I] + ',';
  end;
  Puntos := Copy(Puntos, 0, Length(Puntos) - 1);
  Final := Copy(Cadena, Posicion, Length(Cadena));
  Result := Orden + ' ' + Puntos + Final;
  FreeAndNil(Nombres);
end;

//Esta función busca las declaraciones de ToolData en el fichero pasado
// y devuelve la lista de nombres que ha encontrado
function BuscaLoadData(const aFname: TStringList): TStringList;

var
  I: integer; //indice de uso general en bucles
  Lista: TStringList; //Lista de datos encontrados
  Cadena: string;
begin
  Lista := TStringList.Create;
  Result := Lista;
  //Recorremos el fichero de principio a fin
  for I := 0 to aFName.Count - 1 do
  begin
    Cadena := (TrimLeft(aFname[i]));
    Cadena := BuscaDato('PERS loaddata', Cadena);
    if Cadena <> '' then
    begin
      Lista.Add(Trim(Cadena));
    end;
    Result := lista;
  end;
end;

function BuscaWobjData(const aFname: TStringList): TStringList;

var
  I: integer; //indice de uso general en bucles
  Lista: TStringList; //Lista de datos encontrados
  Cadena: string;
begin
  Lista := TStringList.Create;
  Result := Lista;
  //Recorremos el fichero de principio a fin
  for I := 0 to aFName.Count - 1 do
  begin
    Cadena := (TrimLeft(aFname[i]));
    Cadena := BuscaDato('PERS wobjdata', Cadena);
    if Cadena <> '' then
    begin
      Lista.Add(Trim(Cadena));
    end;
    Result := lista;
  end;
end;

function BuscaDato(const aTipoDato: string; var aLinea: string): string;
var
  cadena: string;
  N, M: integer;
begin
  Cadena := '';
  {Buscamos si tenemos la definicion de herramienta }
  N := Pos(aTipoDato, aLinea);
  {Además tienes que tener := para asegurarse que es una defincion, no
  párametro de una rutina}
  M := pos(':=', alinea);
  if (N > 0) and (M > 0) then
  begin
    Cadena := aLinea;
    Delete(Cadena, 1, Length(aTipoDato));
    N := Pos(':', Cadena);
    Cadena := Copy(cadena, 1, N - 1);

  end;
  Result := Cadena;
end;

function ListaRutinas(const aFName: TStringList): TStringList;

var
  I, J: integer;
  Cadena: string;
  Posicion: integer;
  Limites: TLimitadores;
  lsTemp: TStringList;
begin
  Result := TStringList.Create;
  Limites := ['('];
  for I := 0 to aFName.Count - 1 do
  begin

    for J := 0 to 3 - 1 do
    begin
      Cadena := Trim(AFName[i]);
      Posicion := Pos(DeclaraRutina[j], Cadena);
      if Posicion > 0 then
      begin
        //Retiramos el principio nos quedamos con la cadena
        //desde dónde está la declaración
        Cadena := Copy(Cadena, Posicion, Length(Cadena));
        // Buscamos un espacio
        //Posicion := Pos (' ',Cadena);
        //Sacamos el nombre
        Cadena := PalabraEntera(Cadena, 1, Limites);
        if Cadena <> '' then

          Result.Add(Cadena);

        Break;
      end;
    end;// Fnal del for J

  end; //Final del for I
  // Result := Result;
end;
//Esta función extrae una rutina
function ExtraerRutina(aFile: TStringList; aNombre: string): TStringList;
var
  I: integer;
  Cadena: string;
  Fin, FinRutina: boolean;
  Posicion: integer;
  //Rutina: TStringList;
begin

  Result := TStringList.Create;
  Fin := False;
  I := 0;
  while (Fin = False) and (I <= aFile.Count - 1) do
  begin
    Cadena := aFile[i];
    Posicion := Pos('proc '+LowerCase(Trim(aNombre)), LowerCase(trim(aFile[I])));
    if Posicion = 1 then
    begin
      Result.Add(aFile[i]);
      FinRutina := False;
      I := I + 1;
      while FinRutina = False do
      begin
        Cadena := UpperCase(Trim(aFile[i]));
        if (Cadena = 'ENDTRAP') or (Cadena = 'ENDPROC') or (Cadena = 'ENDFUNC') then
        begin
          FinRutina := True;
        end;
        Result.Add(Trim(aFile[i]));
        I := I + 1;
      end;  //while FinRutina = False do
      Fin := True;
    end;//final del If;
    Inc(I);
    if I >= aFile.Count then
    begin
      I := I + 1;

    end;
  end;//final del While
  //FreeAndNil(Result);
end;
//Esta función devuelve  true o falso según sea una rutina o no. Adenás
//por el parámetro aTipoRutina devuelve el tipo de rutina que es.
function EsRutina(aLinea: string; var aLocaL: boolean;
  var aTipoRutina: TipoRutina): boolean;
var
  stTipo, Cadena: string;
  I, Posicion: integer;
  Limite: TLimitadores;
  bEsRutina: boolean;
begin
  Limite := [];
  bEsRutina := False;
  aLocal := False;
  aTipoRutina := [];
  Cadena := UpperCase(Trim(aLinea));
  //Buscar declaración de rutinas que no sean locales
  for I := Low(DeclaraRutina) to High(DeclaraRutina) do
  begin

    Posicion := Pos(DeclaraRutina[i], Cadena);
    if Posicion = 1 then
    begin
      StTipo := PalabraEntera(Cadena, 0, Limite);
      if stTipo = 'PROC' then
        aTipoRutina := [PROC];
      if StTipo = 'FUNC' then
        aTipoRutina := [FUNC];
      if StTipo = 'TRAP' then
        aTipoRutina := [TRAP];
      bEsRutina := True;
    end;  //Final del IF Posiocion
    Posicion := Pos('LOCAL ' + DeclaraRutina[I], Cadena);
    if Posicion = 1 then
    begin
      StTipo := PalabraEntera(Cadena, Length('LOCAL '), Limite);
      if stTipo = 'PROC' then
        aTipoRutina := [PROC];
      if StTipo = 'FUNC' then
        aTipoRutina := [FUNC];
      if StTipo = 'TRAP' then
        aTipoRutina := [TRAP];
      aLocal := True;
    end;
  end; //Final del For I
  for I := Low(DeclaraRutina) to High(DeclaraRutina) do
    Result := bEsRutina;
end;
//Esta función extrae todo el contenido de la cabecera de un módulo
function CabeceraModulo(aModulo: TStringList): TStringList;
var
  Indice: integer;
  Cadena: string;
  stResultado: TStringList;
  Local: boolean;
  MiTipoRutina: TipoRutina;
begin
  Result := TStringList.Create;
  Result.Clear;
  Indice := 0;
  while Indice <= aModulo.Count - 1 do
  begin
    Cadena := UpperCase(Trim(aModulo[Indice]));
    if EsRutina(Cadena, Local, MiTipoRutina) then
      Indice := aModulo.Count
    else
      Result.Add(aModulo[Indice]);
    Inc(Indice);
  end; //Final de While
end;

function NombreModulo(aModulo: TStringList): string;
 {
 %%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE WQ2545EMBAL1
  ! Datos numericos l}
var
  Cadena: string;
  Linea, Posicion: integer;
begin
  Cadena := '';
  Linea := 0;
  try
    if aModulo[0] = '%%%' then
    begin
      Linea := 5;
    end;
    Cadena := (UpperCase(Trim(aModulo[Linea])));
    Posicion := Pos('MODULE', Cadena);
    if Posicion = 1 then
    begin
      Cadena := Copy(Cadena, Length('Module '), Length(Cadena));
    end;
  finally
    Result := Trim(Cadena);
  end;
end;

function NombreRutina(aRutina: TStringList): string;
var
  TipoFunc, Cadena: string;
  Fin, PosPROC, PosTrap: integer;
  Limite: TLimitadores;
begin
  Cadena := '';
  Result := Cadena;
  try
    Cadena := UpperCase(Trim(aRutina[0]));
    //PROC,FUNC,TRAP
    PosProc := Pos(DeclaraRutina[1], Cadena);
    PosTrap := Pos(DeclaraRutina[2], Cadena);
    if (PosProc > 1) or (PosTrap > 0) then
    begin
      Cadena := Copy(Cadena, 4, Length(Cadena));
    end
    else //Si es un funcion
    begin
      Cadena := Copy(Cadena, 4, Length(Cadena));
      Limite := [' '];
      TipoFunc := PalabraEntera(Cadena, 0, Limite);
      Limite := ['('];
      Fin := (Length(PalabraEntera(Cadena, 0, Limite)));
      Cadena := Copy(Cadena, Length(TipoFunc) + 1, Fin);
    end;

  finally
    Result := TRim(Cadena);
  end;
end;

function BuscaRobTarget(aFile: TStringList): TStringList;
var
  Posicion, I, J, K: integer;
  lsTemp: TStringList;
  Cadena: string;
begin
  try
    lsTemp := TStringList.Create;
    lsTemp.Clear;
    Cadena := '';
    for I := 0 to aFile.Count - 1 do
    begin
      Cadena := UpperCase(Trim(aFile[i]));
      for J := 0 to High(Ambito) do
      begin
        for K := 0 to High(DeclaraPunto) do
        begin
          Posicion := Pos(Ambito[j] + DeclaraPunto[K], Cadena);
          if Posicion = 1 then
            lsTemp.Add(Trim(aFile[i]));
        end;   //For K
      end; //For J
    end; // final  for I := 0 to aFile.Count - 1 do
  finally
    Result := lsTemp;
    //lsTemp.Free;

  end;

end;

end.
