unit ivalidador;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { iRapidIdentifiers }

  iRapidIdentifiers = class
  private
    FListaErrores: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    function IdentificadorValido: boolean; virtual; abstract;
    function ListaErrores:TStringList;virtual; abstract;
  end;

type

  { RapidIdentificador }

  { TRapidIdentificadorV6 }

  TRapidIdentificadorV6 = class(iRapidIdentifiers)
  private
    FValido: boolean;
    FRegularExpresion: string;
  public
    constructor Create(Idenficador: string);
    destructor Destroy; override;
    function IdentificadorValido: boolean; override;
    function ListaErrores: TStringList; override;

  end;

implementation

uses RegExpr;

{ iRapidIdentifiers }

constructor iRapidIdentifiers.Create;
begin
  FListaErrores := TStringList.Create;
end;

destructor iRapidIdentifiers.Destroy;
begin
  FreeAndNil(FListaErrores);
  inherited Destroy;
end;

{ TRapidIdentificadorV6 }

constructor TRapidIdentificadorV6.Create(Idenficador: string);
var
  RegObj: TRegExpr;
begin
  inherited Create;
  Self.FValido := False;
  FRegularExpresion := '\D\w+';
  RegObj := TRegExpr.Create(FRegularExpresion);
  try
    if Idenficador.Length = 0 then
    begin
      FListaErrores.Add('El indentificador no puede estar vacio');
    end;
    if Idenficador.Length > 32 then
    begin
      FListaErrores.Add('La longuitud es mayor de 32 caracteres');
    end;
    if RegObj.Exec(Idenficador) = False then
    begin
      FListaErrores.Add('No se cumplen las reglas de definición:');
      FListaErrores.Add('El identificador debe empezar por una letra');
      FListaErrores.Add('Solo puede contener letras y número y guión bajo');
    end;
  finally
    FValido := FListaErrores.Count = 0;
    FreeAndNil(RegObj);
  end;
end;

destructor TRapidIdentificadorV6.Destroy;
begin
  inherited Destroy;
end;

function TRapidIdentificadorV6.IdentificadorValido: boolean;
begin
  Result := FListaErrores.Count=0;
end;

function TRapidIdentificadorV6.ListaErrores: TStringList;
begin

  Result:=(FListaErrores);
end;

  { RapidIdentificador }


end.
