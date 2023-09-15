unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons, framebaseunit;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseFrm(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private

    procedure Inactivo(Sender: TObject; var done: boolean);
  public
      //  Frame: TFrame1;
  end;

var
  Form1: TForm1;

implementation

 Var
   Frame : TFrameBase;


{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnIdle := @Inactivo;
end;

procedure TForm1.CloseFrm(Sender: TObject);
begin



end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.Inactivo(Sender: TObject; var done: boolean);
var
  I: integer;
begin
  //for I := Self.ComponentCount - 1 downto 0 do
  //begin
  //  done := False;
  //  if Components[I] is TFrame1 then
  //  begin
  //    with Components[I] as TFrame1 do
  //    begin
  //      if Cerrar then
  //      begin
  //        Self.RemoveComponent(Components[I]);
  //      end;
  //    end;
  //  end;
  //end;
  //done := True;
end;




procedure TForm1.Button1Click(Sender: TObject);
begin
  if frame = nil then
  begin
    Frame := TFrameBase.Create(Self);
    Frame.Parent := Self;
  end;
  Frame.BringToFront;
  //Frame.Free;
  //Frame := nil;
end;

procedure TForm1.Button2Click(Sender: TObject);

begin

end;

end.
