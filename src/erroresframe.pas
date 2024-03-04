unit erroresframe;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls;

type

  { TAvisosErroresFrm }

  TAvisosErroresFrm = class(TFrame)
    MemoErrores: TMemo;
  private

  public
     procedure BorrarErrores;
     procedure AddErrores (Lista:TStringList);
  end;

implementation

{$R *.lfm}

{ TAvisosErroresFrm }

procedure TAvisosErroresFrm.BorrarErrores;
begin
  MemoErrores.Clear;
end;

procedure TAvisosErroresFrm.AddErrores(Lista: TStringList);
begin
  MemoErrores.Lines.AddStrings(Lista);
end;

end.

