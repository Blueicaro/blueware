unit moduloaccionesunit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ActnList;

type

  { TModuloAcciones }

  TModuloAcciones = class(TDataModule)
    acExportar: TAction;
    acGuardar: TAction;
    acGuardarTodos: TAction;
    acDesplazar: TAction;
  private

  public

  end;

var
  ModuloAcciones: TModuloAcciones;

implementation

{$R *.lfm}

end.

