unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OpenDialog1: TOpenDialog;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
      lsFile : TStringList;
      procedure ReadEioFile (aFileName : TFileName);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
  begin
    ReadEioFile (OpenDialog1.FileName);
  end;
end;

procedure TForm1.ReadEioFile(aFileName: TFileName);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  lsFile := TStringList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(lsFile);
end;

end.

