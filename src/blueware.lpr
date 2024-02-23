program blueware;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, comun, FicherosEioFrame, main, paramcomun,
  entradassalidasgrid, entradassistemagrid, salidassistemagrid,
  crossconnexiongrid, ImportEioExcel, gridSignals, importareiodlg,
  nombreimportareio, ElogTreeView, ElogUnit, eloggrid, ElogPropiedades,
  RapidTreeView, Modules, Rapid, FuncionesRapid, CadenasUtiles, editmodule,
  TablaVerdadConexionCruzada, routines, eio_validator;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tmainfrm, mainfrm);
  Application.Run;
end.

