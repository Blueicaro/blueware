unit importareiodlg;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  rw6_eio, fpSpreadsheet, fpsallformats, fpsTypes;

type

  { TImportarEioFrm }

  TImportarEioFrm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FicheroCargado: boolean;
    function AbrirExcel(aFichero: TFileName; var hojas: TStringList): boolean;
    procedure LeerExcell;
  public
    archivo: TFileName;
    Eio6: TSignalList;

  end;

var
  ImportarEioFrm: TImportarEioFrm;

implementation

{$R *.lfm}
uses ImportEioExcel,
  nombreimportareio;


var
  ImportarExcel: TImportEioExcelFrame;

{ TImportarEioFrm }
function TImportarEioFrm.AbrirExcel(aFichero: TFileName;
  var hojas: TStringList): boolean;
var
  WorkWook: TsWorkbook;
  I: integer;
begin

  WorkWook := TsWorkbook.Create;
  try
    WorkWook.ReadFromFile(aFichero);
    hojas.Clear;
    for I := 0 to WorkWook.GetWorksheetCount - 1 do
    begin
      Hojas.Add(WorkWook.GetWorksheetByIndex(I).Name);
    end;
  except
    Result := False;
  end;
  WorkWook.Free;
  Result := True;
end;

procedure TImportarEioFrm.FormCreate(Sender: TObject);

begin
  ImportarExcel := TImportEioExcelFrame.Create(Self);
  ImportarExcel.Parent := Self;
  Self.Height := ImportarExcel.Height;
  Self.Width := ImportarExcel.Width;
  Eio6 := TSignalList.Create;
  ImportarExcel.BringToFront;

end;

procedure TImportarEioFrm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Eio6);
end;

procedure TImportarEioFrm.FormShow(Sender: TObject);
var
  Lista: TStringList;
begin
  if FicheroCargado then
  begin
    exit;
  end;
  Lista := TStringList.Create;
  if AbrirExcel(archivo, Lista) = True then
  begin
    ImportarExcel.cbHojas.Clear;
    ImportarExcel.cbHojas.Items.Assign(Lista);
    Lista.Free;
  end
  else
  begin
    ShowMessage('No se puede abrir el archivo excel');
    Lista.Free;
    Close;
  end;

end;

procedure TImportarEioFrm.LeerExcell;
begin

end;

end.
