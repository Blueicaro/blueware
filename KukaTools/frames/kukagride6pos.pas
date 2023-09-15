unit kukagridE6Pos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, ComCtrls, Menus, DatosKuka,
  kukaE6pos;

type

  { TkukagridE6PosFrm }

  TkukagridE6PosFrm = class(TFrame)
    GridDatos: TStringGrid;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    StatusBar1: TStatusBar;
    procedure GridDatosClick(Sender: TObject);
  private
    PosFrame: TE6posFrm;
    lsArchivo: TStringList;
    procedure ActualizaDatos;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  public
    Datos: Te6posList;
    procedure ActualizaPunto;
    procedure CargarArchivo(Archivo: TFileName);
    procedure Guardar(archivo:TFileName);
  end;

implementation
 uses StrUtils;

{$R *.lfm}

{ TkukagridE6PosFrm }

procedure TkukagridE6PosFrm.GridDatosClick(Sender: TObject);
begin
  ActualizaDatos;
end;

procedure TkukagridE6PosFrm.ActualizaDatos;
var
  Col, Fila: integer;
  Formato: TFormatSettings;
  Valor: longint;
  flValue: extended;
begin

  if PosFrame = nil then exit;


  Formato := DefaultFormatSettings;
  DefaultFormatSettings.DecimalSeparator := '.';

  Fila := GridDatos.Row;
  if Datos.Count > 0 then
  begin
    PosFrame.pnComponentes.Enabled := True;
    PosFrame.pnNombre.Caption := '';
  end;
  with PosFrame do
  begin
    Col := GridDatos.Columns.ColumnByTitle('Nombre').Id;
    pnNombre.Caption := GridDatos.Cells[Col, Fila];

    if chkIncremento.Checked then
    begin
      Exit;
    end;

    Col := GridDatos.Columns.ColumnByTitle('X').ID;
    if TryStrToFloat(GridDatos.Cells[Col, Fila], flValue) then
    begin
      flspDx.Value := flValue;
    end
    else
    begin
      flspDx.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('Y').ID;
    if TryStrToFloat(GridDatos.Cells[Col, Fila], flValue) then
    begin
      flspDy.Value := flValue;
    end
    else
    begin
      flspDy.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('Z').ID;
    if TryStrToFloat(GridDatos.Cells[Col, Fila], flValue) then
    begin
      flspDz.Value := flValue;
    end
    else
    begin
      flspDz.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('A').ID;
    if TryStrToFloat(GridDatos.Cells[Col, Fila], flValue) then
    begin
      flspRa.Value := flValue;
    end
    else
    begin
      flspRa.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('B').ID;
    if TryStrToFloat(GridDatos.Cells[Col, Fila], flValue) then
    begin
      flspRb.Value := flValue;
    end
    else
    begin
      flspRb.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('C').ID;
    if TryStrToFloat(GridDatos.Cells[Col, Fila], flValue) then
    begin
      flspRc.Value := flValue;
    end
    else
    begin
      flspRc.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('S').ID;
    if TryStrToInt(GridDatos.Cells[Col, Fila], Valor) then
    begin
      spCfgS.Value := Valor;
    end
    else
    begin
      spCfgS.Value := 0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('T').ID;
    if TryStrToInt(GridDatos.Cells[Col, Fila], Valor) then
    begin
      spCfgT.Value := Valor;
    end
    else
    begin
      spCfgT.Value := 0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('E1').ID;
    if TryStrToInt(GridDatos.Cells[Col, Fila], Valor) then
    begin
      flspE1.Value := Valor;
    end
    else
    begin
      flspE1.Value := 0.0;
    end;



    Col := GridDatos.Columns.ColumnByTitle('E2').ID;
    if TryStrToInt(GridDatos.Cells[Col, Fila], Valor) then
    begin
      flspE1.Value := Valor;
    end
    else
    begin
      flspE2.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('E3').ID;
    if TryStrToInt(GridDatos.Cells[Col, Fila], Valor) then
    begin
      flspE3.Value := Valor;
    end
    else
    begin
      flspE3.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('E4').ID;
    if TryStrToInt(GridDatos.Cells[Col, Fila], Valor) then
    begin
      flspE4.Value := Valor;
    end
    else
    begin
      flspE4.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('E5').ID;
    if TryStrToInt(GridDatos.Cells[Col, Fila], Valor) then
    begin
      flspE5.Value := Valor;
    end
    else
    begin
      flspE5.Value := 0.0;
    end;

    Col := GridDatos.Columns.ColumnByTitle('E6').ID;
    if TryStrToInt(GridDatos.Cells[Col, Fila], Valor) then
    begin
      flspE6.Value := Valor;
    end
    else
    begin
      flspE6.Value := 0.0;
    end;

  end;
  DefaultFormatSettings := Formato;
end;

constructor TkukagridE6PosFrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  PosFrame := TE6posFrm.Create(Self);
  PosFrame.Parent := self;
  PosFrame.Align := alLeft;
  PosFrame.Show;
  Datos := Te6posList.Create(Te6posItem);
  lsArchivo := TStringList.Create;
end;

destructor TkukagridE6PosFrm.Destroy;
begin
  FreeAndNil(Datos);
  FreeAndNil(lsArchivo);
  inherited Destroy;
end;

procedure TkukagridE6PosFrm.ActualizaPunto;
var
  Col, I: integer;
  Nombre: TCaption;
  Incremento: boolean;
  stValor: string;
  flValor: extended;
  Formato: TFormatSettings;
  inValor: longint;
begin
  Formato := DefaultFormatSettings;
  DefaultFormatSettings.DecimalSeparator := '.';
  Col := GridDatos.Columns.ColumnByTitle('Nombre').ID;
  Nombre := PosFrame.pnNombre.Caption;
  I := 1;
  Incremento := PosFrame.chkIncremento.Checked;
  while I <= GridDatos.RowCount do
  begin
    if GridDatos.Cells[Col, I] = Nombre then
    begin
      with PosFrame do
      begin
        Col := GridDatos.Columns.ColumnByTitle('X').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspDx.Value;
            GridDatos.Cells[Col, I] := flspDx.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspDx.ValueToStr(flspDx.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('Y').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspDy.Value;
            GridDatos.Cells[Col, I] := flspDy.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspDx.ValueToStr(flspDy.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('Z').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspDz.Value;
            GridDatos.Cells[Col, I] := flspDz.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspDz.ValueToStr(flspDz.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('A').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspra.Value;
            GridDatos.Cells[Col, I] := flspra.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspra.ValueToStr(flspra.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('B').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspra.Value;
            GridDatos.Cells[Col, I] := flsprb.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flsprb.ValueToStr(flsprb.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('C').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspra.Value;
            GridDatos.Cells[Col, I] := flsprc.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flsprc.ValueToStr(flsprc.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('S').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToInt(stValor, inValor) then
          begin
            inValor := inValor + spCfgS.Value;
            GridDatos.Cells[Col, I] := spCfgS.ValueToStr(inValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := spCfgS.ValueToStr(spCfgS.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('T').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToInt(stValor, inValor) then
          begin
            inValor := inValor + spCfgT.Value;
            GridDatos.Cells[Col, I] := spCfgT.ValueToStr(inValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := spCfgT.ValueToStr(spCfgT.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('E1').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspra.Value;
            GridDatos.Cells[Col, I] := flspE1.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspE1.ValueToStr(flspE1.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('E2').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspra.Value;
            GridDatos.Cells[Col, I] := flspE2.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspE2.ValueToStr(flspE2.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('E3').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspra.Value;
            GridDatos.Cells[Col, I] := flspE3.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspE3.ValueToStr(flspE3.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('E4').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspra.Value;
            GridDatos.Cells[Col, I] := flspE4.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspE4.ValueToStr(flspE4.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('E5').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspra.Value;
            GridDatos.Cells[Col, I] := flspE5.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspE5.ValueToStr(flspE5.Value);
        end;

        Col := GridDatos.Columns.ColumnByTitle('E6').ID;
        if Incremento then
        begin
          stValor := GridDatos.Cells[Col, I];
          if TryStrToFloat(stValor, flValor) then
          begin
            flValor := flValor + flspra.Value;
            GridDatos.Cells[Col, I] := flspE6.ValueToStr(flValor);
          end;
        end
        else
        begin
          GridDatos.Cells[Col, I] := flspE6.ValueToStr(flspE6.Value);
        end;

      end;
      I := GridDatos.RowCount;
    end;
    I := I + 1;
  end;
  DefaultFormatSettings := Formato;
end;

procedure TkukagridE6PosFrm.CargarArchivo(Archivo: TFileName);
var
  stDatos: array [1..15] of string;
  I: integer;
begin
  try
    lsArchivo.LoadFromFile(Archivo);
    GridDatos.RowCount := 1;
    Datos.LoadFromFile(Archivo);
    StatusBar1.Panels[1].Text := Archivo;
    for I := 0 to Datos.Count - 1 do
    begin
      stDatos[1] := Datos[I].Nombre;
      stDatos[2] := Datos[I].E6pos.X;
      stDatos[3] := Datos[I].E6pos.y;
      stDatos[4] := Datos[I].E6pos.z;
      stDatos[5] := Datos[I].E6pos.a;
      stDatos[6] := Datos[I].E6pos.b;
      stDatos[7] := Datos[I].E6pos.c;
      stDatos[8] := Datos[I].E6pos.s;
      stDatos[9] := Datos[I].E6pos.t;
      stDatos[10] := Datos[I].E6pos.E1;
      stDatos[11] := Datos[I].E6pos.E2;
      stDatos[12] := Datos[I].E6pos.E3;
      stDatos[13] := Datos[I].E6pos.E4;
      stDatos[14] := Datos[I].E6pos.E5;
      stDatos[15] := Datos[I].E6pos.E6;
      GridDatos.InsertRowWithValues(1, stDatos);
    end;

  except
    on  E: Exception do
    StatusBar1.Panels[1].Text:='Fallo cargando archivo :'+Archivo;
  end;
end;

procedure TkukagridE6PosFrm.Guardar(archivo: TFileName);
var
  I: Integer;
  Cadena, Parte1, Nombre, Linea: String;
  Dato: Te6posItem;
begin
  I:=0;
  While I < lsArchivo.Count-1 do
  begin
    Cadena := lsArchivo[I];
    if Pos ('DECL E6POS ',Cadena)=1 Then
    begin
      Parte1 := ExtractWord(1,Cadena,['=']);
      Nombre := ExtractWord(3,Parte1,[#32]);
      Dato := Datos.FindItemByName(Nombre);
      iF dato <> nil then
      begin
        Linea := Dato.E6PosItemToString;
        lsArchivo[I]:=Linea;
        FreeAndNil(Datos);
      end;
    end;
    I:=I+1;
  end;
  lsArchivo.SaveToFile(archivo);
end;

end.
