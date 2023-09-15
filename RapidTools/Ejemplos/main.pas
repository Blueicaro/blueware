unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,gridSignals;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
   DigitalInputs : TGridSignalFrm;
  public

  end;

var
  Form1: TForm1;

implementation
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  DigitalInputs := TGridSignalFrm.Create(Self);
  DigitalInputs.Parent := Self;
  DigitalInputs.Align:=alClient;
  DigitalInputs.Show;
end;

end.

