unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ValEdit,
  StdCtrls, gridclass;

type

  { TmainForm }

  TmainForm = class(TForm)
    ButtonCargar: TButton;
    ButtonGuardar: TButton;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    ValueListEditor1: TValueListEditor;
    procedure ButtonCargarClick(Sender: TObject);
    procedure ButtonGuardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    myGridClass: TGridClass;
    procedure MostrarDatos;
  public

  end;

var
  mainForm: TmainForm;

implementation

{$R *.lfm}

{ TmainForm }

procedure TmainForm.FormCreate(Sender: TObject);
begin
  myGridClass := TGridClass.Create;
end;

procedure TmainForm.ButtonCargarClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    myGridClass.Load(OpenDialog1.FileName);
    MostrarDatos;
  end;
end;

procedure TmainForm.ButtonGuardarClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    myGridClass.Save(SaveDialog1.FileName);
  end;
end;

procedure TmainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(myGridClass);
end;

procedure TmainForm.MostrarDatos;
var
  I: integer;
begin
  ValueListEditor1.Clear;
  for I := 0 to myGridClass.ListaPropiedades.Count - 1 do
  begin
    with myGridClass.ListaPropiedades[I] do
    begin
      ValueListEditor1.InsertRow(NombreColumna, NombrePropiedad, True);
    end;
  end;
end;

end.
