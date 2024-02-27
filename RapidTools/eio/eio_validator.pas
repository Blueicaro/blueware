unit eio_validator;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils, rw6_eio;

type

  { iEioValidator }

  iEioValidator = class
  private
    FListaErrores: TStringList;
  public
    function validar: boolean; virtual; abstract;
    procedure ListaErrores(var ListaErrores: TStringList); virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
  end;

type

  { EioValidorRw6 }

  EioValidorRw6 = class(iEioValidator)
  private
    FEio: TEioRw6;
  public
    function validar: boolean; override;
    procedure ListaErrores(var ListaErrores: TStringList); override;
  public
    constructor Create(Eio: TEioRw6);
    destructor Destroy; override;
  end;

implementation

{ iEioValidator }

constructor iEioValidator.Create;
begin
  FListaErrores := TStringList.Create;
end;

destructor iEioValidator.Destroy;
begin
  FreeAndNil(FListaErrores);
  inherited Destroy;
end;



{ EioValidorRw6 }

function EioValidorRw6.validar: boolean;
var
  lsNombre: TStringList;
begin
  Result := False;
  //Nombres de senales duplicados
  lsNombre := TStringList.Create;
  try
    try
      lsNombre.Sorted := True;
      lsNombre.Duplicates := dupError;

    except
      begin
        FListaErrores.Add('Nombre de señal duplicado: '+Cadena);
      end;
    end;
  finally
Free;
  end;
end;

procedure EioValidorRw6.ListaErrores(var ListaErrores: TStringList);
begin
  ListaErrores.Assign(FListaErrores);
end;

constructor EioValidorRw6.Create(Eio: TEioRw6);
begin
  inherited Create;
  FEio := TEioRw6.Create;
  FEio := Eio;
end;

destructor EioValidorRw6.Destroy;
begin
  FreeAndNil(FEio);
  inherited Destroy;
end;

end.
