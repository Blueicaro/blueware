unit Rapid;

{
18/08/2018
          Se añaden propiedades a RobTarget. Ahora continen nombre, tipo, Local
          Pendiente resto de los tipos de datos.
}
{10/10/2017
           En el dato TPos, se añade el procedimiento para realizar un desplazamiento. Recibe 3 parámetros, que son
           los valores que se sumaran a a las coordenadas X,Y,Z que forman el TPos
           procedure OffSet(DX, DY, DZ: extended);
           Añadido Función PosToCadena
           Añadido Función TrasToCadena
           Añadido función ConfToCadena
           Añadido función ExtJointToCadena}
{7/6/2016}
{21/03/2016 Datos Robtarget añadido
07/12/2017 Corrección de bug en la función StrToRobtarget, si se pasaba la cadena sin
:= no convertia bien. Ahora comprueba si al principio tiene doble corchete}
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, strutils;

type
  Tbool = class
  private
    fValor: boolean;
  public
    property Valor: boolean read fValor write fValor;
  end;

type

  { TConfdata }

  TConfdata = class
  private
    Fcf1: string;
    Fcf4: string;
    Fcf6: string;
    Fcfx: string;
  protected
    procedure fStrToConfData(aString: string);
  published
    property cf1: string read Fcf1 write Fcf1;
    property cf4: string read Fcf4 write Fcf4;
    property cf6: string read Fcf6 write Fcf6;
    property cfx: string read Fcfx write Fcfx;
    property StrToConfData: string write fStrToConfData;
  public
    function ConfToCadena: string;
  end;

type

  { Textjoint }

  Textjoint = class
  private
    Feax_a: string;
    Feax_b: string;
    Feax_c: string;
    Feax_d: string;
    Feax_e: string;
    Feax_f: string;
  protected
    procedure fStrToExtjoint(aString: string);
  published
    property eax_a: string read Feax_a write Feax_a;
    property eax_b: string read Feax_b write Feax_b;
    property eax_c: string read Feax_c write Feax_c;
    property eax_d: string read Feax_d write Feax_d;
    property eax_e: string read Feax_e write Feax_e;
    property eax_f: string read Feax_f write Feax_f;
    property StrToExtJoint: string write fStrToExtjoint;
  public
    function ExtJointToCadena: string;
  end;


type

  { TOrient }

  TOrient = class
  private
    FQ1: string;
    FQ2: string;
    FQ3: string;
    FQ4: string;
  protected
    procedure fstrToOrient(aString: string);
  published
    property Q1: string read FQ1 write FQ1;
    property Q2: string read FQ2 write FQ2;
    property Q3: string read FQ3 write FQ3;
    property Q4: string read FQ4 write FQ4;
    property StrToOrient: string write fStrToOrient;
  public
    function OrientACadena: string;
  end;

type

  { TPos }

  TPos = class
  private
    FX: string;
    FY: string;
    FZ: string;
    procedure fStrToPos(aString: string);
  public
    property X: string read FX write FX;
    property Y: string read FY write FY;
    property Z: string read FZ write FZ;
    property strToPos: string write fStrToPos;
    procedure OffSet(DX, DY, DZ: extended);
    function PosACadena: string;
  end;

type

  { TPose }

  TPose = class
  private
    FQ1: string;
    FQ2: string;
    FQ3: string;
    FQ4: string;
    FX: string;
    FY: string;
    FZ: string;
  protected
    procedure fStrToPose(aString: string);
  published
    property X: string read FX write FX;
    property Y: string read FY write FY;
    property Z: string read FZ write FZ;
    property Q1: string read FQ1 write FQ1;
    property Q2: string read FQ1 write FQ2;
    property Q3: string read FQ1 write FQ3;
    property Q4: string read FQ1 write FQ4;
    property StrToPose: string write fStrToPose;
  public
    function PoseACadena: string;
  end;

type

  { TLoadData }

  TLoadData = class(TCollectionItem)
  private
    Faom: TOrient;
    Fcog: TPos;
    FMasa: integer;
  published
    property Masa: integer read FMasa write FMasa;
    property cog: TPos read Fcog write Fcog;
    property aom: TOrient read Faom write Faom;
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
  end;

type

  { TRobTargetData }

  TRobTargetData = class(TCollectionItem)
  private
    FConfData: TConfdata;
    Fextax: Textjoint;
    FLocal: boolean;
    FNombre: string;
    FRot: TOrient;
    FTipo: string;
    FTrans: TPos;
    // procedure fStrToRobTarget(astring: string);
  published
    property Trans: TPos read FTrans write FTrans;
    property Rot: TOrient read FRot write FRot;
    property ConfData: TConfdata read FConfData write FConfData;
    property extax: Textjoint read Fextax write Fextax;
    property Nombre: string read FNombre write FNombre;
    property Tipo: string read FTipo write FTipo;
    property Local: boolean read FLocal write FLocal;

  public
    procedure fStrToRobTarget(astring: string);
    // property StrToRobTarget: string write fStrToRobTarget;
    function RobTargerToStringEx: string;
    function RobTargetToString: string;
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
  end;

type

  { TLoadDataList }

  TLoadDataList = class(TCollection)

  private
    function GetItem(Index: integer): TLoadData;
  public
    function Add: TLoadData;
    property GetLoadDataItem[Index: integer]: TLoadData read GetItem;
  end;

type

  { TRobTargetDataList }

  TRobTargetDataList = class(TCollection)
  private
    function GetItem(Index: integer): TRobTargetData;
  public
    function Add: TRobTargetData;
    property Item[Index: integer]: TRobTargetData read GetItem;
    property GetRobTargetDataItem[Index: integer]: TRobTargetData read GetItem;
    function GetRobotTarget(aNombre: string; var RobTarget: TRobTargetData): integer;
    function FindRobTarget(Nombre: string; Var index:integer): Boolean;
  end;

implementation

{Recibe una cadena del tipo [aa,bb,c] sin los corchetes y en un TStringList,
dónde cada elemento seria lo que hay entre los corchetes sin las comillas:
Elemento 0 = aa
Elemento 1 = bb
Elemento 2 = c
}
function LimpiarCorchetes(aCadena: string; var Lista: TStringList): boolean;
var
  Cadena: string;
  P: SizeInt;
begin
  Lista.Clear;
  Result := False;
  Cadena := aCadena;
  P := Pos('[', Cadena);
  if P <> 1 then
  begin
    Exit;
  end;
  P := Length(Cadena);
  P := Pos(']', Cadena);
  if P <> Length(Cadena) then
  begin
    exit;
  end;
  Cadena := Copy(Cadena, 2, Length(Cadena) - 2);
  Lista.DelimitedText := ',';
  Lista.CommaText := Cadena;
  Result := True;

end;

{ TConfdata }

procedure TConfdata.fStrToConfData(aString: string);
var
  lsTemp: TStringList;
begin
  { TODO : Colocar Excepciones }
  lsTemp := TStringList.Create;
  if LimpiarCorchetes(aString, lsTemp) = False then
  begin
    Exit;
  end;
  if lsTemp.Count <> 4 then
  begin
    exit;
  end;
  Fcf1 := lsTemp[0];
  Fcf4 := lsTemp[1];
  Fcf6 := lsTemp[2];
  Fcfx := lsTemp[3];
  FreeAndNil(lsTemp);
end;

function TConfdata.ConfToCadena: string;
begin
  Result := Format('[%S,%S,%S,%S]', [Fcf1, Fcf4, Fcf6, Fcfx]);
end;

{ Textjoint }

procedure Textjoint.fStrToExtjoint(aString: string);
var
  lsTemp: TStringList;
begin
  { TODO : Colocar excepciones }
  //[150,9E+09,9E+09,9E+09,9E+09,9E+09]
  lsTemp := TStringList.Create;
  if LimpiarCorchetes(aString, lsTemp) = False then
  begin
    Exit;
  end;
  if lsTemp.Count <> 6 then
  begin
    Exit;
  end;
  Feax_a := lsTemp[0];
  Feax_b := lsTemp[1];
  Feax_c := lsTemp[2];
  Feax_d := lsTemp[3];
  Feax_e := lsTemp[4];
  Feax_f := lsTemp[5];
  FreeAndNil(lsTemp);
end;

function Textjoint.ExtJointToCadena: string;
begin
  Result := Format('[%S,%S,%S,%S,%S,%S]', [Feax_a, Feax_b, Feax_c,
    Feax_d, Feax_e, Feax_f]);
end;

{ TOrient }

procedure TOrient.fstrToOrient(aString: string);
var
  lsTemp: TStringList;
begin
  { TODO : Poner Excepciones }
  //[0,0,0,0];
  lsTemp := TStringList.Create;
  if LimpiarCorchetes(aString, lsTemp) = False then
  begin
    Exit;
  end;
  if lsTemp.Count <> 4 then
  begin
    exit;
  end;
  Q1 := lstemp[0];
  Q2 := lsTemp[1];
  Q3 := lsTemp[2];
  Q4 := lsTemp[3];
  FreeAndNil(lsTemp);
end;

function TOrient.OrientACadena: string;
begin
  Result := Format('[%S,%S,%S,%S]', [FQ1, FQ2, FQ3, FQ4]);
end;

{ TPose }

procedure TPose.fStrToPose(aString: string);
begin
  { TODO : Por hacer. Es un dato trans + un orient }
end;

function TPose.PoseACadena: string;
begin
  { TODO -cTPose : Por hacer }
  Result := '';
end;

{ TPos }

procedure TPos.fStrToPos(aString: string);
var
  lsTemp: TStringList;
begin
  { TODO : Colocar Excepciones }
  //[11,11,11]
  lsTemp := TStringList.Create;
  if LimpiarCorchetes(aString, lsTemp) = False then
  begin
    exit;
  end;

  //Comprobar si son 3 elementos
  if lsTemp.Count <> 3 then
  begin
    { TODO : Colocar excepción }
    Exit;
  end;
  FX := lsTemp[0];
  FY := lsTemp[1];
  FZ := lsTemp[2];
  FreeAndNil(lsTemp);
end;

procedure TPos.OffSet(DX, DY, DZ: extended);
var
  Formato: TFormatSettings;
  EX, EY, EZ: extended;
begin
  Formato := FormatSettings;
  FormatSettings.DecimalSeparator := '.';
  try
    EX := StrToFloat(FX);
    EY := StrToFloat(FY);
    EZ := StrToFloat(FZ);
    EX := EX + DX;
    EY := EY + DY;
    EZ := EZ + DZ;
    FX := FloatToStr(EX);
    FY := FloatToStr(EY);
    FZ := FloatToStr(EZ);
  finally
    FormatSettings := Formato;
  end;

end;

function TPos.PosACadena: string;
begin
  Result := Format('[%S,%S,%S]', [FX, FY, FZ]);
end;

{ TRobTargetDataList }

function TRobTargetDataList.GetItem(Index: integer): TRobTargetData;
begin
  Result := inherited Items[Index] as TRobTargetData;
end;

function TRobTargetDataList.Add: TRobTargetData;
begin
  Result := inherited Add as TRobTargetData;
end;

function TRobTargetDataList.GetRobotTarget(aNombre: string;
  var RobTarget: TRobTargetData): integer;
var
  I: integer;
  R: TRobTargetData;
  Cadena: string;
begin

  Result := -1;
  if (aNombre = '') then
  begin
    Exit;
  end;
  i := 0;
  while I < Self.Count do
  begin
    R := GetItem(I);
    Cadena := r.Nombre;
    if CompareText(R.Nombre, aNombre) = 0 then
    begin
      Result := I;
      RobTarget := R;
      I := Self.Count;
    end;
    I := I + 1;

  end;

end;

function TRobTargetDataList.FindRobTarget(Nombre: string; var index: integer
  ): Boolean;
var
  i: integer;
begin
  Result := False;
  i := 0;
  while I < Count - 1 do
  begin
    if CompareText(Self.Item[I].Nombre, Nombre) = 0 then
    begin
      index := I;
      Exit(True)
    end;
    I := I +1;
  end;

end;

{ TRobTargetData }

procedure TRobTargetData.fStrToRobTarget(astring: string);
var
  lsTemp: TStringList;
  P, Elementos: SizeInt;
  Cadena, stTemp, Cabecera: string;
begin
  //[[860.325,313.451,299.57],[0.22747,-0.626972,-0.316036,-0.674748],[-1,-1,-2,0],[150,9E+09,9E+09,9E+09,9E+09,9E+09]]
  { TODO : Colocar excepciones }
  { TODO : Si los datos de la cadena no son completos. Falla. Se queda en un blucle infinito }
  lsTemp := TStringList.Create;
  Cadena := trim(aString);

  if Cadena[Length(Cadena)] = ';' then
  begin
    Cadena := Copy(Cadena, 1, length(Cadena) - 1);
  end;
  //Quitar ultimo corchete doble
  Cadena := Copy(Cadena, 1, Length(Cadena) - 1);

  P := Pos(':=', Cadena);
  if P > 0 then
  begin
    Cabecera := Copy(Cadena, 1, P - 1);
    Cadena := Copy(Cadena, P + 3, Length(Cadena));
  end
  else
  begin
    { TODO : Introducir excepción }
  end;
  //Procesar Cabecera
  if Length(Cabecera) > 1 then
  begin
    Cabecera := Trim(Cabecera);
    Elementos := WordCount(Cabecera, [' ']);
    FNombre := ExtractWord(Elementos, Cabecera, [#32]);
    FTipo := ExtractWord(Elementos - 2, Cabecera, [#32]);
    if Elementos = 4 then
    begin
      FLocal := True;
    end;
  end;
  P := Pos('[[', Cadena);
  if P = 1 then
  begin
    Cadena := Copy(Cadena, 2, Length(Cadena));
  end;
  while Length(Cadena) > 0 do
  begin
    P := Pos(']', Cadena);
    if P > 0 then
    begin
      stTemp := Copy(Cadena, 1, P);
      lsTemp.Add(stTemp);
      Cadena := Copy(Cadena, P + 2, Length(Cadena));
    end;
  end;
  //N := lsTemp.Count;
  if lsTemp.Count <> 4 then
  begin
    exit;
  end;
  FTrans.strToPos := lsTemp[0];
  FRot.StrToOrient := lsTemp[1];
  FConfData.StrToConfData := lsTemp[2];
  Fextax.StrToExtJoint := lsTemp[3];
  FreeAndNil(lsTemp);
end;

function TRobTargetData.RobTargerToStringEx: string;
var
  Cadena: string;
begin
  Cadena := '';
  if Self = nil then
    Exit;
  if Self.Local then
  begin
    Cadena := 'LOCAL ';
  end;
  Cadena := Cadena + Self.Tipo + #32 + 'ROBTARGET ' + Self.Nombre +
    ':=' + Self.RobTargetToString;
  Result := Cadena;
end;

function TRobTargetData.RobTargetToString: string;
var
  Cadena: string;
begin
  //[[860.325,313.451,299.57],[0.22747,-0.626972,-0.316036,-0.674748],[-1,-1,-2,0],[150,9E+09,9E+09,9E+09,9E+09,9E+09]]
  Cadena := '[' + FTrans.PosACadena + ',' + FRot.OrientACadena + ',' +
    FConfData.ConfToCadena + ',' + Fextax.ExtJointToCadena + ']';
  Result := Cadena;
end;


constructor TRobTargetData.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FTrans := TPos.Create;
  FRot := TOrient.Create;
  FConfData := TConfdata.Create;
  Fextax := Textjoint.Create;

end;

destructor TRobTargetData.Destroy;
begin
  FreeAndNil(FTrans);
  FreeAndNil(FRot);
  FreeAndNil(FConfData);
  FreeAndNil(Fextax);
  inherited Destroy;
end;

{ TLoadData }

constructor TLoadData.Create(ACollection: TCollection);
begin
  Fcog := TPos.Create;
  Faom := TOrient.Create;
  inherited Create(ACollection);
end;

destructor TLoadData.Destroy;
begin
  FreeAndNil(Faom);
  FreeAndNil(Fcog);
  inherited Destroy;
end;

{ TLoadDataList }

function TLoadDataList.GetItem(Index: integer): TLoadData;
begin
  Result := inherited Items[Index] as TLoadData;
end;

function TLoadDataList.Add: TLoadData;
begin
  Result := inherited Add as TLoadData;
end;

end.
