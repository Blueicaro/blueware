program testelog;

uses
  Classes,
  ElogUnit,
  SysUtils;

var
  E: TElog;
  // L: TStringList;
  I, X: integer;
begin
  E := TElog.Create;
  E.ReadElogFile('Elog_all230726.txt');
  WriteLn('Fecha: ' + DateTimeToStr(E.Date));
  WriteLn('Nombre del sistema: ' + E.NombreSistema);
  WriteLn('Nombre del controlador: ' + E.NombreControlador);
  WriteLn('RobotWare: ' + E.RobotWare);
  WriteLn('Clave del controlador: ' + E.ClaveControlador);
  WriteLn('Id Controlador: ' + E.IdControlador);
  Writeln('Opciones controlador:');
  for X := 0 to E.OpcionesControlador.Count-1 do
  begin
    Writeln(E.OpcionesControlador[X]);
  end;

  Writeln('Drives Modules: ' + IntToStr(E.DriveModule.Count));
  for I := 0 to E.DriveModule.Count - 1 do
  begin
    with E.DriveModule.Items[I] as TDriveModuleInfo do
    begin
      Writeln(#09 + 'Nombre: ' + Nombre);
      WriteLn(#09 + 'Clave: ' + Clave);
      for X := 0 to Opciones.Count - 1 do
      begin
        Writeln(#09 + Opciones[X]);
      end;
    end;
  end;
  For X := 0 To E.Elog.Count-1 do
  begin
     WriteLn(E.Elog.Items[X].ToString);
  end;
  WriteLn(E.Elog.Cabecera);
  FreeAndNil(E);
  Readln;

end.
