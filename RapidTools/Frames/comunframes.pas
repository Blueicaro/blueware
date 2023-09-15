unit comunframes;

{$mode ObjFPC}{$H+}

interface

uses
  StrUtils;

const
  LargoNombreSenales: integer = 32;

function ValidarNomnbreSenal(aNombre: string): Boolean;

implementation

function ValidarNomnbreSenal(aNombre: string): Boolean;
begin
   Result := True;


end;

end.
