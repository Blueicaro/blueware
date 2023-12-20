{ Unidad que contiene rutinas utiles para la gestión de cadenas

  6-6-2005 Añadida funcion para redondear números float y devolverlos como
           cadenas. Obtenida de  http://www.q3.nu/trucomania/truco.cgi?101&esp
           Reformada la version original, se cambia el tipo Real a Single
  6-5-2004 Versión 1.12 Corregido un bug en la función PalabraEntera, cuando
           se pasaba una cadena vacía, dada un error de excepción, ahora
           devuelve una cadena vacía.  
  22-4-2004 Versión 1.11 Corregidos bug de  la función PalabraEntera, cuando
            el caracter de inicio era 1, fallaba y devolvía la cadena sin limpiar
  16-4-2004; Versión 1.1
    Añadida la función NombreSinExt
    
  12-03-2004 Version 1.0
  (C) Jorge Turiel Fernández
}
unit CadenasUtiles;

interface

uses SysUtils;
Type
  TLimitadores = Set of Char;
{Esta función devuelve una palabra entera buscada dentro de una cadena,
 apartir de una posición indica. Por ejemplo si se pasa esta cadena:
 Erase una vez en la mancha
 y como indice 23, la función devolvera mancha. El limitador solo se usa para
 encontrar el final}
Function PalabraEntera (Const aTexto:String; Const aIndice : Integer;
                        Var aLimitador: TLimitadores):String;

{Esta rutina recibe el nombre de un fichero con ruta o sin ruta y devuelve el
nombre del fichero sin extensión}
Function NombreSinExt (Var aNombreFich: String): String;

{ 


Esta funcion Redondea Numeros reales segun la cantidad de decimales y el tipo
de redondeo (Truncado o Simetrico) que le pasemos por parametro.
Devuelve un String porque yo la uso para visualizar los numero en un String
pero se puede convertir el String a Float si es necesario.   }


Function Redondeos(Var Numero: single; Cant: Integer; TipoRedondeo: Char): String;

implementation
Function  PalabraEntera (Const aTexto:String; Const aIndice : Integer;
                        Var aLimitador: TLimitadores):String;
Var
 i : Integer; // Contador temporal
 Fin, //Contiene el indice donde acaba la palabra
 Inicio : Integer; //Contiene el indice donde empieza la palabra
 Resultado : String;
Begin
 If (aTexto = '') Then
 Begin
   Result := '';
   Exit;
 end;
 Fin := 0;
 Inicio := aIndice;
 Result := Resultado;
 If aLimitador = [] Then System.Include (aLimitador,' ');
 //Si el indice pasado es 1, estamos al principio de la cadena, por lo cual
 //no  buscamos principio, sino empezamos buscando el principio.
 If aIndice = 1 Then
 Begin
    I := aIndice;
    { TODO : Cambio I >= 0 por I>0 }
    While I > 0 DO
    Begin
        If aTexto[I] = ' ' Then
        Begin
          Inicio := I+1; //Se anota donde empieza la palabra mas uno, por
                        //la posición actual es un espacio
          I := -1;  //Forzamos el indice I a -1 para salir del bucle
        End;
        Dec(I);
    end;
 end; //Final de IF aIndice <> 0
 I := aIndice;
 While I <= Length (aTexto) Do
 Begin
    //Si el caracter actual está dentro del conjunto de delimitadores
    If aTexto[i] in aLimitador Then
    Begin
       Fin := I-1; //Se anota donde acaba la palabra menos uno, porque la
                   //posición actual es un delimitador
       I := Length (aTexto) +1; //Forzamos la salida cambiando el indice
    end;
    Inc(i);
 end; //Final del While I <= Lenght (atexto)
 IF Inicio = 1 Then
 Begin
  Resultado := Copy (aTexto,Inicio,Fin-(Inicio)+1); //Sumanos uno para obtener el final real
 end
 Else
 Begin
  Resultado := Copy (aTexto,Inicio,Fin-(Inicio)+1); //Sumanos uno para obtener el final real
 end;
 Result := Resultado;
end;
Function NombreSinExt (Var aNombreFich: String): String;
Var
  Cadena : String; //Cadena de uso general
Begin
   Cadena := ExtractFileName(aNombreFich); //Extrae el nombre del fichero
   Cadena := Copy (Cadena,0,Length(Cadena)-4); //Extrae la extensión.
   Result := Cadena;
end;


 Function Redondeos(Var Numero: single; Cant: Integer; TipoRedondeo: Char): String;
 var
   Formato: String;
   j: Integer;
 Begin
 // 'S' o 's' significa Redondeo Simétrico, de lo contrario es Truncado.
   if (TipoRedondeo = 's') or (TipoRedondeo = 'S') then
   Begin
     if Cant = 0 then
       Formato := '0'
     else
       Formato := '0.';
     for j:=1 to Cant do
     begin
       Formato := Formato + '0';
     end;
     Result := FormatFloat(Formato,Numero);
   End
   Else
   Begin
     Result := Copy(FloattoStr(Numero),1,Pos(',',FloattoStr(Numero))-1) + Copy(FloattoStr(Numero),Pos(',',FloattoStr(Numero)),Cant+1);
   End;
 End;

 //Function CambioPuntos
end.
