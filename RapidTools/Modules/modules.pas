unit Modules;
{
 Rapid Modules. Esta unidad se encarga de gestionar los módulos
}
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Rapid;

type

  { TModule }

  TModule = class

  private
    FFichero: TStringList;
    FListRoutines: TStringList;
    FNombre: string;
    FRobTargetDataList: TRobTargetDataList;
    procedure Procesar;
  public
    property Fichero: TStringList read FFichero;
    property Nombre: string read FNombre;
    property RobTargets: TRobTargetDataList
      read FRobTargetDataList write FRobTargetDataList;
  public
    procedure CargarModulo(FileName: TFileName);

    property GetListRoutinas:TStringList read FListRoutines;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses FuncionesRapid;
  { TModule }

procedure TModule.Procesar;
var
  ListaPuntos, Lista: TStringList;
  Punto: TRobTargetData;
  I: Integer;
  Cadena: String;
begin
  try
    ListaPuntos := BuscaPuntosEx(FFichero);
    for I := 0 to ListaPuntos.Count - 1 do
    begin
     Punto :=  FRobTargetDataList.Add;
     Cadena := ListaPuntos[I];
     Punto.fStrToRobTarget(ListaPuntos[I]);
    end;

  finally
    FreeAndNil(ListaPuntos);
  end;
  Lista := ListaRutinas(FFichero);
  FListRoutines.text := Lista.text;
  FreeAndNil(Lista);
end;

procedure TModule.CargarModulo(FileName: TFileName);
begin
  { #todo -oJorge -cOptimizar : Realizar la carga usando TStream }
  FFichero.LoadFromFile(FileName);
  FNombre := FileName;
  Procesar;
end;



constructor TModule.Create;
begin
  FFichero := TStringList.Create;
  FListRoutines := TStringList.Create;
  FRobTargetDataList := TRobTargetDataList.Create(TRobTargetData);
end;

destructor TModule.Destroy;
begin
  FreeAndNil(FFichero);
  FreeAndNil(FRobTargetDataList);
  FreeAndNil(FListRoutines);
  inherited Destroy;
end;

end.
