program TestGridClass;

uses
  gridclass,
  SysUtils,
  Classes;

var
  GridData: TGridClass;
  I: integer;
  info: TGridClassItem;
begin
  GridData := TGridClass.Create;
  for I := 0 to 10 do
  begin
      info := GridData.ListaPropiedades.Add;
      info.NombreColumna := 'Col' + IntToStr(I);
      info. NombrePropiedad := 'Propiedad' + IntToStr(I);
    end;
  GridData.Save('Pepe.txt');
 GridData.Load('Pepe.txt');
  Write(IntToStr(GridData.ListaPropiedades.Count));
  Readln();
  FreeAndNil(GridData);
end.
