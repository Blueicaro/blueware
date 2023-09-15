unit gridSignals;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, StdCtrls;

type

  { TGridSignalFrm }

  TGridSignalFrm = class(TFrame)
    Edit1: TEdit;
    stGridSignals: TStringGrid;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure stGridSignalsEditingDone(Sender: TObject);
    procedure stGridSignalsGetEditText(Sender: TObject; ACol, ARow: integer;
      var Value: string);
    procedure stGridSignalsSelectEditor(Sender: TObject; aCol, aRow: integer;
      var Editor: TWinControl);
    procedure stGridSignalsSetEditText(Sender: TObject; ACol, ARow: integer;
      const Value: string);
    procedure stGridSignalsValidateEntry(Sender: TObject; aCol, aRow: integer;
      const OldValue: string; var NewValue: string);
  private

  public

  end;

implementation
uses comunframes;
{$R *.lfm}

{ TGridSignalFrm }

procedure TGridSignalFrm.stGridSignalsSelectEditor(Sender: TObject;
  aCol, aRow: integer; var Editor: TWinControl);
begin
  Editor := Edit1;
end;

procedure TGridSignalFrm.stGridSignalsGetEditText(Sender: TObject;
  ACol, ARow: integer; var Value: string);
begin
  Edit1.Text := Value;
end;

procedure TGridSignalFrm.stGridSignalsEditingDone(Sender: TObject);
begin

end;

procedure TGridSignalFrm.Edit1KeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TGridSignalFrm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = ord ('!') Then
  begin
    key := 0;
  end;
end;

procedure TGridSignalFrm.stGridSignalsSetEditText(Sender: TObject;
  ACol, ARow: integer; const Value: string);
begin

end;

procedure TGridSignalFrm.stGridSignalsValidateEntry(Sender: TObject;
  aCol, aRow: integer; const OldValue: string; var NewValue: string);
begin
  if stGridSignals.Columns.Items[aCol].Title.Caption = 'Nombre' then
  begin
    if ValidarNomnbreSenal(OldValue) then
    begin

    end;
  end;
end;

end.
