unit Modules;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TModule }

  TModule = class

  private
    FFichero: TStringList;
    FNombre: string;
  public
    property Fichero: TStringList read FFichero;
    property Nombre: string read FNombre;
  public
    procedure CargarModulo(FileName: TFileName);
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TModule }

procedure TModule.CargarModulo(FileName: TFileName);
begin
  FFichero.LoadFromFile(FileName);
  FNombre := FileName;
end;

constructor TModule.Create;
begin
  FFichero := TStringList.Create;
end;

destructor TModule.Destroy;
begin
  FreeAndNil(FFichero);
  inherited Destroy;
end;

end.
