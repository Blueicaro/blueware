unit Comun;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;



function RellenaCampo(Origen, Campo: string): string;

implementation

 {Esta rutina recibe una cadena, y un campo, a buscar, por ejemplo:
  Origen: -Name "All"
  Nombre : Name
  Y si en la cadena origen está Name, guarda el valor ALL en Nombre }

function RellenaCampo(Origen, Campo: string): string;
var
  P: longint;
  Cadena: string;
begin
  // Result := '';
  Cadena := Trim(Origen);
  P := Pos(Campo, Cadena);
  if P < 1 then
  begin
    Result := '';
    Exit;
  end;
  //Extraer a continuación del nombre encontrado
  Cadena := Trim(Copy(Cadena, (P + Length(Campo)), Length(Cadena)));

  //Buscar una comillas seguidas de un espacio . Ahí es dónde termina la definición
  P := Pos('" ', Cadena);

  //Si no hay espacio, comprobar si hay un \
  if P < 1 then
  begin
    P := (Pos('\', Cadena));
    //Si encuentra una \ antes debe haber unas " así que retroceder uno
    Dec(P);
  end;
  //Si encontró algo lo cogemos, sino es que es el final de la cadena;
  if P > 0 then
  begin
    Cadena := Copy(Cadena, 0, (P));
  end;
  //Quitar comillas dobles al principio y final de la cadena
  if Length(Cadena) > 0 then
  begin
    if Cadena[1] = '"' then
    begin
      Cadena := Copy(Cadena, 2, (Length(Cadena) - 2));
    end;
  end;
  Result := Cadena;
end;



end.
