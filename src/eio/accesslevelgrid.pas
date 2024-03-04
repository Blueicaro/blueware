unit accesslevelgrid;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Grids, gridclass;

type

  { Taccesslevelframe }

  Taccesslevelframe = class(TFrame)
    gridAccessLevel: TStringGrid;
  private
    InfoColumnas : TGridClass;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.lfm}

{ Taccesslevelframe }

constructor Taccesslevelframe.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  InfoColumnas.Create;
end;

destructor Taccesslevelframe.Destroy;
begin
  FreeAndNil(InfoColumnas);
  inherited Destroy;
end;

end.

