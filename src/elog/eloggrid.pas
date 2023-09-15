unit eloggrid;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, ElogUnit;

type

  { TElogGridFrm }

  TElogGridFrm = class(TFrame)
    stElogGrid: TStringGrid;
  private

  public
    procedure SetCabecera(aCabecera: string);
    procedure Llenar(Datos: TElogList; FiltroCategoria: string = '');
    procedure Pruebas(Datos: TElog;FiltroCategoria: string = '');
    procedure Clear;
  end;

implementation

uses StrUtils;

  {$R *.lfm}

  { TElogGridFrm }

procedure TElogGridFrm.SetCabecera(aCabecera: string);
var
  I: integer;
begin
  for I := 1 to 7 do
  begin
    stElogGrid.Columns.Items[I - 1].Title.Caption :=
      ExtractDelimited(I, aCabecera, [#09]);
  end;
end;

procedure TElogGridFrm.Llenar(Datos: TElogList; FiltroCategoria: string);
var
  Linea: array  [1..7] of string;
  I: integer;
begin
  stElogGrid.RowCount := 1;
  for I := 0 to Datos.Count - 1 do
  begin
    Linea[1] := IntToStr(Datos[I].SeqNo);
    Linea[2] := Datos[I].Tipo;
    Linea[3] := Datos[I].Categoria;
    Linea[4] := IntToStr(Datos[I].Codigo);
    Linea[5] := Datos[I].Titulo;
    Linea[6] := DateTimeToStr(Datos[I].Fecha);
    Linea[7] := Datos[I].Descripcion;
    if (FiltroCategoria = '') then
    begin
      stElogGrid.InsertRowWithValues(1, Linea);
    end
    else if FiltroCategoria = Linea[3] then
    begin
      stElogGrid.InsertRowWithValues(1, Linea);
    end;
  end;
end;

procedure TElogGridFrm.Pruebas(Datos: TElog; FiltroCategoria: string);
var
  Linea: array  [1..7] of string;
  I: integer;
begin
  Clear;
  with Datos do
  begin
    for I := 0 to Elog.Count - 1 do
    begin
      Linea[1] := IntToStr(Elog[I].SeqNo);
      Linea[2] := Elog[I].Tipo;
      Linea[3] := Elog[I].Categoria;
      Linea[4] := IntToStr(Elog[I].Codigo);
      Linea[5] := Elog[I].Titulo;
      Linea[6] := DateTimeToStr(Elog[I].Fecha);
      Linea[7] := Elog[I].Descripcion;
      if (FiltroCategoria = '') then
      begin
        stElogGrid.InsertRowWithValues(1, Linea);
      end
      else if FiltroCategoria = Linea[3] then
      begin
        stElogGrid.InsertRowWithValues(1, Linea);
      end;
    end;
  end;

end;

procedure TElogGridFrm.Clear;
begin
  stElogGrid.RowCount := 1;
end;

end.
