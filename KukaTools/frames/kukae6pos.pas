unit kukaE6pos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ExtCtrls,  StdCtrls, SpinEx;

type

  { TE6posFrm }

  TE6posFrm = class(TFrame)
    btAplicar: TButton;
    chkIncremento: TCheckBox;
    flspDx: TFloatSpinEditEx;
    flspE4: TFloatSpinEditEx;
    flspE5: TFloatSpinEditEx;
    flspE6: TFloatSpinEditEx;
    flspDy: TFloatSpinEditEx;
    flspDz: TFloatSpinEditEx;
    flspRa: TFloatSpinEditEx;
    flspRb: TFloatSpinEditEx;
    flspRc: TFloatSpinEditEx;
    flspE1: TFloatSpinEditEx;
    flspE2: TFloatSpinEditEx;
    flspE3: TFloatSpinEditEx;
    gbTraslacion: TGroupBox;
    gbConfiguracionEjes: TGroupBox;
    gbEjesExternos: TGroupBox;
    gbRotacion: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    pnNombre: TPanel;
    pnComponentes: TPanel;
    spCfgS: TSpinEditEx;
    spCfgT: TSpinEditEx;
    procedure btAplicarClick(Sender: TObject);
    procedure chkIncrementoClick(Sender: TObject);
  private

  public

  end;

implementation

uses kukagridE6Pos;

{$R *.lfm}

{ TE6posFrm }

procedure TE6posFrm.btAplicarClick(Sender: TObject);
begin
  if Parent is TkukagridE6PosFrm then
  begin
    with Parent as TkukagridE6PosFrm do
    begin
      ActualizaPunto;
    end;
  end;
end;

procedure TE6posFrm.chkIncrementoClick(Sender: TObject);
var
  I: integer;
begin
  if chkIncremento.Checked then
  begin
    for I := 0 to Self.ComponentCount - 1 do
    begin
      if Self.Components[I] is TFloatSpinEditEx then
      begin
        with Self.Components[I] as TFloatSpinEditEx do
        begin
          Value := 0.0;
        end;
      end;
      if Self.Components[I] is TSpinEditEx then
      begin
        with Self.Components[I] as TSpinEditEx do
        begin
          Value := 0;
        end;
      end;
    end;
  end;
end;

end.
