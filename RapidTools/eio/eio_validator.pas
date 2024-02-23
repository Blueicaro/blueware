unit eio_validator;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils;

type

  { iEioValidator }

  iEioValidator = class
    public
      function validar:Boolean;abstract;
      function listaErrores:TStringList;abstract;
  end;

implementation

end.
