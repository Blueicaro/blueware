unit framesimple;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ExtCtrls, StdCtrls;

type

  { TFrameSimple }

  TFrameSimple = class(TFrame)
    lbCaption: TLabel;
    pnTitle: TPanel;
    procedure FrameClick(Sender: TObject);
  private
    FCaption: string;
    procedure SetCaption(AValue: string);
  public
    property Caption: string read FCaption write SetCaption;
  public
    constructor Create(TheOwner: TComponent); override;
        constructor Create(TheOwner: TComponent;aCaption:TCaption); overload;
    destructor Destroy; override;
  end;

implementation

{$R *.lfm}

{ TFrameSimple }

procedure TFrameSimple.FrameClick(Sender: TObject);
begin

end;

procedure TFrameSimple.SetCaption(AValue: string);
begin
  if FCaption = AValue then Exit;
  FCaption := AValue;
  lbCaption.Caption := FCaption;
end;

constructor TFrameSimple.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  Align := alClient;
end;

constructor TFrameSimple.Create(TheOwner: TComponent; aCaption: TCaption);
begin
  Self.Create(TheOwner);
  SetCaption(aCaption);
end;

destructor TFrameSimple.Destroy;
begin
  inherited Destroy;
end;

end.
