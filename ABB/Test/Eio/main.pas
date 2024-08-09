unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  FicherosEioFrame;

type

  { Tmainfrm }

  Tmainfrm = class(TForm)
    acOpenEio: TAction;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    mnOpenEio: TMenuItem;
    mnClose: TMenuItem;
    OpenDialog1: TOpenDialog;
    Separator1: TMenuItem;
    procedure acOpenEioExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnCloseClick(Sender: TObject);
  private

  public

  end;

var
  mainfrm: Tmainfrm;
  EioFiles : TEioFicherosFrm;
implementation

{$R *.lfm}

{ Tmainfrm }

procedure Tmainfrm.FormCreate(Sender: TObject);
begin
  EioFiles := TEioFicherosFrm.Create(Self);
  EioFiles.Parent := Self;
  EioFiles.Show;
end;

procedure Tmainfrm.acOpenEioExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    EioFiles.CargarArchivo(OpenDialog1.FileName);
  end;
end;

procedure Tmainfrm.mnCloseClick(Sender: TObject);
begin
  Close;
end;

end.

