unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  ComCtrls, elogframe;

type

  { TForm1 }

  TForm1 = class(TForm)
    acAbrir: TAction;
    acSalir: TAction;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    Archivo: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    OpenDialog1: TOpenDialog;
    Separator1: TMenuItem;
    TreeViewCategorias: TTreeView;
    procedure acAbrirExecute(Sender: TObject);
    procedure acSalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeViewCategoriasClick(Sender: TObject);
  private
    procedure CrearArbol(Nombre: string);
  public

  end;

var
  Form1: TForm1;
  Elog: TElogFrm;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.acSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Elog := TElogFrm.Create(Self);
  Elog.Parent := Self;
  Elog.Align := alClient;
  Elog.Show;
  Elog.BringToFront;
end;

procedure TForm1.TreeViewCategoriasClick(Sender: TObject);
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

procedure TForm1.CrearArbol(Nombre: string);
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

procedure TForm1.acAbrirExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Elog.LeerElog(OpenDialog1.FileName);
    CrearArbol(ExtractFileName(OpenDialog1.FileName));
  end;
end;

end.
