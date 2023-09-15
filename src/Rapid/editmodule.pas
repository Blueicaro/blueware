unit editmodule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls,Modules;

type

  { TEditModuleFrm }

  TEditModuleFrm = class(TFrame)
    Memo: TMemo;
  private
     FModule : TModule;
  public
    procedure LoadModule(Filename: TFileName);
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation


  {$R *.lfm}

  { TEditModuleFrm }

procedure TEditModuleFrm.LoadModule(Filename: TFileName);
begin
   FModule.CargarModulo(Filename);
   Memo.Lines.Text:=FModule.Fichero.Text;
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
