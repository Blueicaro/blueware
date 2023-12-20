unit Modules;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Rapid;

type

  { TModule }

  TModule = class

  private
    FFichero: TStringList;
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
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses FuncionesRapid;
  { TModule }

procedure TModule.Procesar;
var
  ListaPuntos: TStringList;
  Punto: TRobTargetData;
  I: Integer;
begin
  try
    ListaPuntos := BuscaPuntosEx(FFichero);
    for I := 0 to ListaPuntos.Count - 1 do
    begin
     Punto :=  FRobTargetDataList.Add;
     Punto.fStrToRobTarget(ListaPuntos[I]);
    end;

  finally
    FreeAndNil(ListaPuntos);
  end;
end;

procedure TModule.CargarModulo(FileName: TFileName);
begin
  FFichero.LoadFromFile(FileName);
  FNombre := FileName;
  Procesar;
end;

constructor TModule.Create;
begin
  FFichero := TStringList.Create;
  FRobTargetDataList := TRobTargetDataList.Create(TRobTargetData);
end;

destructor TModule.Destroy;
begin
  FreeAndNil(FRobTargetDataList);
  FreeAndNil(FFichero);
  inherited Destroy;
end;

end.
