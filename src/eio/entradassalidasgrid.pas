unit entradassalidasgrid;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, StdCtrls, ComCtrls, ExtCtrls,
  rw6_eio, erroresframe;

type

  { TEntradasSalidasFrm }

  TEntradasSalidasFrm = class(TFrame)
    GridDatos: TStringGrid;
    procedure GridDatosHeaderClick(Sender: TObject; IsColumn: boolean;
      Index: integer);
    procedure GridDatosValidateEntry(Sender: TObject; aCol, aRow: integer;
      const OldValue: string; var NewValue: string);
  private
    Fid: integer;
    FInfo: TSignalList;
    //Lista de categorias
    lsCategorias: TStringList;
    //Lista de cartas de entradas y salidas o Devices
    lsDevices: TStringList;
    //Lista de niveles de seguriad SafetyLevel
    lsSafetyLevel: TStringList;
    //Lista de niveles de acceso
    lsAccessLevel: TStringList;
    function ActualizarInfo: TSignalList;
    procedure VentanaErrores;
  public
    property Info: TSignalList read ActualizarInfo;
    property id: integer read FId write Fid;
    procedure LlenarGrid(aDatos: TSignalList);
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FrameErrores: TAvisosErroresFrm;

implementation

uses ivalidador;

  {$R *.lfm}


  { TEntradasSalidasFrm }

procedure TEntradasSalidasFrm.GridDatosHeaderClick(Sender: TObject;
  IsColumn: boolean; Index: integer);
begin

end;

procedure TEntradasSalidasFrm.GridDatosValidateEntry(Sender: TObject;
  aCol, aRow: integer; const OldValue: string; var NewValue: string);
var
  ColumnaActual: TGridColumn;
  it: TListItem;
  validador: TRapidIdentificadorV6;
  I: integer;
begin
  ColumnaActual := GridDatos.Columns.Items[aCol];
  if ColumnaActual.Title.Caption = 'Name' then
  begin
    try
      validador := TRapidIdentificadorV6.Create(NewValue);
       FrameErrores.BorrarErrores;
       FrameErrores.AddErrores(validador.ListaErrores);
    finally
      FreeAndNil(validador);
    end;
  end;
end;

function TEntradasSalidasFrm.ActualizarInfo: TSignalList;
var
  I, Posicion: integer;
  Elemento: TSignalItem;
  Contenido: string;
begin
  FInfo.Clear;
  Result := FInfo;
  for I := 1 to GridDatos.RowCount - 1 do
  begin
    Elemento := FInfo.Add;

    Posicion := GridDatos.Columns.ColumnByTitle('Name').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.Nombre := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Type of Signal').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.SignalType := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Assigned to Device').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.Device := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Device Mapping').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.DeviceMap := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Signal Identification Label').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.SignalLabel := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Category').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.Category := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Access Level').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.Access := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Default Value').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.DefaultValue := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Filter time pasive').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.FiltPas := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Filter time active').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.FiltAct := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Invert physical value').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.Invert := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Analog Encoding Type').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.EncType := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Maximun Logical Value').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.MaxLog := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Minumun Logical Value').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.MinLog := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Maximun bit Value').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.MaxBitVal := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Minimun bit Value').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.MinBitVal := Contenido;

    Posicion := GridDatos.Columns.ColumnByTitle('Safety Level').Index;
    Contenido := GridDatos.Cells[Posicion, I];
    Elemento.SafeLevel := Contenido;
  end;
  Result := FInfo;
end;

procedure TEntradasSalidasFrm.VentanaErrores;
begin
  if FrameErrores = nil then
  begin
    FrameErrores := TAvisosErroresFrm.Create(Self);
    FrameErrores.Parent := Self;
    FrameErrores.Align:=alBottom;
  end;
  FrameErrores.BringToFront;
end;

procedure TEntradasSalidasFrm.LlenarGrid(aDatos: TSignalList);
var
  I, Posicion, X: integer;
  Datos: array [0..16] of string;
begin
  GridDatos.RowCount := 1;
  lsSafetyLevel.Clear;
  lsDevices.Clear;
  lsCategorias.Clear;
  lsAccessLevel.Clear;
  for I := 0 to aDatos.Count - 1 do
  begin
    //Borrar Contenido del array de Datos antes de volcar datos nuevos

    for X := 0 to 16 do
    begin
      Datos[X] := '';
    end;

    Posicion := GridDatos.Columns.ColumnByTitle('Name').Index;
    Datos[Posicion] := aDatos[I].Nombre;

    Posicion := GridDatos.Columns.ColumnByTitle('Type of Signal').Index;
    Datos[Posicion] := aDatos[I].SignalType;

    Posicion := GridDatos.Columns.ColumnByTitle('Assigned to Device').Index;
    Datos[Posicion] := aDatos[I].Device;

    Posicion := GridDatos.Columns.ColumnByTitle('Device Mapping').Index;
    Datos[Posicion] := aDatos[I].DeviceMap;

    Posicion := GridDatos.Columns.ColumnByTitle('Signal Identification Label').Index;
    Datos[Posicion] := aDatos[I].SignalLabel;

    Posicion := GridDatos.Columns.ColumnByTitle('Category').Index;
    Datos[Posicion] := aDatos[I].Category;

    Posicion := GridDatos.Columns.ColumnByTitle('Access Level').Index;
    Datos[Posicion] := aDatos[I].Access;

    Posicion := GridDatos.Columns.ColumnByTitle('Default Value').Index;
    Datos[Posicion] := aDatos[I].DefaultValue;

    Posicion := GridDatos.Columns.ColumnByTitle('Filter time pasive').Index;
    Datos[Posicion] := aDatos[I].FiltPas;

    Posicion := GridDatos.Columns.ColumnByTitle('Filter time active').Index;
    Datos[Posicion] := aDatos[I].FiltAct;

    Posicion := GridDatos.Columns.ColumnByTitle('Invert physical value').Index;
    Datos[Posicion] := aDatos[I].Invert;

    Posicion := GridDatos.Columns.ColumnByTitle('Analog Encoding Type').Index;
    Datos[Posicion] := aDatos[I].EncType;

    Posicion := GridDatos.Columns.ColumnByTitle('Maximun Logical Value').Index;
    Datos[Posicion] := aDatos[I].MaxLog;

    Posicion := GridDatos.Columns.ColumnByTitle('Minumun Logical Value').Index;
    Datos[Posicion] := aDatos[I].MinLog;

    Posicion := GridDatos.Columns.ColumnByTitle('Maximun bit Value').Index;
    Datos[Posicion] := aDatos[I].MaxLog;

    Posicion := GridDatos.Columns.ColumnByTitle('Minimun bit Value').Index;
    Datos[Posicion] := aDatos[I].MinBitVal;

    Posicion := GridDatos.Columns.ColumnByTitle('Safety Level').Index;
    Datos[Posicion] := aDatos[I].SafeLevel;

    GridDatos.InsertRowWithValues(1, Datos);

    //LLenar categorias en el stringlist de las categorias
    lsCategorias.Add(Trim(aDatos[I].Category));

    //Llenar lista de Devices o Cartas de entradas y salidas
    lsDevices.Add(aDatos[I].Device);

    //Llenar Lista de niveles de seguriad SafetyLevel
    lsSafetyLevel.Add(aDatos[I].SafeLevel);

    //Llenar lista de niveles de acceso
    lsAccessLevel.Add(aDatos[I].Access);

  end;

  GridDatos.Columns.ColumnByTitle('Safety Level').PickList.Clear;
  GridDatos.Columns.ColumnByTitle('Safety Level').PickList.AddStrings(lsSafetyLevel);

  GridDatos.Columns.ColumnByTitle('Assigned to Device').PickList.Clear;
  GridDatos.Columns.ColumnByTitle('Assigned to Device').PickList.AddStrings(lsDevices);

  GridDatos.Columns.ColumnByTitle('category').PickList.Clear;
  GridDatos.Columns.ColumnByTitle('Category').PickList.AddStrings(lsCategorias);

  GridDatos.Columns.ColumnByTitle('Access Level').PickList.Clear;
  GridDatos.Columns.ColumnByTitle('Access Level').PickList.AddStrings(lsAccessLevel);

  GridDatos.Columns.ColumnByTitle('Invert physical value').PickList.Clear;
  GridDatos.Columns.ColumnByTitle('Invert physical value').PickList.Add('Yes');
  GridDatos.Columns.ColumnByTitle('Invert physical value').PickList.Add('No');
end;

constructor TEntradasSalidasFrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  VentanaErrores;
  if FileExists(Self.Name) then
  begin
    GridDatos.SaveOptions := [soDesign];
    GridDatos.LoadFromFile(Self.Name);
  end;
  lsCategorias := TStringList.Create;
  lsCategorias.Sorted := True;
  lsCategorias.Duplicates := dupIgnore;

  lsDevices := TStringList.Create;
  lsDevices.Sorted := True;
  lsDevices.Duplicates := dupIgnore;

  lsSafetyLevel := TStringList.Create;
  lsSafetyLevel.Sorted := True;
  lsSafetyLevel.Duplicates := dupIgnore;

  lsAccessLevel := TStringList.Create;
  lsAccessLevel.sorted := True;
  lsAccessLevel.Duplicates := dupIgnore;

  FInfo := TSignalList.Create;
end;

destructor TEntradasSalidasFrm.Destroy;
begin

  FreeAndNil(FInfo);
  FreeAndNil(lsCategorias);
  FreeAndNil(lsDevices);
  FreeAndNil(lsSafetyLevel);
  FreeAndNil(lsAccessLevel);
  try
    GridDatos.SaveOptions := [soDesign];
    GridDatos.SaveToFile(Self.Name);
  finally
    inherited Destroy;
  end;

end;

end.
