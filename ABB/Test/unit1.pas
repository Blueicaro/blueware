unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
Uses rw6_eio;
{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  c: TCrossConnectionList;
  Lista: TStringList;
begin
 Lista := TStringList.Create;
 Lista.AddStrings(Memo1.Lines);
 c:= TCrossConnectionList.Create;
 c.LoadFromStrings(Lista);
end;

end.

