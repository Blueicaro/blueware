unit crossconnexiongrid;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, rw6_eio;

type

  { TCrossConexionFrame }

  TCrossConexionFrame = class(TFrame)
    gridConexionesCruzadas: TStringGrid;
  private
    Fid: integer;
    FInfo: TCrossConnectionList;
    function ActualizarInfo: TCrossConnectionList;
  public
    property Info: TCrossConnectionList read FInfo;
    procedure MostrarTabla;
  public
    property id: integer read Fid write Fid;
    procedure LlenarGrid(Datos: TCrossConnectionList);
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses TablaVerdadConexionCruzada;

var
  tabla: TTablaVerdadConexionCruzadafrm;

  {$R *.lfm}

  { TCrossConexionFrame }

function TCrossConexionFrame.ActualizarInfo: TCrossConnectionList;
var
  Posicion, I: integer;
  Elemento: TCrossConnectionItem;
  Contenido: string;
begin
  FInfo.Clear;
  for I := 1 to gridConexionesCruzadas.RowCount - 1 do
  begin
    Elemento := FInfo.Add;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Name').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Nombre := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Result').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Res := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 1').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Act1 := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 2').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Act2 := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 3').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Act3 := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 4').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Act4 := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 5').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Act5 := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Oper1').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Oper1 := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Oper2').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Oper2 := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Oper3').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Oper3 := Contenido;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Oper4').Index;
    Contenido := gridConexionesCruzadas.Cells[Posicion, I];
    Elemento.Oper4 := Contenido;
  end;
  Result := FInfo;
end;

procedure TCrossConexionFrame.MostrarTabla;
var
  C: TCrossConnectionItem;
begin
  //localizar conexcion cruzada
 // C := FInfo.GetCrossByName({ #todo : Continuar aquí });
end;

procedure TCrossConexionFrame.LlenarGrid(Datos: TCrossConnectionList);
var
  Linea: array [0..10] of string;
  Posicion, I, X: integer;
begin
  gridConexionesCruzadas.RowCount := 1;

  for  I := 0 to Datos.Count - 1 do
  begin
    for X := 0 to High(Linea) do
    begin
      Linea[x] := '';
    end;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Name').Index;
    Linea[Posicion] := Datos[I].Nombre;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Result').Index;
    Linea[Posicion] := Datos[I].Res;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 1').Index;
    Linea[Posicion] := Datos[I].Act1;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 2').Index;
    Linea[Posicion] := Datos[I].Act2;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 3').Index;
    Linea[Posicion] := Datos[I].Act3;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 4').Index;
    Linea[Posicion] := Datos[I].Act4;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Actor 5').Index;
    Linea[Posicion] := Datos[I].Act5;


    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Oper1').Index;
    Linea[Posicion] := Datos[I].Oper1;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Oper2').Index;
    Linea[Posicion] := Datos[I].Oper2;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Oper3').Index;
    Linea[Posicion] := Datos[I].Oper3;

    Posicion := gridConexionesCruzadas.Columns.ColumnByTitle('Oper4').Index;
    Linea[Posicion] := Datos[I].Oper4;

    gridConexionesCruzadas.InsertRowWithValues(1, Linea);
  end;
end;

constructor TCrossConexionFrame.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  FInfo := TCrossConnectionList.Create;
  if FileExists(Self.Name) then
  begin
    gridConexionesCruzadas.SaveOptions := [soDesign];
    gridConexionesCruzadas.LoadFromFile(Self.Name);
  end;
end;

destructor TCrossConexionFrame.Destroy;
begin
  FreeAndNil(FInfo);
  try
    gridConexionesCruzadas.SaveOptions := [soDesign];
    gridConexionesCruzadas.SaveToFile(Self.Name);
  finally
    inherited Destroy;
  end;
end;

end.
