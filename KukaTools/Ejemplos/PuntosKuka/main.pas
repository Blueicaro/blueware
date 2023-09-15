unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  ComCtrls, uPoweredby, usplashabout, kukagridE6Pos;

type

  { TmainFrm }

  TmainFrm = class(TForm)
    acAbrir: TAction;
    acGuardar: TAction;
    acGuardarComo: TAction;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Separator1: TMenuItem;
    MenuItem4: TMenuItem;
    OpenDialog1: TOpenDialog;
    SplashAbout1: TSplashAbout;
    procedure acAbrirExecute(Sender: TObject);
    procedure acGuardarComoExecute(Sender: TObject);
    procedure acGuardarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);

  private
    Titulo: string;
    Frame: TkukagridE6PosFrm;
    ArchivoDat: TFileName;

  end;

var
  mainFrm: TmainFrm;

implementation

{$R *.lfm}

{ TmainFrm }


procedure TmainFrm.acAbrirExecute(Sender: TObject);
var
  Nombre: string;
begin
  if OpenDialog1.Execute then
  begin
    ArchivoDat := OpenDialog1.FileName;
    Nombre := ExtractFileName(OpenDialog1.FileName);
    Caption := Titulo + ' - ' + Nombre;
    Frame.CargarArchivo(OpenDialog1.FileName);
  end;

end;

procedure TmainFrm.acGuardarComoExecute(Sender: TObject);
begin
  with Frame do
  begin
    Guardar('d:\prueba.dat');
  end;
end;

procedure TmainFrm.acGuardarExecute(Sender: TObject);
begin

end;

procedure TmainFrm.FormCreate(Sender: TObject);
begin
  Titulo := Caption;
  Frame := TkukagridE6PosFrm.Create(Self);
  Frame.Parent := Self;
  Frame.Align := alClient;
  Frame.Top := 0;
  Frame.Width := Self.ClientWidth;
  Frame.Height := Self.ClientHeight;
  Frame.Show;
end;

procedure TmainFrm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Frame);
end;

procedure TmainFrm.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TmainFrm.MenuItem6Click(Sender: TObject);
begin
  SplashAbout1.ShowAbout;
end;

end.
