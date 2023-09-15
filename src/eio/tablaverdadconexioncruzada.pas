unit TablaVerdadConexionCruzada;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, rw6_eio;

type

  { TTablaVerdadConexionCruzadafrm }

  TTablaVerdadConexionCruzadafrm = class(TFrame)
    stgTablaVerdad: TStringGrid;
  private

  public
    procedure ShowCrossConexion(aCrossConexion: TCrossConnectionItem);
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses Math;

  {$R *.lfm}

  { TTablaVerdadConexionCruzadafrm }

procedure TTablaVerdadConexionCruzadafrm.ShowCrossConexion(
  aCrossConexion: TCrossConnectionItem);
var
  C: TGridColumn;
  NumeroElementos, X, i: integer;
  Datos: array of string;
  Cadena: string;
  Maximo: Float;
begin
  stgTablaVerdad.Clear;
  //Crear cabecera


  if aCrossConexion.Act5 <> '' then
  begin
    C := stgTablaVerdad.Columns.Add;
    C.Title.Caption := aCrossConexion.Act5;
  end;
  if aCrossConexion.Act4 <> '' then
  begin
    C := stgTablaVerdad.Columns.Add;
    C.Title.Caption := aCrossConexion.Act4;
  end;
  if aCrossConexion.Act3 <> '' then
  begin
    C := stgTablaVerdad.Columns.Add;
    C.Title.Caption := aCrossConexion.Act3;
  end;
  if aCrossConexion.Act2 <> '' then
  begin
    C := stgTablaVerdad.Columns.Add;
    C.Title.Caption := aCrossConexion.Act2;
  end;
  C := stgTablaVerdad.Columns.Add;
  C.Title.Caption := aCrossConexion.Act1;

  C := stgTablaVerdad.Columns.Add;
  C.Title.Caption := aCrossConexion.Res;

  NumeroElementos := aCrossConexion.NumberActors;
  SetLength(Datos, NumeroElementos + 1);
  Maximo := (IntPower(2, NumeroElementos))-1;
  i := 0;
  while I <= Maximo do
  begin
    Cadena := BinStr(I, NumeroElementos);
    for X := 1 to NumeroElementos do
    begin
      Datos[X] := Cadena[X];
    end;
    Datos[NumeroElementos + 1] := 'Cal';
    stgTablaVerdad.InsertRowWithValues(1, Datos);
    I := I + 1;
  end;
end;

constructor TTablaVerdadConexionCruzadafrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
end;

destructor TTablaVerdadConexionCruzadafrm.Destroy;
begin
  inherited Destroy;
end;

end.
