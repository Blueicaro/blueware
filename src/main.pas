unit main;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, ComCtrls,
  SpkToolbar, spkt_Tab, spkt_Pane, spkt_Buttons;

type

  { Tmainfrm }

  Tmainfrm = class(TForm)
    acAbrirEio: TAction;
    acAbrirElog: TAction;
    AccionesEio: TActionList;
    acDesplazar: TAction;
    acElogRemoto: TAction;
    acExportar: TAction;
    acGuardar: TAction;
    acGuardarTodos: TAction;
    acImportarEio1: TAction;
    acNuevoEio: TAction;
    acBorrarEio: TAction;
    acImportarEio: TAction;
    acOpenProgram: TAction;
    acDeleteElog: TAction;
    acOpenModule: TAction;
    acOpenBackup: TAction;
    acCrossTablaVerdad: TAction;
    acAsteriscos: TAction;
    ElogShowProperties: TAction;
    ActionList1: TActionList;
    AccionesRapid: TActionList;
    OpenDialog1: TOpenDialog;
    spkEioLocal: TSpkLargeButton;
    SpkLargeButton1: TSpkLargeButton;
    SpkLargeButton10: TSpkLargeButton;
    SpkLargeButton11: TSpkLargeButton;
    spkOpenBackup: TSpkLargeButton;
    spkOpenProgram: TSpkLargeButton;
    spkOpenModule: TSpkLargeButton;
    SpkLargeButton13: TSpkLargeButton;
    spkLargeDeleteElog: TSpkLargeButton;
    SpkLargeButton15: TSpkLargeButton;
    SpkLargeButton16: TSpkLargeButton;
    SpkLargeButton17: TSpkLargeButton;
    SpkLargeButton18: TSpkLargeButton;
    SpkLargeButton2: TSpkLargeButton;
    SpkLargeButton3: TSpkLargeButton;
    SpkLargeButton4: TSpkLargeButton;
    SpkLargeButton5: TSpkLargeButton;
    SpkLargeButton6: TSpkLargeButton;
    SpkLargeButton7: TSpkLargeButton;
    SpkLargeButton8: TSpkLargeButton;
    SpkLargeButton9: TSpkLargeButton;
    SpkPane1: TSpkPane;
    SpkPane2: TSpkPane;
    SpkPane3: TSpkPane;
    SpkPane4: TSpkPane;
    SpkPane5: TSpkPane;
    SpkPane6: TSpkPane;
    EioTab: TSpkTab;
    spkRapidFile: TSpkPane;
    SpkTab1: TSpkTab;
    SpkTab2: TSpkTab;
    SpkTab4: TSpkTab;
    SpkToolbar1: TSpkToolbar;
    procedure acAbrirEioExecute(Sender: TObject);
    procedure acAbrirElogExecute(Sender: TObject);
    procedure acAsteriscosExecute(Sender: TObject);
    procedure acBorrarEioExecute(Sender: TObject);
    procedure acCrossTablaVerdadExecute(Sender: TObject);
    procedure acDeleteElogExecute(Sender: TObject);
    procedure acElogRemotoExecute(Sender: TObject);
    procedure acExportarExecute(Sender: TObject);
    procedure acGuardarExecute(Sender: TObject);
    procedure acImportarEio1Execute(Sender: TObject);
    procedure acImportarEioExecute(Sender: TObject);
    procedure acNuevoEioExecute(Sender: TObject);
    procedure acOpenModuleExecute(Sender: TObject);
    procedure EioTabClick(Sender: TObject);
    procedure ElogShowPropertiesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    procedure Inactivo(Sender: TObject; var done: boolean);
  public

  end;

var
  mainfrm: Tmainfrm;

implementation

uses importareiodlg,
  nombreimportareio,
  FicherosEioFrame,
  ElogTreeView,
  RapidTreeView;

var
  Eio: TEioFicherosFrm;
  Elog: TElogTreeViewFrm;
  Rapid: TRapidTreeViewFrm;

  {$R *.lfm}

  { Tmainfrm }

procedure Tmainfrm.acElogRemotoExecute(Sender: TObject);
begin

end;

procedure Tmainfrm.acExportarExecute(Sender: TObject);
begin
  //por si acaso
  if Eio = nil then
  begin
    Exit;
  end;
  Eio.BringToFront;
  Eio.ExportarEio;
end;

procedure Tmainfrm.acGuardarExecute(Sender: TObject);
begin

end;

procedure Tmainfrm.acAbrirEioExecute(Sender: TObject);
begin
  //Preparar Dialog
  OpenDialog1.Title := 'Abrir un archivo EIO';
  { #todo -cElog : Ajustar filtros }
  if OpenDialog1.Execute then
  begin
    if Eio = nil then
    begin
      Eio := TEioFicherosFrm.Create(Self);
      Eio.Parent := Self;
      Eio.CargarArchivo(OpenDialog1.FileName);
    end
    else
    begin
      Eio.CargarArchivo(OpenDialog1.FileName);
      Eio.BringToFront;
    end;
  end;
end;

procedure Tmainfrm.acAbrirElogExecute(Sender: TObject);
begin
  if Elog = nil then
  begin
    if OpenDialog1.Execute then
    begin
      Elog := TElogTreeViewFrm.Create(Self);
      Elog.Parent := mainfrm;
      Elog.CargarElog(OpenDialog1.FileName);
      Elog.BringToFront;
    end;
  end
  else
  begin
    if OpenDialog1.Execute then
    begin
      if Elog.ExisteArchivo(OpenDialog1.FileName) = False then
      begin
        Elog.CargarElog(OpenDialog1.FileName);
      end
      else
      begin
        ShowMessage('El archivo ya existe');
      end;
    end;
    Elog.BringToFront;
  end;
end;

procedure Tmainfrm.acAsteriscosExecute(Sender: TObject);
begin
  if Rapid = nil then
  begin
    Exit;
  end;
 Rapid.PuntoAsterisco;

end;

procedure Tmainfrm.acBorrarEioExecute(Sender: TObject);
begin
  if Eio = nil then
    exit;
  with Eio do
  begin
    BorrarEio;
  end;
end;

procedure Tmainfrm.acCrossTablaVerdadExecute(Sender: TObject);
begin
  { #todo : Poner comprobaciones para evitar que se ejecute sin que existan los frames }
end;

procedure Tmainfrm.acDeleteElogExecute(Sender: TObject);
begin
  if Elog <> nil then
  begin
    Elog.BorrarElemento;
  end;
end;

procedure Tmainfrm.acImportarEio1Execute(Sender: TObject);
var
  Id: integer;
  ListaNombres: TStringList;
  NombreEio: string;
  F: TImportarEioFrm;
  Dialogo: Tnombreimportareiofrm;
begin
  if Eio <> nil then
  begin
    if Eio.LimiteDeArchivo then
    begin
      exit;
    end;
  end;

  if OpenDialog1.Execute then
  begin
    try
      F := TImportarEioFrm.Create(Self);
      F.Caption := 'Importar entradas y salidas desde excel';
      F.archivo := OpenDialog1.FileName;

      if F.ShowModal = mrOk then
      begin

        try
          Dialogo := Tnombreimportareiofrm.Create(Self);

          if Eio <> nil then
          begin
            ListaNombres := Eio.ListaNombresSinRuta;
            Dialogo.cbNombre.Items.Assign(ListaNombres);
            FreeAndNil(ListaNombres);
          end;
          if Dialogo.ShowModal = mrOk then
          begin
            NombreEio := Dialogo.cbNombre.Text;
            if Eio = nil then
            begin
              Eio := TEioFicherosFrm.Create(Self);
              Eio.Parent := Self;
              Id := Eio.NuevoEio(NombreEio);
              Eio.InsertarSenales(Id, F.Eio6);
            end
            else
            begin
              Id := Eio.GetId(NombreEio);
              Eio.InsertarSenales(id, F.Eio6);
            end;
            Eio.BringToFront;
          end;
        finally

          FreeAndNil(Dialogo);
        end;

      end;
    finally
      FreeAndNil(F);
    end;
  end;
end;

procedure Tmainfrm.acImportarEioExecute(Sender: TObject);
var
  Id: integer;
  ListaNombres: TStringList;
  NombreEio: string;
  F: TImportarEioFrm;
  Dialogo: Tnombreimportareiofrm;
begin
  if Eio <> nil then
  begin
    if Eio.LimiteDeArchivo then
    begin
      exit;
    end;
  end;

  if OpenDialog1.Execute then
  begin
    try
      F := TImportarEioFrm.Create(Self);
      F.Caption := 'Importar entradas y salidas desde excel';
      F.archivo := OpenDialog1.FileName;

      if F.ShowModal = mrOk then
      begin

        try
          Dialogo := Tnombreimportareiofrm.Create(Self);

          if Eio <> nil then
          begin
            ListaNombres := Eio.ListaNombresSinRuta;
            Dialogo.cbNombre.Items.Assign(ListaNombres);
            FreeAndNil(ListaNombres);
          end;
          if Dialogo.ShowModal = mrOk then
          begin
            NombreEio := Dialogo.cbNombre.Text;
            if Eio = nil then
            begin
              Eio := TEioFicherosFrm.Create(Self);
              Eio.Parent := Self;
              Id := Eio.NuevoEio(NombreEio);
              Eio.InsertarSenales(Id, F.Eio6);
            end
            else
            begin
              Id := Eio.GetId(NombreEio);
              Eio.InsertarSenales(id, F.Eio6);
            end;
            Eio.BringToFront;
          end;
        finally

          FreeAndNil(Dialogo);
        end;

      end;
    finally
      FreeAndNil(F);
    end;
  end;
end;

procedure Tmainfrm.acNuevoEioExecute(Sender: TObject);
begin

  if Eio = nil then
  begin
    Eio := TEioFicherosFrm.Create(Self);
    Eio.Parent := Self;
  end;
  Eio.BringToFront;
  eio.NuevoArchivoEio;
end;

procedure Tmainfrm.acOpenModuleExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if Rapid = nil then
    begin
      Rapid := TRapidTreeViewFrm.Create(Self);
      Rapid.Align:=alClient;
      Rapid.Parent := Self;
    end;
    Rapid.CargarModulo(OpenDialog1.FileName);
    Rapid.BringToFront;
  end;
end;

procedure Tmainfrm.EioTabClick(Sender: TObject);
begin
  if Eio <> nil then
  begin
    Eio.BringToFront;
  end;
end;

procedure Tmainfrm.ElogShowPropertiesExecute(Sender: TObject);
begin
  if Elog <> nil then
  begin
    Elog.ShowPropierties;
  end;
end;

procedure Tmainfrm.FormCreate(Sender: TObject);
begin

  {$IFDEF FPC}
   Application.OnIdle:=@Inactivo;
  {$ELSE}
  Application.OnIdle := Inactivo;
  {$ENDIF}
end;

procedure Tmainfrm.Inactivo(Sender: TObject; var done: boolean);
var
  I: integer;
begin
  if Eio <> nil then
  begin

    for I := 0 to AccionesEio.ActionCount - 1 do
    begin
      with AccionesEio.Actions[I] as TAction do
      begin
        Enabled := True;
      end;
    end;

  end
  else
  begin

    for I := 0 to AccionesEio.ActionCount - 1 do
    begin
      with AccionesEio.Actions[I] as TAction do
      begin
        Enabled := False;
      end;

    end;
  end;
  done := True;
end;



end.
