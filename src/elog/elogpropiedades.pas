unit ElogPropiedades;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, ElogUnit;

type

  { TElogPropiedadesfrm }

  TElogPropiedadesfrm = class(TFrame)
    trvPropiedades: TTreeView;
  public
    procedure Clear;
    procedure MostrarDatos(aElog: TElog);
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.lfm}

{ TElogPropiedadesfrm }

procedure TElogPropiedadesfrm.Clear;
begin
  trvPropiedades.Items.Clear;
end;

procedure TElogPropiedadesfrm.MostrarDatos(aElog: TElog);
var
  NodoActual: TTreeNode;
  I, x: integer;
begin
  Clear;
  with trvPropiedades do
  begin

    NodoActual := Items.Add(nil, 'Origen: ' + ExtractFileName(aElog.Fichero));
    Items.AddChild(NodoActual, aElog.Fichero);
    Items.Add(nil, 'Fecha creación: ' + DateToStr(aElog.Date));
    Items.Add(nil, 'Nombre del sistema: ' + aElog.NombreSistema);
    Items.Add(nil, 'Nombre Controlador: ' + aElog.NombreControlador);
    Items.Add(nil, 'ID Controlador: ' + aElog.IdControlador);
    Items.Add(nil, 'Robotware version: ' + aElog.RobotWare);
    Items.Add(nil, 'Clave Controlador: ' + aElog.ClaveControlador);
    NodoActual := Items.Add(nil, 'Opciones controlador');
    for I := 0 to aElog.OpcionesControlador.Count - 1 do
    begin
      Items.AddChild(NodoActual, aElog.OpcionesControlador[I]);
    end;
    for x := 0 to aElog.DriveModule.Count - 1 do
    begin
      NodoActual := items.Add(nil, aElog.DriveModule[X].Nombre);
      for I := 0 to aElog.DriveModule[X].Opciones.Count - 1 do
      begin
        items.AddChild(NodoActual, aElog.DriveModule[X].Opciones[I]);
      end;
    end;
  end;

end;

constructor TElogPropiedadesfrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
end;

destructor TElogPropiedadesfrm.Destroy;
begin
  inherited Destroy;
end;

end.
