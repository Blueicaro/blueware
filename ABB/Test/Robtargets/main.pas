unit main;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
ComCtrls, Modules;

type

  { Tmainfrm }

  Tmainfrm = class(TForm)
    acAbrir: TAction;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OpenDialog1: TOpenDialog;
    Separator1: TMenuItem;
    menuSalir: TMenuItem;
    StatusBar1: TStatusBar;
    procedure acAbrirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure menuSalirClick(Sender: TObject);
  private
         Modulo : TModule;
  public

  end;

var
  mainfrm: Tmainfrm;

implementation

{$R *.lfm}

{ Tmainfrm }

procedure Tmainfrm.menuSalirClick(Sender: TObject);
begin
  Close;
end;

procedure Tmainfrm.acAbrirExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    StatusBar1.SimpleText:='Cargando módulo: '+ExtractFileName(OpenDialog1.FileName);
    Application.ProcessMessages;
    Modulo.CargarModulo(OpenDialog1.FileName);
    StatusBar1.SimpleText:='Módulo cargado: '+ExtractFileName(OpenDialog1.FileName);
  end;
end;

procedure Tmainfrm.FormCreate(Sender: TObject);
begin
  Modulo := TModule.Create;
end;

procedure Tmainfrm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Modulo);
end;

end.

