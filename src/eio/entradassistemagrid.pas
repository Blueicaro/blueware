unit entradassistemagrid;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, rw6_eio;

type

  { TEntradassistemaFrame }

  TEntradassistemaFrame = class(TFrame)
    GridEntradasSistema: TStringGrid;
    procedure FrameExit(Sender: TObject);
    procedure GridEntradasSistemaExit(Sender: TObject);
  private
    Fid: integer;
    FInfo: TSysInputtList;
    function ActualizarInfo: TSysInputtList;
  public
    property Info: TSysInputtList read ActualizarInfo;
  public
    property id: integer read Fid write Fid;
    procedure LlenarGrid(Datos: TSysInputtList);
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure clos;
  end;

implementation

{$R *.lfm}

{ TEntradassistemaFrame }

procedure TEntradassistemaFrame.FrameExit(Sender: TObject);

begin
end;

procedure TEntradassistemaFrame.GridEntradasSistemaExit(Sender: TObject);
begin

end;

function TEntradassistemaFrame.ActualizarInfo: TSysInputtList;
var
  I, Posicion: integer;
  Contenido: string;
  Elemento: TSysInputItem;
begin
  FInfo.Clear;
  Result := FInfo;
  for I := 1 to GridEntradasSistema.RowCount - 1 do
  begin
    Elemento := FInfo.Add;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Action').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Action := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Signal Name').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.SignalName := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg1').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Arg1 := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg2').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Arg2 := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg3').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Arg3 := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg4').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Arg4 := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg5').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Arg5 := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg6').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Arg6 := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg7').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Arg7 := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg8').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Arg8 := Contenido;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg9').Index;
    Contenido := GridEntradasSistema.Cells[Posicion, I];
    Elemento.Arg9 := Contenido;
  end;
  Result := FInfo;

end;

procedure TEntradassistemaFrame.LlenarGrid(Datos: TSysInputtList);
var
  Linea: array [0..10] of string;
  x, I, Posicion: integer;

begin
  GridEntradasSistema.RowCount := 1;
  for I := 0 to Datos.Count - 1 do
  begin
    for x := 0 to 10 do
    begin
      Linea[X] := '';
    end;
    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Action').Index;
    Linea[Posicion] := Datos[I].Action;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Signal Name').Index;
    Linea[Posicion] := Datos[I].SignalName;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg1').Index;
    Linea[Posicion] := Datos[I].Arg1;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg2').Index;
    Linea[Posicion] := Datos[I].Arg2;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg3').Index;
    Linea[Posicion] := Datos[I].Arg3;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg4').Index;
    Linea[Posicion] := Datos[I].Arg4;


    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg5').Index;
    Linea[Posicion] := Datos[I].Arg5;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg6').Index;
    Linea[Posicion] := Datos[I].Arg6;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg7').Index;
    Linea[Posicion] := Datos[I].Arg7;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg8').Index;
    Linea[Posicion] := Datos[I].Arg8;

    Posicion := GridEntradasSistema.Columns.ColumnByTitle('Arg9').Index;
    Linea[Posicion] := Datos[I].Arg9;

    GridEntradasSistema.InsertRowWithValues(1, Linea);

  end;
end;

constructor TEntradassistemaFrame.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);

  if FileExists(Self.Name) then
  begin
    GridEntradasSistema.SaveOptions := [soDesign];
    GridEntradasSistema.LoadFromFile(Self.Name);
  end;
  FInfo := TSysInputtList.Create;
end;

destructor TEntradassistemaFrame.Destroy;
begin
  FreeAndNil(FInfo);
  try
    GridEntradasSistema.SaveOptions := [soDesign];
    GridEntradasSistema.SaveToFile(Self.Name);
  finally
    inherited Destroy;
  end;
end;

procedure TEntradassistemaFrame.clos;
begin

end;

end.
