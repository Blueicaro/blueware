unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
 uses framesimple;
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  F: TFrameSimple;
begin
   F := TFrameSimple.Create(Self,'Textoo');
   F.Parent:=Self;
   F.BringToFront;
end;

end.

