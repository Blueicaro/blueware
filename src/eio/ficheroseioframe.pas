unit FicherosEioFrame;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, Dialogs, rw6_eio, paramcomun;

type


  { TEioFile }

  TEioFile = class
  private
    FEio6: TEioRw6;
    Fid: integer;
    //Contiene el nombre, sino se ha guardado o cargado. Sino contiene
    //el nombre con la ruta completa
    Fruta: string;
  public
    property Eio6: TEioRw6 read FEio6 write FEio6;
    property id: integer read Fid write Fid;
    property ruta: string read Fruta write Fruta;
  public
    constructor Create;
    destructor Destroy; override;
  end;

type

  { TEioFicherosFrm }

  TEioFicherosFrm = class(TFrame)
    SaveDialog1: TSaveDialog;
    trvLista: TTreeView;
    procedure FrameClick(Sender: TObject);
    procedure trvListaClick(Sender: TObject);
    procedure trvListaDeletion(Sender: TObject; Node: TTreeNode);
  private
    function ExisteEio(aEioName: string): boolean;
  public
    function LimiteDeArchivo: boolean;
    procedure CargarArchivo(Archivo: TFileName);
    procedure NuevoArchivoEio;
    function NuevoEio(aEioNombre: string): integer;
    function InsertarSenales(aIdEio: integer; aSignalList: TSignalList): boolean;
    function GetId(aEioNombre: string): integer;
    function ListaNombresSinRuta: TStringList;
    procedure BorrarEio; //Elimina el eio seleccionado del treeview
  public
    procedure ActualizarMenus;
    procedure ExportarEio;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses LazFileUtils,
  entradassalidasgrid,
  entradassistemagrid,
  salidassistemagrid,
  crossconnexiongrid,
  ActnList
  {$IFDEF DEBUG}
  ,LazLogger
  {$ENDIF};

var
  RootLocal: TTreeNode;
  MaxArchivos, ArchivoActual: integer;
  GridSenales: TEntradasSalidasFrm;
  GridEntradasSistema: TEntradassistemaFrame;
  GridSalidasSistema: Tsalidassistemaframe;
  CrossConexions: TCrossConexionFrame;

  {$R *.lfm}

  { TEioFile }

constructor TEioFile.Create;
begin
  FEio6 := TEioRw6.Create;

end;

destructor TEioFile.Destroy;
begin
  FreeAndNil(FEio6);
  inherited Destroy;
end;

{ TEioFicherosFrm }

procedure TEioFicherosFrm.trvListaDeletion(Sender: TObject; Node: TTreeNode);
begin
  TEioFile(Node.Data).Free;
end;

{ #todo : Pendiente de implementar }
procedure TEioFicherosFrm.ActualizarMenus;
var
  Nodo: TTreeNode;
begin

  if trvLista.Selected = nil then
  begin
    exit;
  end;
  Nodo := trvLista.Selected;

end;

function TEioFicherosFrm.ExisteEio(aEioName: string): boolean;
var
  N: TTreeNode;
  I: integer;
  Info: TEioFile;
begin
  Result := False;
  N := trvLista.Items.FindNodeWithText('Local');
  if N = nil then
  begin
    exit;
  end;
  I := 0;
  while I < N.Count do
  begin
    Info := TEioFile(N.Items[I].Data);
    if info <> nil then
    begin
      {$IFDEF MSWINDOWS}
      if uppercase(Info.ruta) = UpperCase(aEioName) then
      begin
        Result := True;
        I := N.Count;
      end;
      {$ENDIF}
      {$IFDEF UNIX}
         if Info.ruta = aEioName then
      begin
        Result := True;
        I := N.Count;
      end;
      {$ENDIF}

    end;
    I := I + 1;
  end;
end;

function TEioFicherosFrm.LimiteDeArchivo: boolean;
begin
  Result := False;
  if ArchivoActual > MaxArchivos then
  begin
    ShowMessage('Máximo de archivos abiertos');
    Result := True;
  end;
end;

procedure TEioFicherosFrm.trvListaClick(Sender: TObject);
var
  Padre, Raiz, NodoActual: TTreeNode;
  Datos: TEioFile;
  IdNodoActual: integer;
begin
  ActualizarMenus;
  if trvLista.Selected = nil then
  begin
    exit;
  end;
  if trvLista.Selected.Parent = nil then
  begin
    exit;
  end;
  Padre := trvLista.Selected.Parent;
  if Padre.Data = nil then
  begin
    exit;
  end;
  Datos := TEioFile(Padre.Data);


  case trvLista.Selected.Text of
    'Señales':
    begin
      if GridSenales = nil then
      begin
        GridSenales := TEntradasSalidasFrm.Create(Self);
        GridSenales.parent := Self;
        GridSenales.LlenarGrid(Datos.Eio6.SignalList);
        GridSenales.id := Datos.id;
      end;
      if GridSenales.id <> Datos.id then
      begin
        //Localizar Nodo Original y modificar sus datos
        Raiz := trvLista.Items.FindNodeWithText('Local');
        if Raiz <> nil then
        begin
          NodoActual := Raiz.GetFirstChild;
          while NodoActual <> nil do
          begin
            if (NodoActual.Data <> nil) then
            begin
              IdNodoActual := TEioFile(NodoActual.Data).id;
              if IdNodoActual = Datos.id then
              begin
                TEioFile(NodoActual.Data).Eio6.Add(GridSenales.Info);
              end;
            end;
            NodoActual := Raiz.GetNextChild(NodoActual);
          end;
          //  GridSenales.LlenarGrid(Datos.Eio6.SignalList);
          GridSenales.id := Datos.id;
        end;
      end;
      GridSenales.LlenarGrid(Datos.Eio6.SignalList);
      GridSenales.BringToFront;
    end;
    'Entradas de sistema':
    begin
      if GridEntradasSistema = nil then
      begin
        GridEntradasSistema := TEntradassistemaFrame.Create(Self);
        GridEntradasSistema.Parent := Self;
        GridEntradasSistema.LlenarGrid(Datos.Eio6.SysInputtList);
        GridEntradasSistema.id := Datos.id;
      end;
      if GridEntradasSistema.id <> Datos.id then
      begin
        //Localizar Nodo Original y modidicar sus datos
        Raiz := trvLista.Items.FindNodeWithText('Local');
        if Raiz <> nil then
        begin
          NodoActual := Raiz.GetFirstChild;
          while NodoActual <> nil do
          begin
            if (NodoActual.Data <> nil) then
            begin
              IdNodoActual := TEioFile(NodoActual.Data).id;
              if IdNodoActual = Datos.id then
              begin
                TEioFile(NodoActual.Data).Eio6.Add(GridEntradasSistema.Info);
              end;
            end;
            NodoActual := Raiz.GetNextChild(NodoActual);
          end;
          GridEntradasSistema.LlenarGrid(Datos.Eio6.SysInputtList);
          GridEntradasSistema.id := Datos.id;
        end;
      end;
      GridEntradasSistema.BringToFront;
    end;
    'Salidas de Sistema':
    begin
      if GridSalidasSistema = nil then
      begin
        GridSalidasSistema := Tsalidassistemaframe.Create(Self);
        GridSalidasSistema.Parent := Self;
        GridSalidasSistema.LlenarGrid(Datos.Eio6.SysOutPutList);
        GridSalidasSistema.id := Datos.id;
      end;

      if GridSalidasSistema.id <> Datos.id then
      begin
        //Localizar Nodo Original y modidicar sus datos
        Raiz := trvLista.Items.FindNodeWithText('Local');
        if Raiz <> nil then
        begin
          NodoActual := Raiz.GetFirstChild;
          while NodoActual <> nil do
          begin
            if (NodoActual.Data <> nil) then
            begin
              IdNodoActual := TEioFile(NodoActual.Data).id;
              if IdNodoActual = Datos.id then
              begin
                TEioFile(NodoActual.Data).Eio6.Add(GridSalidasSistema.Info);
              end;
            end;
            NodoActual := Raiz.GetNextChild(NodoActual);
          end;
          GridSalidasSistema.LlenarGrid(Datos.Eio6.SysOutPutList);
          GridSalidasSistema.id := Datos.id;
        end;
      end;
      GridSalidasSistema.BringToFront;
    end;
    'Conexiones Cruzadas':
    begin
      if CrossConexions = nil then
      begin
        CrossConexions := TCrossConexionFrame.Create(Self);
        CrossConexions.Parent := Self;
        CrossConexions.LlenarGrid(Datos.Eio6.CrossConnectionList);
        CrossConexions.id := Datos.id;
      end;
      if CrossConexions.id <> Datos.id then
      begin
        //Localizar Nodo Original y modidicar sus datos
        Raiz := trvLista.Items.FindNodeWithText('Local');
        if Raiz <> nil then
        begin
          NodoActual := Raiz.GetFirstChild;
          while NodoActual <> nil do
          begin
            if (NodoActual.Data <> nil) then
            begin
              IdNodoActual := TEioFile(NodoActual.Data).id;
              if IdNodoActual = Datos.id then
              begin
                TEioFile(NodoActual.Data).Eio6.Add(CrossConexions.Info);
              end;
            end;
            NodoActual := Raiz.GetNextChild(NodoActual);
          end;
          CrossConexions.LlenarGrid(Datos.Eio6.CrossConnectionList);
          CrossConexions.id := Datos.id;
        end;
      end;
      CrossConexions.BringToFront;
    end;
  end;

end;

procedure TEioFicherosFrm.FrameClick(Sender: TObject);
begin

end;

procedure TEioFicherosFrm.CargarArchivo(Archivo: TFileName);
var
  Nombre: TFileName;
  Datos: TEioFile;
  Nodo: TTreeNode;
begin
  if LimiteDeArchivo then
  begin
    exit;
  end;
  if ExisteEio(Archivo) then
  begin
    { #note : Mejorar diseño/estilo mensaje }
    ShowMessage('El archivo ya está cargado');
    Exit;
  end;


  try
    Nombre := ExtractFileName(Archivo);
    Nombre := ExtractFileNameWithoutExt(Nombre);

    Datos := TEioFile.Create;
    Datos.id := ArchivoActual;
    Datos.ruta := Archivo;

    try
      Datos.Eio6.LoadFromFile(Archivo);
     except
      on E: EEioError do
      begin
        FreeAndNil(Datos);
        ShowMessage(E.Message);
        exit;
      end;
    end;
    Nodo := trvLista.Items.AddChildObject(RootLocal, Nombre, Datos);
    with trvLista.Items do
    begin
      AddChild(Nodo, 'Conexiones Cruzadas');
      AddChild(Nodo, 'Entradas de sistema');
      AddChild(Nodo, 'Salidas de Sistema');
      AddChild(Nodo, 'Redes');
      AddChild(Nodo, 'Señales');
    end;
    ArchivoActual := ArchivoActual + 1;
  finally
    trvLista.FullExpand;
    ActualizarMenus;
  end;

end;


procedure TEioFicherosFrm.NuevoArchivoEio;
var
  Datos: TEioFile;
  Nodo: TTreeNode;
  nombre: string;
begin
  if ArchivoActual > MaxArchivos then
  begin
    ShowMessage('Máximo de archivos abiertos');
    Exit;
  end;
  { #note : Quizás haya que condicionarlo por versión de EIO }
  nombre := InputBox('Nuevo EIO', 'Introduce el nombre del EIO', 'eio_new');
  if ExisteEio(nombre) then
  begin
    { #note : Mejorar diseño/estilo mensaje }
    ShowMessage('El archivo ya está cargado');
    Exit;
  end;

  Datos := TEioFile.Create;
  Datos.id := ArchivoActual;
  Datos.ruta := nombre;

  Nodo := trvLista.Items.AddChildObject(RootLocal, Nombre, Datos);
  with trvLista.Items do
  begin
    AddChild(Nodo, 'Conexiones Cruzadas');
    AddChild(Nodo, 'Entradas de sistema');
    AddChild(Nodo, 'Salidas de Sistema');
    AddChild(Nodo, 'Redes');
    AddChild(Nodo, 'Señales');
  end;
  ArchivoActual := ArchivoActual + 1;
  trvLista.FullExpand;
  ActualizarMenus;
end;

function TEioFicherosFrm.NuevoEio(aEioNombre: string): integer;
var
  Datos: TEioFile;
  Nodo: TTreeNode;
begin

  if ArchivoActual > MaxArchivos then
  begin
    ShowMessage('Máximo de archivos abiertos');
    Exit(-1);
  end;

  if ExisteEio(aEioNombre) then
  begin
    { #note : Mejorar diseño/estilo mensaje }
    ShowMessage('El archivo ya está cargado');
    Exit(-1);
  end;

  Datos := TEioFile.Create;
  Datos.id := ArchivoActual;
  Datos.ruta := aEioNombre;


  Nodo := trvLista.Items.AddChildObject(RootLocal, aEioNombre, Datos);
  with trvLista.Items do
  begin
    AddChild(Nodo, 'Conexiones Cruzadas');
    AddChild(Nodo, 'Entradas de sistema');
    AddChild(Nodo, 'Salidas de Sistema');
    AddChild(Nodo, 'Redes');
    AddChild(Nodo, 'Señales');
  end;
  ArchivoActual := ArchivoActual + 1;
  trvLista.FullExpand;
  ActualizarMenus;
  Exit(Datos.id);
end;

function TEioFicherosFrm.InsertarSenales(aIdEio: integer;
  aSignalList: TSignalList): boolean;
var
  Nodos: TTreeNodes;
  I: integer;
  Datos: TEioFile;
begin
  Result := False;
  Nodos := trvLista.Items;
  I := 0;

  while I < Nodos.Count do
  begin
    if Nodos.Item[I].Data <> nil then
    begin
      Datos := TEioFile(Nodos.Item[I].Data);
      if Datos.id = aIdEio then
      begin
        Result := True;
        Datos.Eio6.SignalList.Assign(aSignalList);
        Break;
      end;
    end;
    I := I + 1;
  end;
end;

function TEioFicherosFrm.GetId(aEioNombre: string): integer;
var
  Nodos: TTreeNodes;
  I: integer;
begin
  Result := -1;
  if trvLista.Items = nil then
  begin
    Exit;
  end;
  Nodos := trvLista.Items;
  I := 0;
  while i < Nodos.Count - 1 do
  begin
    if Nodos.Item[I].Data <> nil then
    begin
      {$IFDEF MSWINDOWS}
      if UpperCase(TEioFile(Nodos.Item[I].Data).Fruta) = (UpperCase(aEioNombre)) then
      begin
        Result := TEioFile(Nodos.Item[I].Data).id;
        Break;
      end;
      {$ENDIF}
      {$IFDEF LINUX}
         if TEioFile(Nodos.Item[I].Data).Fruta = aEioNombre then
      begin
        Result := TEioFile(Nodos.Item[I].Data).id;
        Break;
      end;
      {$ENDIF}
      if TEioFile(Nodos.Item[I].Data).Fruta = aEioNombre then
      begin
        Result := TEioFile(Nodos.Item[I].Data).id;
        Break;
      end;
    end;
    I := I + 1;
  end;
end;

function TEioFicherosFrm.ListaNombresSinRuta: TStringList;
var
  I: integer;
  ruta: string;
begin
  Result := TStringList.Create;
  for I := 0 to trvLista.Items.Count - 1 do
  begin
    if trvLista.Items[I].Data <> nil then
    begin
      ruta := TEioFile(trvLista.Items[I].Data).ruta;
      if ExtractFileDir(ruta) = '' then
      begin
        Result.Add(ruta);
      end;
    end;
  end;
end;

procedure TEioFicherosFrm.BorrarEio;
var
  nodo: TTreeNode;
  R: TModalResult;
begin
  if trvLista.Selected = nil then exit;
  nodo := trvLista.Selected;
  if nodo.Level = 1 then
  begin
    R := MessageDlg('Borrar Eio', '¿Deseas borrar el EIO: ' +
      nodo.Text + '?', mtConfirmation, mbYesNo, 0);
    if R = mrYes then
    begin
      nodo.Delete;
    end;
  end;
end;

procedure TEioFicherosFrm.ExportarEio;
var
  Nodo: TTreeNode;
  Data: TEioFile;
begin
  //Por si acaso
  if trvLista.Selected = nil then
  begin
    Exit;
  end;
  Nodo := trvLista.Selected;

  if (nodo.Level > 0) then
  begin

    if Nodo.HasChildren then
    begin
      ShowMessage('Exportar todo sin implementar');
    end
    else
    begin
      if Nodo.Parent.Data <> nil then
      begin

        if SaveDialog1.Execute then
        begin
          Data := TEioFile(Nodo.Parent.Data);
          case Nodo.Text of
            'Señales':
            begin
              Data.Eio6.SignalList.Exportar(SaveDialog1.FileName);
            end
            else
              ShowMessage('Opción sin implementar');
          end;

        end;

        //Exportar elemento seleccionado

      end;
    end;
  end;

end;

constructor TEioFicherosFrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  RootLocal := trvLista.Items.Add(nil, 'Local');
  MaxArchivos := 255;
  ArchivoActual := 0;
end;

destructor TEioFicherosFrm.Destroy;
begin
  inherited Destroy;
end;

end.
