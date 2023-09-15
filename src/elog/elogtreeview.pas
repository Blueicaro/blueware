unit ElogTreeView;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, ExtCtrls, ElogUnit;

type

  { TElogTreeViewFrm }

  TElogTreeViewFrm = class(TFrame)
    Splitter1: TSplitter;
    trvElog: TTreeView;
    procedure trvElogClick(Sender: TObject);
    procedure trvElogDeletion(Sender: TObject; Node: TTreeNode);
  private
    RootLocal: TTreeNode;
    ListaArchivos: TStringList;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure CargarElog(ElogFile: TFileName);
    procedure ShowPropierties;
    procedure DeletePropierties;
    procedure BorrarElemento;
  public
    function ExisteArchivo(Fichero: TFileName): boolean;
  end;

implementation

uses  eloggrid, ElogPropiedades;

var
  GridFrm: TElogGridFrm;
  ELogPropiedadesFrm: TElogPropiedadesfrm;

  {$R *.lfm}

  { TElogTreeViewFrm }

procedure TElogTreeViewFrm.trvElogClick(Sender: TObject);
var
  Datos: TElog;
begin
  if trvElog.Selected = nil then
  begin
    Exit;
  end;
  if trvElog.Selected.HasChildren = False then
  begin
    if trvElog.Selected.Parent.Data <> nil then
    begin
      GridFrm.Llenar(TElog(trvElog.Selected.Parent.Data).Elog, trvElog.Selected.Text);
    end;
  end
  else
  //Si tiene 7 hijos
  if trvElog.Selected.Count = 7 then
  begin

    if trvElog.Selected.Data <> nil then
    begin
      GridFrm.Pruebas(TElog(trvElog.Selected.Data));
    end;
  end;
end;

procedure TElogTreeViewFrm.trvElogDeletion(Sender: TObject; Node: TTreeNode);
var
  Posicion: integer;
begin
  if Node.Data <> nil then
  begin
    if Assigned(ListaArchivos) then
    begin
      if ListaArchivos.Find(TElog(Node.Data).Fichero, Posicion) then
      begin
        ListaArchivos.Delete(Posicion);
      end;
    end;
  end;
  TElog(Node.Data).Free;
end;

procedure TElogTreeViewFrm.BorrarElemento;
begin
  if trvElog.Selected = nil then
  begin
    Exit;
  end;
  if trvElog.Selected.Data <> nil then
  begin
    if GridFrm <> nil then
    begin
      GridFrm.Clear;
    end;
    if ELogPropiedadesFrm <> nil then
    begin
      FreeAndNil(ELogPropiedadesFrm);
    end;
    trvElog.Selected.Delete;
  end;
  if trvElog.Items.Count < 2 then
  begin
    Self.Hide;
  end;
end;

function TElogTreeViewFrm.ExisteArchivo(Fichero: TFileName): boolean;
var
  Dummy: integer;
begin
  Result := ListaArchivos.Find(Fichero, Dummy);
end;

constructor TElogTreeViewFrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  RootLocal := trvElog.Items.Add(nil, 'Local');
  ListaArchivos := TStringList.Create;
  ListaArchivos.Sorted := True;
end;

destructor TElogTreeViewFrm.Destroy;
begin
  FreeAndNil(ListaArchivos);
  inherited Destroy;
end;

procedure TElogTreeViewFrm.CargarElog(ElogFile: TFileName);
var
  lsCategorias: TStringList;
  I: integer;
  NodoActual: TTreeNode;
  LoadElog: TElog;
begin

  LoadElog := TElog.Create;
  try
    LoadElog.ReadElogFile(ElogFile);
    //NodoActual := trvElog.Items.AddChild(RootLocal, ExtractFileName(ElogFile));
    NodoActual := trvElog.Items.AddChildObject(
      RootLocal, ExtractFileName(ElogFile), LoadElog);
    lsCategorias := LoadElog.ListaCategorias;
    for I := 0 to lsCategorias.Count - 1 do
    begin
      trvElog.Items.AddChild(NodoActual, lsCategorias[I]);
    end;
    FreeAndNil(lsCategorias);
    if GridFrm = nil then
    begin
      GridFrm := TElogGridFrm.Create(Self);
      GridFrm.Align := alClient;
      GridFrm.Parent := Self;
    end;
    GridFrm.SetCabecera(LoadElog.Elog.Cabecera);
    GridFrm.Llenar(LoadElog.Elog);
    GridFrm.BringToFront;
  finally
    ListaArchivos.Add(ElogFile);
    Show;
  end;
end;

procedure TElogTreeViewFrm.ShowPropierties;
begin
  if trvElog.Selected = nil then
  begin
    Exit;
  end;
  if ELogPropiedadesFrm <> nil then
  begin
    FreeAndNil(ELogPropiedadesFrm);
    exit;
  end;
  if (trvElog.Selected.HasChildren = True) and (trvElog.Selected.Data <> nil) then
  begin
    if ELogPropiedadesFrm = nil then
    begin
      ELogPropiedadesFrm := TElogPropiedadesfrm.Create(Self);
      ELogPropiedadesFrm.Parent := Self;
      ELogPropiedadesFrm.Align := alRight;
    end;
    ELogPropiedadesFrm.MostrarDatos(TElog(trvElog.Selected.Data));
    ELogPropiedadesFrm.BringToFront;
  end;

end;

procedure TElogTreeViewFrm.DeletePropierties;
begin
  if ELogPropiedadesFrm <> nil then
  begin
    FreeAndNil(ELogPropiedadesFrm);
  end;
end;

end.
