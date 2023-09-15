unit DatosKuka;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  Te6pos = record
    X: string;  //Coordenada X
    Y: string;  //Coordenada Y
    Z: string;  //Coordenada Z
    A: string;  //Rotación
    B: string;  //Rotación
    C: string;  //Rotación
    S: string;  //Configuración de ejes
    T: string;  //Configuración de ejes
    E1: string;  //Valor eje externo 1
    E2: string;  //Valor eje externo 2
    E3: string;  //Valor eje externo 3
    E4: string;  //Valor eje externo 4
    E5: string;  //Valor eje externo 5
    E6: string;  //Valor eje externo 6
  end;

type

  { Te6posItem }

  Te6posItem = class(TCollectionItem)
  private
    FE6pos: Te6pos;
    FNombre: string;
  public
    procedure Assign(Source: TPersistent); override;
    property E6pos: Te6pos read FE6pos write FE6pos;
    function E6PosItemToString: string;
  published
    property Nombre: string read FNombre write FNombre;

  end;

type

  { Te6posList }

  Te6posList = class(TCollection)
  private
    function GetItems(Index: integer): Te6posItem;
    procedure SetItems(Index: integer; AValue: Te6posItem);
  public
    procedure LoadFromFile(aFileName: TFileName);
    property Items[Index: integer]: Te6posItem read GetItems write SetItems; default;
    function Add: Te6posItem;
    function FindItemByName(aName: string): Te6posItem;
  end;

implementation

uses StrUtils;

{ Te6posItem }

procedure Te6posItem.Assign(Source: TPersistent);
begin
  if Source is Te6posItem then
  begin
    FNombre:=Te6posItem(Source).FNombre;
    FE6pos := Te6posItem(Source).FE6pos;
  end
  else
  begin
    inherited Assign(Source);
  end;
end;

function Te6posItem.E6PosItemToString: string;
var
  Cadena: string;
begin
  //DECL E6POS XC1={X 1001.90088,Y -24.1122284,Z 377.482880,A -90.5389252,B 0.819119334,C 179.817444}
  Cadena := Format('DECL E6POS %S ={X %S,Y %S,Z %S,A %S,B %S,C %S',
    [FNombre, E6pos.X, E6pos.Y, E6pos.Z, E6pos.A, E6pos.B, E6pos.C]);

  if (E6pos.S <> '') and (E6pos.T <> '') then
  begin
    Cadena := Cadena + Format(',S %S,T %S', [E6pos.S, E6pos.T]);
    if (E6pos.E1 <> '') then
    begin
      Cadena := Cadena + Format(',E1 %S,E2 %S,E3 %S,E4 %S,E5 %S,E6 %S',
        [E6pos.E1, E6pos.E2, E6pos.E3, E6pos.E4, E6pos.E5, E6pos.E6]);
    end;
  end;
  Cadena := Cadena + '}';
  Result := Cadena;
end;

{ Te6posList }

function Te6posList.GetItems(Index: integer): Te6posItem;
begin
  Result := Te6posItem(inherited Items[Index]);
end;

procedure Te6posList.SetItems(Index: integer; AValue: Te6posItem);
begin
  items[Index].Assign(AValue);
end;

//DECL E6POS XC1={X 960.546265,Y -212.600601,Z 366.712463,A -90.7945251,B 1.12607253,C 179.719040}
procedure Te6posList.LoadFromFile(aFileName: TFileName);
var
  lsFichero: TStringList;
  I, X: integer;
  Cadena, Parte, Nombre: string;
  Punto: Te6posItem;
begin
  Self.Clear;
  lsFichero := TStringList.Create;
  try
    lsFichero.LoadFromFile(aFileName);
    for I := 0 to lsFichero.Count - 1 do
    begin
      Cadena := Trim(lsFichero[I]);
      if Pos('DECL E6POS ', Cadena) = 1 then
      begin
        if WordCount(Cadena, ['=']) = 2 then
        begin
          //Extraer Nombre
          Nombre := ExtractWord(1, Cadena, ['=']);
          Nombre := ExtractWord(3, Nombre, [#32]);
          Cadena := ExtractWord(2, Cadena, ['=']);
          Cadena := TrimSet(Cadena, ['{', '}']);
          if (WordCount(Cadena, [',']) > 5) and (WordCount(Cadena, [',']) < 15) then
          begin
            Punto := Self.Add;
            Punto.Nombre := Nombre;
            for X := 1 to WordCount(Cadena, [',']) do
            begin
              Parte := ExtractWord(x, Cadena, [',']);
              Parte := ExtractWord(2, Parte, [#32]);
              case X of
                1:
                  Punto.FE6pos.x := Parte;
                2:
                  Punto.FE6pos.y := Parte;
                3:
                  Punto.FE6pos.z := Parte;
                4:
                  Punto.FE6pos.a := Parte;
                5:
                  Punto.FE6pos.b := Parte;
                6:
                  Punto.FE6pos.c := Parte;
                7:
                  Punto.FE6pos.s := Parte;
                8:
                  Punto.FE6pos.t := Parte;
                9:
                  Punto.FE6pos.e1 := Parte;
                10:
                  Punto.FE6pos.e2 := Parte;
                11:
                  Punto.FE6pos.e3 := Parte;
                12:
                  Punto.FE6pos.e4 := Parte;
                13:
                  Punto.FE6pos.e5 := Parte;
                14:
                  Punto.FE6pos.e6 := Parte;
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(LsFichero);
  end;
end;

function Te6posList.Add: Te6posItem;
begin
  Result := inherited Add as Te6posItem;
end;

function Te6posList.FindItemByName(aName: string): Te6posItem;
var
  I: integer;
  Temp: String;
begin
  Result := nil;
  I := 0;
  while I < Self.Count - 1 do
  begin
    if Self[I].FNombre = aName then
    begin
      Temp := Self[i].FNombre;
      Result := Te6posItem.Create(nil);
      Result.Assign(Self[i]);
      I := Self.Count;
    end;
    I := I + 1;
  end;
end;

end.
