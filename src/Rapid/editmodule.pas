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
    FListaDeRutinas: TStringList;
    FModule: TModule;
    function GetListaTutines:TStringList;
  public
    procedure LoadModule(Filename: TFileName);
    procedure PonerAsteriscos;
    property ListaDeRutinas:TStringList read GetListaTutines;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses FuncionesRapid, LazLogger;

  {$R *.lfm}

  { TEditModuleFrm }

function TEditModuleFrm.GetListaTutines: TStringList;
begin
  Result := TStringList.Create;
  REsult.Assign(FListaDeRutinas);
end;

procedure TEditModuleFrm.LoadModule(Filename: TFileName);
begin
  FModule.CargarModulo(Filename);
  Memo.Lines.Text := FModule.Fichero.Text;
  FListaDeRutinas.Assign(FModule.GetListRoutinas);
end;

procedure TEditModuleFrm.PonerAsteriscos;
const
  Ordenes: array [1..2] of string = ('movej', 'movel');
var
  Temp: TStringList;
  I, Indice, x: integer;
  Cadena, Nombre, Valor, stTemp: string;
begin
  Temp := TStringList.Create;
  try
    Temp.Clear;
    Temp.Sorted := True;
    Temp.Duplicates := dupIgnore;
    Memo.BeginUpdateBounds;
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
    for I := 0 to Temp.Count - 1 do
    begin
      if FModule.RobTargets.FindRobTarget(Temp[I], Indice) then
      begin
        Valor := FModule.RobTargets.Item[Indice].RobTargerToStringEx;
        Valor := Valor + ';';
        x := 0;
        while x < Memo.Lines.Count do
        begin
          stTemp := Trim(Memo.Lines[X]);
          if CompareText(Valor, stTemp) = 0 then
          begin
            Memo.Lines.Delete(X);
            break;
          end;
          X := X + 1;
        end;
        FModule.RobTargets.Delete(Indice);
      end;
    end;
  finally
    { #todo : Poner aviso o mensaje indicando el número de puntos convertidos }
    FreeAndNil(Temp);
    Memo.EndUpdateBounds;
  end;
end;

constructor TEditModuleFrm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  FListaDeRutinas := TStringList.Create;
  FModule := TModule.Create;
end;

destructor TEditModuleFrm.Destroy;
begin
   FreeAndNil(FListaDeRutinas);
  FreeAndNil(FModule);

  inherited Destroy;
end;

end.
