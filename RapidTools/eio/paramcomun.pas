unit paramcomun;

{
Algunos datos, funciones y procedimientos comunes
 a todos las versiones de archivos de configuración
}
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  EEioError = class(Exception)
  end;

type

  TVersionEio = (vUnknow, vEio5, vEio6, vEio61, vEio7);

function GetEioVersion(aFile: TStringList): TVersionEio;
function GetEioVersion(FileName: TFileName): TVersionEio; overload;

function SeccionACadenas(aNombreSeccion: string; Datos: TStringList): TStringList;

function LineaAValores(aLinea: string): TStringList;

procedure LeerPropiedades(var aItem: TCollectionItem; aValues: TStringList);

procedure EscribirPropiedades(var aItem: TCollectionItem; var aLineas: TStringList);

implementation

uses  StrUtils, TypInfo;

function GetEioVersion(aFile: TStringList): TVersionEio;
var
  Cadena, Parte1, Parte2, Parte3, Parte4: string;
  ValorAlto, ValorBajo, Valor: longint;
  aVersion: TVersionEio;
  I: Integer;
begin
  aVersion := vUnknow;
  I := 0;
  if aFile.Count < 1 then
  begin
    Result := aVersion;
  end;
  Cadena := Trim(aFile[0]);
  if WordCount(Cadena, [':']) = 4 then
  begin
    Parte1 := ExtractDelimited(1, Cadena, [':']);
    Parte2 := ExtractDelimited(2, Cadena, [':']);
    Parte3 := ExtractDelimited(3, Cadena, [':']);
    Parte4 := ExtractDelimited(4, Cadena, [':']);
    if (Parte1 = 'EIO') and (Parte2 = 'CFG_1.0') then
    begin
      if (TryStrToInt(Parte3, ValorAlto)) and (TryStrToInt(Parte4, ValorBajo)) then
      begin
        Valor := ValorAlto * 10 + ValorBajo;
        case Valor of
          50:
            Result := vEio5;
          60:
            Result := vEio6;
          61:
            Result := vEio61;
            { #todo : Pendiente desarrollar para Rw7 }
            //70:

            //  Result := vEio7;
          else;
            Result := vUnknow;
        end;
      end;
      I := aFile.Count; //Forzar Salida
    end;
  end;
end;




function GetEioVersion(FileName: TFileName): TVersionEio;
var
  lsArchivo: TStringList;
begin
  lsArchivo := TStringList.Create;
  Result := vUnknow;
  try
    lsArchivo.LoadFromFile(FileName);
    Result := GetEioVersion(lsArchivo);
  finally
    FreeAndNil(lsArchivo);
  end;

end;

function SeccionACadenas(aNombreSeccion: string; Datos: TStringList): TStringList;
var
  I: integer;
  Cadena, linea: string;
  inicio: boolean;
begin
  Result := TStringList.Create;
  I := 0;
  Cadena := '';
  linea := '';
  inicio := False;
  while I < Datos.Count do
  begin
    cadena := Trim(Datos[I]);
    if (Cadena = '#') and (inicio = True) then
    begin
      Break;
      inicio := False;
    end;
    if (inicio = True) then
    begin
      Cadena := trim(Cadena);
      if (cadena <> '') then
      begin
        Cadena := trim(Cadena);
        RemoveTrailingChars(Cadena, ['\']);
        Linea := linea + #32 + Cadena;
      end
      else
      begin
        if linea <> '' then
        begin
          Result.Add(Linea);
          linea := '';
        end;
      end;
    end;

    if Cadena = aNombreSeccion then
    begin
      Inicio := True;
    end;
    I := I + 1;
  end;

end;

{ Algunas nombres de propiedades coinciden con palabras reservas de Pascal
  Por eso hay que cambiarlas. Además se limpian caracteres no necesarios}
function ValidarNombre(aNombre: string): string;
begin
  case aNombre of
    'Label':
      Result := 'IdenficationLabel';
    else
      Result := aNombre;
  end;
end;

 {Los nombres de las propiedades que fueron cambiados por coincidir
  con palabras reservadas de pascal son devuelvo}
function PropiedadANombre(aPropiedad: string): string;
begin
  case aPropiedad of
    'IdenficationLabel':
      Result := 'Label';
    else
      Result := aPropiedad;
  end;
end;

{Limpia caracteres innecesarios}
function LimpiarValor(aValor: string): string;
var
  Cadena: string;
begin
  Cadena := Trim(aValor);
  RemovePadChars(Cadena, ['\', '"', '#']);
  Result := Cadena;
end;

function LineaAValores(aLinea: string): TStringList;
var
  I: integer;
  Cadena, stemp, Parte1, Parte2: string;
begin
  Result := TStringList.Create;
  Result.NameValueSeparator := #32;
  Cadena := Trim(aLinea);
  for I := 1 to WordCount(Cadena, ['-']) do
  begin
    stemp := trim(ExtractWord(I, Cadena, ['-']));
    if WordCount(sTemp, [#32]) < 2 then
    begin
      stemp := ValidarNombre(stemp) + #32;
    end
    else
    begin
      Parte1 := Trim(ExtractWord(1, stemp, [#32]));
      Parte1 := ValidarNombre(Parte1);
      Parte2 := (ExtractWord(2, stemp, [#32]));
      RemovePadChars(Parte2, ['"']);
      sTemp := Parte1 + #32 + Parte2;
    end;
    Result.Add(sTemp);
  end;
end;

procedure LeerPropiedades(var aItem: TCollectionItem; aValues: TStringList);
var
  I: integer;
  NombrePropiedad, Valor: string;
  Info: PPropInfo;
  tipo: TTypeKind;
begin
  for I := 0 to aValues.Count - 1 do
  begin
    NombrePropiedad := aValues.Names[I];
    Valor := aValues.ValueFromIndex[I];
    if NombrePropiedad <> '' then
    begin
      Info := GetPropInfo(aItem, NombrePropiedad);
      tipo := PropType(aItem, NombrePropiedad);
      if Info <> nil then
      begin
        Valor := LimpiarValor(Valor);
        if Valor <> '' then
        begin
          SetPropValue(aItem, Info, Valor);
        end
        else
        begin
          if PropType(aItem, NombrePropiedad) = tkBool then
          begin
            SetPropValue(aItem, info, True);
          end;
        end;
      end;
    end;

  end;

end;


procedure EscribirPropiedades(var aItem: TCollectionItem; var aLineas: TStringList);
var
  Cadena, NombrePropiedad: string;
  PropListPtr: PPropList;
  propCount, i: integer;
  TipoPropiedad: TTypeKind;
  lsTemp: TStringList;
begin
{
    Más información sobre GetPropList:
    https://forum.lazarus.freepascal.org/index.php/topic,62090.0.html?PHPSESSID=f849bpqulvspm369clvt94v6m7
}
  Cadena := '';
  lsTemp := TStringList.Create;
  propCount := GetPropList(aItem.ClassType, PropListPtr);
  if propCount > 0 then
  begin
    try
      for i := 0 to propCount - 1 do
      begin
        NombrePropiedad := PropListPtr^[I]^.Name;
        TipoPropiedad := PropType(aItem, NombrePropiedad);
        case TipoPropiedad of
          tkAString: begin
            Cadena := GetStrProp(aItem, NombrePropiedad);
            if Cadena <> '' then
              lsTemp.Add('-%s "%s"', [NombrePropiedad, Cadena]);
          end;
          tkBool: if {%H-}GetPropValue(aItem, NombrePropiedad) then
              lsTemp.Add('-%s ', [NombrePropiedad]);
        end;
      end;
      if lsTemp.Count > 1 then
      begin
        Cadena := lsTemp[0];
        for  I := 1 to lsTemp.Count - 1 do
        begin
          if (Length(lsTemp[I]) + Length(Cadena)) > 80 then
          begin
            aLineas.Add(Cadena + '\');
            Cadena := lsTemp[I];
          end
          else
          begin
            Cadena := Cadena + #32 + lsTemp[I];
          end;
        end;
      end;
      aLineas.AddStrings(Cadena);
    finally
      Freemem(PropListPtr);
      FreeAndNil(lsTemp);
    end;
  end;
end;


end.
