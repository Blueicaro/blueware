unit eioArbolFrame;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls;

type

  { TEioArbolFrm }

  TEioArbolFrm = class(TFrame)
    trArbolSeccionesEio: TTreeView;
  private

  public
    procedure CargarArchivo(FileName: TFileName);
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses
  rw6_eio;

var
  Eio6: TEioRw6;

{$R *.lfm}

{ TEioArbolFrm }

procedure TEioArbolFrm.CargarArchivo(FileName: TFileName);
begin
 //  Eio6.LoadFromFile(FileName);
end;

constructor TEioArbolFrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  with trArbolSeccionesEio.items do
  begin
    Add(nil, 'Conexiones Cruzadas');
    Add(nil, 'Entradas de sistema');
    Add(nil, 'Salidas de Sistema');
    Add(nil, 'Redes');
    Add(nil, 'Señales');
  end;
  Eio6 := TEioRw6.Create;
end;

destructor TEioArbolFrm.Destroy;
begin
  FreeAndNil(Eio6);
  inherited Destroy;
end;

end.
