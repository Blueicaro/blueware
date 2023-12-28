unit routines;
{
 Rapid Routines
}
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fgl;

{
 Object that constains a parameter of a  procedure or function
}


type

  { TParameterItem }

  TParameterItem = class

  private
    FAccessMode: string;
    FisArray: boolean;
    FMutuo: boolean;
    FOptional: boolean;
    FParamName: string;
    FTipo: string;
  public
    property Tipo: string read FTipo write FTipo;
    property ParamName: string read FParamName write FParamName;
    property switch: boolean read FOptional write FOptional;
    property AccessMode: string read FAccessMode write FAccessMode;
    property Mutuo: boolean read FMutuo write FMutuo;
    property isArray: boolean read FisArray write FisArray;
  end;

  TParameterList = specialize TFPGObjectList<TParameterItem>;


type

  { TRoutineItem }

  TRoutineItem = class
  private
    FLocaL: boolean;
    FParameters: TParameterList;
    FReturns: string;
    FroutineName: string;
    FTipo: string;
    FContenido: TStringList;
    procedure Procesar;
  public
    property Parameters: TParameterList read FParameters write FParameters;
    property Tipo: string read FTipo write FTipo;
    property Local: boolean read FLocaL write FLocaL;
    property Returns: string read FReturns write FReturns;
    property RoutineName: string read FroutineName write FRoutineName;
  public
    constructor Create;
    constructor Create(aLines: TStringList);
    destructor Destroy; override;
  end;

  TRoutineList = specialize TFPGObjectList<TRoutineItem>;


implementation

uses StrUtils;
  { TRoutineItem }
{ #note -oJorge : Programando }
procedure TRoutineItem.Procesar;
var
  I, SiguienteParte: integer;
  Cadena, Parte, stTemp: string;
  EsLocal: boolean;
begin
  for I := 0 to FContenido.Count - 1 do
  begin
    Cadena := Trim(FContenido[I]);
    if Length(Cadena) = 0 then
    begin
      Continue;
    end;
    if Cadena[1] = '!' then
    begin
      Continue;
    end;
    if WordCount(cadena, [#32]) = 0 then
    begin
      Continue;
    end;

    if ContainsText(Cadena, 'proc') or (ContainsText(Cadena, 'func')) or
      (ContainsText(Cadena, 'trap')) = False then
    begin
      Continue;
    end;

    SiguienteParte := 1;
    FLocaL := False;
    Parte := Trim(ExtractWord(SiguienteParte, Cadena, [#32]));
    if CompareText(parte, 'local') = 0 then
    begin
      FLocaL := True;
      SiguienteParte := 2;
    end;

    if ContainsText(Cadena, 'trap') then
    begin
      Parte := ExtractWord(SiguienteParte, Cadena, [#32]);
      FroutineName := Parte;
      Continue;
    end;
    if ContainsText(Cadena, 'func') then
    begin
      SiguienteParte := SiguienteParte + 1;
      Parte := ExtractWord(SiguienteParte, Cadena, [#32]);
      Returns := Parte;
      SiguienteParte := SiguienteParte + 1;
      Parte := ExtractWord(SiguienteParte, Cadena, [#32]);
      FroutineName := ExtractWord(1, Parte, ['(']);
      stTemp := ExtractWord(1, Parte, ['(']);
    end;
    if ContainsText(Cadena, 'proc') then
    begin
      ;
    end;
    Parte := trim(ExtractWord(SiguienteParte, Cadena, [#32]));

  end;
end;

constructor TRoutineItem.Create;
begin
  FContenido := TStringList.Create;
  FParameters := TParameterList.Create;
end;

constructor TRoutineItem.Create(aLines: TStringList);
begin
  Create;
  FContenido.Assign(aLines);
  Procesar;
end;

destructor TRoutineItem.Destroy;
begin
  FreeAndNil(FContenido);
  FreeAndNil(FParameters);
  inherited Destroy;
end;

end.
