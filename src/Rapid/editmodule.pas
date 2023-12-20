unit editmodule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, Modules;

type

  { TEditModuleFrm }

  TEditModuleFrm = class(TFrame)
    Memo: TMemo;
  private
    FModule: TModule;
  public
    procedure LoadModule(Filename: TFileName);
    procedure PonerAsteriscos;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses FuncionesRapid, LazLogger;

  {$R *.lfm}

  { TEditModuleFrm }

procedure TEditModuleFrm.LoadModule(Filename: TFileName);
begin
  FModule.CargarModulo(Filename);
  Memo.Lines.Text := FModule.Fichero.Text;
end;

procedure TEditModuleFrm.PonerAsteriscos;
const
  Ordenes: array [1..2] of string = ('movej', 'movel');
var
  Puntos, Temp: TStringList;
  I, Indice: integer;
  Cadena, Nombre, Valor: string;
begin
  Temp := TStringList.Create;
  try
    Temp.Clear;
    Temp.Sorted := True;
    Temp.Duplicates := dupIgnore;
    for I := 0 to Memo.Lines.Count - 1 do
    begin
      Cadena := Memo.Lines[I];
      Valor := '';
      Nombre := '';
      if EsOrdenMovimiento(Cadena, Ordenes, Nombre, Valor) then
      begin
        if Nombre <> '*' then
        begin
          Indice := 0;
          if FModule.RobTargets.FindRobTarget(Nombre, Indice) then
          begin
            Valor := FModule.RobTargets.Item[Indice].RobTargetToString;
            Cadena := PonerAsterisco(Cadena, Valor);
            Memo.Lines[I] := Cadena;
            Temp.Add(Nombre);
          end;
        end;
      end;
    end;
    //Borrar los puntos encontrados
    { #todo : Seguir aquí }
    for I := 0 to Temp.Count - 1 do
    begin
      if FModule.RobTargets.FindRobTarget(Temp[I], Indice) then
      begin
        Valor := FModule.RobTargets.Item[Indice].RobTargerToStringEx;
        Valor := Valor + ';';
        if Memo.Lines.(Valor) > -1 then
        begin
          Memo.Lines.Delete(Indice);
        end;
        FModule.RobTargets.Delete(Indice);
      end;

    end;
  finally
    FreeAndNil(Temp);

  end;
end;

constructor TEditModuleFrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  FModule := TModule.Create;
end;

destructor TEditModuleFrm.Destroy;
begin
  FreeAndNil(FModule);
  inherited Destroy;
end;

end.
