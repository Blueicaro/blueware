unit salidassistemagrid;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, rw6_eio;

type

  { Tsalidassistemaframe }

  Tsalidassistemaframe = class(TFrame)
    GridSalidasSistema: TStringGrid;
  private
    Fid: integer;
    FInfo: TSysOutPutList;
    function ActualizarInfo: TSysOutPutList;
  public
    property Info: TSysOutPutList read FInfo;
  public
    property id: integer read Fid write Fid;
    procedure LlenarGrid(datos: TSysOutPutList);
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.lfm}

{ Tsalidassistemaframe }

function Tsalidassistemaframe.ActualizarInfo: TSysOutPutList;
var
  I, Posicion: integer;
  Elemento: TSysOutputItem;
  Contenido: string;
begin
  FInfo.Clear;
  for I := 1 to GridSalidasSistema.RowCount - 1 do
  begin
    Elemento := FInfo.Add;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Status').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Status := Contenido;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Signal Name').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Signal := Contenido;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg1').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Arg1 := Contenido;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg2').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Arg2 := Contenido;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg3').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Arg3 := Contenido;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg4').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Arg4 := Contenido;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg5').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Arg5 := Contenido;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg6').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Arg6 := Contenido;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg7').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Arg7 := Contenido;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg8').Index;
    Contenido := GridSalidasSistema.Cells[Posicion, I];
    Elemento.Arg8 := Contenido;

  end;

  Result := FInfo;
end;

procedure Tsalidassistemaframe.LlenarGrid(datos: TSysOutPutList);
var
  Linea: array [0..10] of string;
  I, x, Posicion: integer;

begin
  GridSalidasSistema.RowCount := 1;
  for I := 0 to datos.Count - 1 do
  begin
    for x := 0 to High(Linea) do
    begin
      Linea[X] := '';
    end;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Status').Index;
    Linea[Posicion] := datos[I].Status;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Signal Name').Index;
    Linea[Posicion] := datos[I].Signal;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg1').Index;
    Linea[Posicion] := datos[I].Arg1;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg2').Index;
    Linea[Posicion] := datos[I].Arg2;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg3').Index;
    Linea[Posicion] := datos[I].Arg3;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg4').Index;
    Linea[Posicion] := datos[I].Arg4;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg5').Index;
    Linea[Posicion] := datos[I].Arg5;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg6').Index;
    Linea[Posicion] := datos[I].Arg6;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg7').Index;
    Linea[Posicion] := datos[I].Arg7;

    Posicion := GridSalidasSistema.Columns.ColumnByTitle('Arg8').Index;
    Linea[Posicion] := datos[I].Arg8;

    GridSalidasSistema.InsertRowWithValues(1, Linea);

  end;
end;

constructor Tsalidassistemaframe.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  if FileExists(Self.Name) then
  begin
    GridSalidasSistema.SaveOptions := [soDesign];
    GridSalidasSistema.LoadFromFile(Self.Name);
  end;
  FInfo := TSysOutPutList.Create;
end;

destructor Tsalidassistemaframe.Destroy;
begin
  FreeAndNil(FInfo);
  try
    GridSalidasSistema.SaveOptions := [soDesign];
    GridSalidasSistema.SaveToFile(Self.Name);
  finally
    inherited Destroy;
  end;
end;

end.
