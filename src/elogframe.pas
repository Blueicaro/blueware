unit elogframe;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, ExtCtrls, StdCtrls,
  ElogUnit, Types;

type

  { TElogFrm }

  TElogFrm = class(TFrame)
    ElogGrid: TStringGrid;
    ListaIconos: TImageList;
    MemoInfo: TMemo;
    Splitter1: TSplitter;
    procedure ElogGridDrawCell(Sender: TObject; aCol, aRow: integer;
      aRect: TRect; aState: TGridDrawState);
    procedure ElogGridHeaderClick(Sender: TObject; IsColumn: boolean;
      Index: integer);
  private
    FElog: TElog;
    procedure MostrarDatos(aElog: TElogList);
    procedure MostrarInformacion;
  public
    procedure FiltroCategoria(aCategoria: string);
    procedure ResetFiltro;
    property Elog: TElog read FElog;
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure LeerElog(aFileName: TFileName);
  end;

implementation

uses StrUtils, Graphics;
  {$R *.lfm}

  { TElogFrm }

procedure TElogFrm.ElogGridHeaderClick(Sender: TObject; IsColumn: boolean;
  Index: integer);
begin
  ElogGrid.SortColRow(IsColumn, Index);
end;

procedure TElogFrm.ElogGridDrawCell(Sender: TObject; aCol, aRow: integer;
  aRect: TRect; aState: TGridDrawState);
var
  Texto: string;
  R: TRect;
  Bmp: TBitmap;
  Lado: longint;
begin
  Texto := ElogGrid.Cells[aCol, aRow];
  if texto = '' then exit;
  if Length(Texto) > 1 then
  begin
    ElogGrid.Canvas.TextOut(arect.left + 2, arect.top + 2, Texto);
    Exit;
  end;


  if Texto[1] in ['I', 'E', 'W'] then
  begin
    Bmp := TBitmap.Create;
    case texto of
      'I':
        ListaIconos.GetBitmap(0, Bmp);
      'W':
        ListaIconos.GetBitmap(1, Bmp);
      'E':
        ListaIconos.GetBitmap(2, Bmp);
    end;
    R.Top := aRect.Top + 2;
    R.Left := aRect.Left + 7;
    R.Right := R.Left + Bmp.Width;
    R.Bottom := R.Top + Bmp.Height;
    ElogGrid.Canvas.Clear;
    ElogGrid.Canvas.StretchDraw(R, Bmp);
    FreeAndNil(Bmp);
  end;

end;


procedure TElogFrm.MostrarDatos(aElog: TElogList);
var
  I, X: integer;
  Cadena: string;
  Datos: array [1..7] of string;
begin
  ElogGrid.Clean;
  ElogGrid.RowCount := 1;
  ElogGrid.BeginUpdate;
  for I := 0 to aElog.Count - 1 do
  begin
    Cadena := aElog[I].ToString;
    for X := 1 to 7 do
    begin
      Datos[X] := ExtractDelimited(X, Cadena, [#09]);
    end;
    ElogGrid.InsertRowWithValues(I + 1, Datos);
  end;
  ElogGrid.AutoAdjustColumns;
  ElogGrid.EndUpdate(True);
end;

procedure TElogFrm.MostrarInformacion;
var
  I, X: Integer;
  Cadena: String;
begin
  MemoInfo.BeginUpdateBounds;
  MemoInfo.Clear;
  MemoInfo.Lines.Add('Fecha :' + DateToStr(FElog.Date));
  MemoInfo.Lines.Add('Nombre del sistema: ' + FElog.NombreSistema);
  MemoInfo.Lines.Add('Nombre del controlador: ' + FElog.NombreControlador);
  MemoInfo.Lines.Add('Id controlador: '+FElog.IdControlador);
  MemoInfo.Lines.Add('Clave del controlador: '+FElog.ClaveControlador);
  MemoInfo.Lines.Add('Opciones del controlador');
  For I:= 0 To Elog.OpcionesControlador.Count-1 do
  begin
    MemoInfo.Lines.Add(#09+Elog.OpcionesControlador[I]);
  end;
  For X := 0 To FElog.DriveModule.Count-1 do
  begin
    MemoInfo.Lines.Add('DriveModule '+IntToStr(X+1));
    For I := 0 To FElog.DriveModule[x].Opciones.Count-1 do
    begin
      Cadena := FElog.DriveModule[x].Opciones[I];
      if Cadena <> '' then
      begin
        MemoInfo.Lines.Add(#09+FElog.DriveModule[x].Opciones[I]);
      end;
    end;
  end;
  MemoInfo.EndUpdateBounds;
end;

procedure TElogFrm.FiltroCategoria(aCategoria: string);
var
  Lista: TElogList;
begin
  try
    Lista := Elog.ElogCategoria(aCategoria);
    MostrarDatos(Lista);
  finally
    FreeAndNil(Lista);
  end;
end;

procedure TElogFrm.ResetFiltro;
begin
  MostrarDatos(FElog.Elog);
end;

constructor TElogFrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  FElog := TElog.Create;
  if FileExists('ElogGrid') then
  begin
    ElogGrid.LoadFromFile('ElogGrid');
  end;
end;

destructor TElogFrm.Destroy;
begin
  ElogGrid.SaveOptions := [soDesign, soAttributes, soPosition];
  ElogGrid.SaveToFile('ElogGrid');
  FreeAndNil(FElog);
  inherited Destroy;
end;

procedure TElogFrm.LeerElog(aFileName: TFileName);
begin
  FElog.ReadElogFile(aFileName);
  MostrarDatos(FElog.Elog);
  MostrarInformacion;

end;

end.
