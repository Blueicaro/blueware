unit framebaseunit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ExtCtrls, StdCtrls, Buttons;

type

  { TFrameBase }

  TFrameBase = class(TFrame)
    IconsImages: TImageList;
    pnTitle: TPanel;
    pnWorkingArea: TPanel;
    spbMinimize: TSpeedButton;
    spbClose: TSpeedButton;
    spbRestore: TSpeedButton;

    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure FrameMouseLeave(Sender: TObject);
    procedure FrameMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure pnTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure pnTitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure pnTitleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure spbCloseClick(Sender: TObject);
    procedure spbRestoreClick(Sender: TObject);
  private
    FMover: boolean;
    fResizing: boolean;
    FPosicionRaton: TPoint;
    FBorde: integer;
    FTamanoFrame: TPoint;
    FCaption: string;
    function GetCaption: string;
    procedure SetCaption(Value: string);
  public
    property Caption: string read GetCaption write SetCaption;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;

  end;

implementation


{$R *.lfm}

{ TFrameBase }

procedure TFrameBase.FrameMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
var
  Desplazamiento: TPoint;
  C: TCursor;
  n: Integer;
begin
  if (x <= FBorde) and (y >= FBorde) and (y <= Height - FBorde) then
  begin
    Self.Cursor := crSizeE;
  end;

  if (X >= Width - FBorde) and (y >= FBorde) and (y <= Height - FBorde) then
  begin
    Self.Cursor := crSizeW;
  end;

  if (x > FBorde) and (X < Width - FBorde) and (y <= FBorde) then
  begin
    Self.Cursor := crSizeNS;
  end;

  if (X < Width - FBorde) and (x > FBorde) and (y >= Height - FBorde) then
  begin
    Self.Cursor := crSizeNS;
  end;

  if ((x <= FBorde) and (y <= FBorde)) or ((x >= Width - FBorde) and
    (Y >= Height - FBorde)) then
  begin
    Self.Cursor := crSizeNWSE;
  end;

  if ((x >= Width - FBorde) and (y <= FBorde)) or ((x <= FBorde) and
    (Y >= Height - FBorde)) then
  begin
    Self.Cursor := crSizeNESW;
  end;


  if fResizing then
  begin
    C := Self.Cursor;
    Desplazamiento.X := X - FPosicionRaton.X;
    Desplazamiento.Y := Y - FPosicionRaton.Y;
    if (Self.Cursor <> crSizeNS) then
    begin
      if Self.Cursor = crSizeE then
      begin
        N := Self.Width - Desplazamiento.X;
        Self.Width := N;
        if Self.Left - ( FTamanoFrame.x-x) < 0 then
        begin
          Self.Left := 0;
        end
        else
        begin
          N := (Self.Width-n);
          Self.Left := Self.Left - (n);
        end;
      end
      else
      begin
        Self.Width := Self.Width + Desplazamiento.X;
      end;
    end;
    if (Self.Cursor <> crSizeW) then
    begin
      Self.Height := Self.Height + Desplazamiento.Y;
    end;
    FPosicionRaton.X := X;
    FPosicionRaton.Y := Y;

  end;
end;

procedure TFrameBase.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  fResizing := False;
end;

procedure TFrameBase.pnTitleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  FMover := Button = mbLeft;
  if FMover then
  begin
    FPosicionRaton.X := X;
    FPosicionRaton.Y := Y;
    FTamanoFrame.X := X;
    FTamanoFrame.Y := Y;
  end;

end;

procedure TFrameBase.pnTitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
var
  Desplazamiento: TPoint;
begin
  if FMover then
  begin
    Desplazamiento.X := X - FPosicionRaton.X;
    Desplazamiento.Y := Y - FPosicionRaton.Y;
    if (Abs(Desplazamiento.X) > 1) or (Abs(Desplazamiento.Y) > 1) then
    begin
      Self.Left := Self.Left + Desplazamiento.X;
      Self.Top := Self.Top + Desplazamiento.Y;
    end;

  end;

end;

procedure TFrameBase.pnTitleMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if FMover then
  begin
    FMover := False;
  end;

end;

procedure TFrameBase.FrameMouseLeave(Sender: TObject);
begin
  Self.Cursor := crDefault;
  fResizing := False;
end;

procedure TFrameBase.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  fResizing := True;
  FPosicionRaton.x := X;
  FPosicionRaton.Y := Y;
end;

procedure TFrameBase.spbCloseClick(Sender: TObject);
begin
  Hide;
end;

procedure TFrameBase.spbRestoreClick(Sender: TObject);
begin
  if Self.Align = alClient then
  begin
    Self.Align := alNone;
  end
  else
  begin
    Self.Align := alClient;
  end;
end;

function TFrameBase.GetCaption: string;
begin
  Result := FCaption;
end;

procedure TFrameBase.SetCaption(Value: string);
begin
  FCaption := Value;
end;

constructor TFrameBase.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  FBorde := 5;
end;

destructor TFrameBase.Destroy;
begin
  inherited Destroy;
end;



end.
