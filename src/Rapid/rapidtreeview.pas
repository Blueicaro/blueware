unit RapidTreeView;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, ExtCtrls, ExtendedTabControls;

type

  { TRapidTreeViewFrm }

  TRapidTreeViewFrm = class(TFrame)
    PageControl1: TPageControl;
    ContenedorEditores: TPanel;
    Splitter1: TSplitter;
    tabBackups: TTabSheet;
    tabPrograms: TTabSheet;
    tabModules: TTabSheet;
    trvBackups: TTreeView;
    trvPrograms: TTreeView;
    trvModules: TTreeView;
    procedure trvModulesClick(Sender: TObject);
  private
    ListaModules: TStringList;
    ContadorEditores: integer; //Número de editores creados
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure CargarModulo(Filename: TFileName);
  end;

implementation

uses editmodule;

  {$R *.lfm}

  { TRapidTreeViewFrm }

procedure TRapidTreeViewFrm.trvModulesClick(Sender: TObject);
var
  Editor: TEditModuleFrm;
begin
  if trvModules.Selected = nil then
  begin
    Exit;
  end;

  if trvModules.Selected.Data <> nil then
  begin
    Editor := TEditModuleFrm(trvModules.Selected.Data);
    Editor.BringToFront;
  end;
end;

constructor TRapidTreeViewFrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  ListaModules := TStringList.Create;
  ContadorEditores := 0;
end;

destructor TRapidTreeViewFrm.Destroy;
begin
  FreeAndNil(ListaModules);
  inherited Destroy;
end;

procedure TRapidTreeViewFrm.CargarModulo(Filename: TFileName);
var
  Editor: TEditModuleFrm;
begin
  try
    ContadorEditores := ContadorEditores + 1;
    Editor := TEditModuleFrm.Create(Self);
    Editor.Name := 'EditModulefrm' + IntToStr(ContadorEditores);
    Editor.Parent := ContenedorEditores;
    Editor.Align := alClient;
    Editor.LoadModule(FileName);
    Editor.BringToFront;
    trvModules.Items.AddObject(nil, ExtractFileName(Filename), Editor);
  finally
    ListaModules.Add(Filename);
  end;
end;

end.
