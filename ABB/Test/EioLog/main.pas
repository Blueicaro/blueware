unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  ComCtrls, usplashabout, elogframe;

type

  { Tmainfrm }

  Tmainfrm = class(TForm)
    acAbrir: TAction;
    acSalir: TAction;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    Archivo: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    OpenDialog1: TOpenDialog;
    Separator1: TMenuItem;
    SplashAbout1: TSplashAbout;
    TreeViewCategorias: TTreeView;
    procedure acAbrirExecute(Sender: TObject);
    procedure acSalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure TreeViewCategoriasClick(Sender: TObject);
  private
    procedure CrearArbol(Nombre: string);
  public

  end;

var
  mainfrm: Tmainfrm;
  Elog: TElogFrm;

implementation

{$R *.lfm}

{ Tmainfrm }

procedure Tmainfrm.acSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure Tmainfrm.FormCreate(Sender: TObject);
begin
  Elog := TElogFrm.Create(Self);
  Elog.Parent := Self;
  Elog.Align := alClient;
  Elog.Show;
  Elog.BringToFront;
end;

procedure Tmainfrm.MenuItem1Click(Sender: TObject);
begin
  SplashAbout1.ShowAbout;
end;

procedure Tmainfrm.TreeViewCategoriasClick(Sender: TObject);
begin
  if TreeViewCategorias.Selected = nil then
  begin
    exit;
  end;
  if TreeViewCategorias.Selected.HasChildren then
  begin
    Elog.ResetFiltro;
  end
  else
  begin
    Elog.FiltroCategoria(TreeViewCategorias.Selected.Text);
  end;

end;

procedure Tmainfrm.CrearArbol(Nombre: string);
var
  Raiz: TTreeNode;
  lsCategoria: TStringList;
  I: integer;
begin
  TreeViewCategorias.Items.Clear;
  Raiz := TreeViewCategorias.Items.Add(nil, Nombre);
  lsCategoria := Elog.Elog.ListaCategorias;
  for I := 0 to lsCategoria.Count - 1 do
  begin
    TreeViewCategorias.Items.AddChild(Raiz, lsCategoria[I]);
  end;
  FreeAndNil(lsCategoria);
  TreeViewCategorias.FullExpand;
end;

procedure Tmainfrm.acAbrirExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Elog.LeerElog(OpenDialog1.FileName);
    CrearArbol(ExtractFileName(OpenDialog1.FileName));
  end;
end;

end.
