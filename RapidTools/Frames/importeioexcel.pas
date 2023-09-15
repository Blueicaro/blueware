unit ImportEioExcel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ButtonPanel, EditBtn, StdCtrls, ExtCtrls,
  Buttons, Spin, rw6_eio;

type

  { TImportEioExcelFrame }

  TImportEioExcelFrame = class(TFrame)
    ButtonPanel1: TButtonPanel;
    cbHojas: TComboBox;
    edCanalEntrada: TEdit;
    edCanalSalida: TEdit;
    edNombreUnidad: TEdit;
    edNombreSalida: TEdit;
    edCategoriaSalida: TEdit;
    edDescripcionSalida: TEdit;
    edTipoSalida: TEdit;
    edTipoEntrada: TEdit;
    edNombreEntrada: TEdit;
    edCategoriaEntrada: TEdit;
    edDescripcionEntrada: TEdit;
    grbxEntradas: TGroupBox;
    grbxSalidas: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    spFilaInicialEntradas: TSpinEdit;
    spFilaFinalEntradas: TSpinEdit;
    spFilaInicialSalidas: TSpinEdit;
    spFilaFinalSalidas: TSpinEdit;
    procedure ButtonPanel1Click(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure cbHojasChange(Sender: TObject);
    procedure edNombreUnidadChange(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure onChangeTEdits(Sender: TObject);
    procedure onEnterTEdits(Sender: TObject);
    procedure OnKeyPressTEdits(Sender: TObject; var Key: char);
    procedure spFilaInicialEntradasChange(Sender: TObject);
  private
    DatosEntradasOk: boolean;
    DatosSalidasOk: boolean;
    procedure ValidarDatos;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses fpSpreadsheet,
  fpsTypes,
  fpsallformats,
  importareiodlg;

{$R *.lfm}

{ TImportEioExcelFrame }

procedure TImportEioExcelFrame.ButtonPanel1Click(Sender: TObject);
begin

end;

procedure TImportEioExcelFrame.CancelButtonClick(Sender: TObject);
begin
  Free;
end;

procedure TImportEioExcelFrame.cbHojasChange(Sender: TObject);
begin
  ValidarDatos;
end;

{ #todo : Poner Validación del nombre de unidades según Rapid }
procedure TImportEioExcelFrame.edNombreUnidadChange(Sender: TObject);
begin
  ValidarDatos;
end;

procedure TImportEioExcelFrame.OKButtonClick(Sender: TObject);
var
  WorkBook: TsWorkbook;
  HojaDeTrabajo: TsWorksheet;
  CartaDestino: TCaption;
  Cadena: string;
  ColumnaCategoria, ColumnaDescripcion, ColumnaTipo, ColumnaNombres,
  ColumnaCanales, FilaInicial, FilaFinal, I: integer;
  Senal: TSignalItem;
  Celda: PCell;
begin
  WorkBook := TsWorkbook.Create;

  try
    with Parent as TImportarEioFrm do
    begin
      WorkBook.ReadFromFile(Archivo);
    end;

    HojaDeTrabajo := WorkBook.GetWorksheetByName(cbHojas.Text);

    CartaDestino := edNombreUnidad.Text;
    if CartaDestino = '' then
    begin
      CartaDestino := #32;
    end;
    //Procesar excel y generar señales de entradas
    if DatosEntradasOk then
    begin
      FilaInicial := spFilaInicialEntradas.Value-1;
      FilaFinal := spFilaFinalEntradas.Value-1;

      ColumnaCategoria := -1;
      ColumnaDescripcion := -1;
      ColumnaTipo := -1;

      ColumnaNombres := (Ord(edNombreEntrada.Text[1])) - 65;
      ColumnaCanales := (Ord(edCanalEntrada.Text[1])) - 65;
      if edTipoEntrada.Text <> '' then
      begin
        ColumnaTipo := Ord((edTipoEntrada.Text[1])) - 65;
      end;

      if edCategoriaEntrada.Text <> '' then
      begin
        ColumnaCategoria := Ord(edCategoriaEntrada.Text[1]) - 65;
      end;

      if edCategoriaEntrada.Text <> '' then
      begin
        ColumnaDescripcion := Ord(edCategoriaEntrada.Text[1]) - 65;
      end;

      for I := FilaInicial to FilaFinal do
      begin
        Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaNombres);
        if Cadena <> '' then
        begin
          with Parent as TImportarEioFrm do
          begin
            Senal := Eio6.Add;
          end;

          Senal.Nombre := Cadena;
          Senal.Device := CartaDestino;

          if ColumnaTipo > -1 then
          begin
            Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaTipo);
          end
          else
          begin
            Senal.SignalType := 'DI';
          end;

          if ColumnaCanales > -1 then
          begin
            Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaCanales);
            Senal.DeviceMap := Cadena;
          end;

          if ColumnaCategoria > -1 then
          begin
            Celda := HojaDeTrabajo.FindCell(I, ColumnaCategoria);
            if HojaDeTrabajo.IsMerged(Celda) then
            begin
              Cadena := Celda^.UTF8StringValue;
            end
            else
            begin
              Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaCategoria);
            end;
            Senal.Category := Cadena;
          end;

          if ColumnaDescripcion > -1 then
          begin
            Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaDescripcion);
            Senal.SignalLabel := Cadena;
          end;
        end;
      end;
    end;

    if DatosSalidasOk then
    begin
      //Empieza a contar en 0
      FilaInicial := spFilaInicialSalidas.Value-1;
      FilaFinal := spFilaFinalSalidas.Value-1;

      ColumnaCategoria := -1;
      ColumnaDescripcion := -1;
      ColumnaTipo := -1;

      ColumnaNombres := (Ord(edNombreSalida.Text[1])) - 65;
      ColumnaCanales := (Ord(edCanalSalida.Text[1])) - 65;
      if edTipoSalida.Text <> '' then
      begin
        ColumnaTipo := Ord((edTipoSalida.Text[1])) - 65;
      end;

      if edCategoriaSalida.Text <> '' then
      begin
        ColumnaCategoria := Ord(edCategoriaSalida.Text[1]) - 65;
      end;

      if edDescripcionSalida.Text <> '' then
      begin
        ColumnaDescripcion := Ord(edDescripcionSalida.Text[1]) - 65;
      end;

      for I := FilaInicial to FilaFinal do
      begin
        Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaNombres);
        if Cadena <> '' then
        begin
          with Parent as TImportarEioFrm do
          begin
            Senal := Eio6.Add;
          end;

          Senal.Nombre := Cadena;
          Senal.Device := CartaDestino;

          if ColumnaTipo > -1 then
          begin
            Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaTipo);
          end
          else
          begin
            Senal.SignalType := 'DO';
          end;

          if ColumnaCanales > -1 then
          begin
            Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaCanales);
            Senal.DeviceMap := Cadena;
          end;

          if ColumnaCategoria > -1 then
          begin
            Celda := HojaDeTrabajo.FindCell(I, ColumnaCategoria);
            if HojaDeTrabajo.IsMerged(Celda) then
            begin
              Cadena := Celda^.UTF8StringValue;
            end
            else
            begin
              Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaCategoria);
            end;
            Senal.Category := Cadena;
          end;

          if ColumnaDescripcion > -1 then
          begin
            Cadena := HojaDeTrabajo.ReadAsText(I, ColumnaDescripcion);
            Senal.SignalLabel := Cadena;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(WorkBook);
  end;

end;

procedure TImportEioExcelFrame.onChangeTEdits(Sender: TObject);
begin
  with Sender as TEdit do
  begin
    Text := UpperCase(Text);
  end;
  ValidarDatos;
end;

procedure TImportEioExcelFrame.onEnterTEdits(Sender: TObject);
begin

end;

procedure TImportEioExcelFrame.OnKeyPressTEdits(Sender: TObject; var Key: char);
begin
  if not ((key in ['a'..'z']) or (key = #8) or (key in ['A'..'Z'])) then
  begin
    Key := #0;
  end
  else
  begin
    key := UpCase(Key);
  end;
  ValidarDatos;
end;

procedure TImportEioExcelFrame.spFilaInicialEntradasChange(Sender: TObject);
begin
  ValidarDatos;
end;

procedure TImportEioExcelFrame.ValidarDatos;
begin

  if cbHojas.Text = '' then
  begin
    ButtonPanel1.OKButton.Enabled := False;
    Exit;
  end;

  //Entradas
  DatosEntradasOk := (edCanalEntrada.Text <> '') and (edNombreEntrada.Text <> '');

  DatosEntradasOk := DatosEntradasOk and (spFilaFinalEntradas.Value >=
    spFilaInicialEntradas.Value);

  DatosSalidasOk := (edCanalSalida.Text <> '') and (edNombreSalida.Text <> '');

  DatosSalidasOk := (DatosSalidasOk = True) and
    (spFilaFinalSalidas.Value >= spFilaInicialSalidas.Value);

  ButtonPanel1.OKButton.Enabled := DatosSalidasOk or DatosEntradasOk;
end;

constructor TImportEioExcelFrame.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
end;

destructor TImportEioExcelFrame.Destroy;
begin
  inherited Destroy;
end;

end.
