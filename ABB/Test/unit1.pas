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
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses rw6_eio;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);

var
  Lista: TStringList;
  s: TNetWorkList;
begin

  Lista := TStringList.Create;
  Lista.AddStrings(Memo1.Lines);
  s := TNetWorkList.Create;
  s.LoadFromStrings(Lista);
  Memo2.Lines.Add('Listo');
  FreeAndNil(S);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo2.Lines.Add('Lineas: ' + IntToStr(memo1.Lines.Count));
end;

end.
