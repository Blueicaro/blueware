unit rw6_eio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StrUtils;

type
  EEioError = class(Exception)
  end;


// Salida de Sistema
type

  { TSysOutputItem }

  TSysOutputItem = class(TCollectionItem)
  private
    FSignal: string;
    Fstatus: string;
  public
    constructor Create(ACollection: TCollection); override;
    property Status: string read Fstatus write FStatus;
    property Signal: string read FSignal write FSignal;
  end;

//Lista de salidas de sistema
type

  { TSysOutPutList }

  TSysOutPutList = class(TCollection)
  private
    procedure SetItems(Index: integer; AValue: TSysOutputItem);
    function GetItems(Index: integer): TSysOutputItem;
  public
    constructor Create;
    function Add: TSysOutputItem;
    property Items[Index: integer]: TSysOutputItem read GetItems write SetItems; default;
    procedure LoadFromStrings(StringList: TStringList);
  end;

//Entradas de sistema
type

  { TSysInputItem }

  TSysInputItem = class(TCollectionItem)
  private
    FAction: string;
    FArg1: string;
    FArg2: string;
    FArg3: string;
    FArg4: string;
    FArg5: string;
    FArg6: string;
    FArg7: string;
    FArg8: string;
    Fstatus: string;
  public
    constructor Create(ACollection: TCollection); override;
    property Status: string read Fstatus write FStatus;
    property Action: string read FAction write FAction;
    property Arg1: string read FArg1 write FArg1;
    property Arg2: string read FArg2 write FArg2;
    property Arg3: string read FArg3 write FArg3;
    property Arg4: string read FArg4 write FArg4;
    property Arg5: string read FArg5 write FArg5;
    property Arg6: string read FArg6 write FArg6;
    property Arg7: string read FArg7 write FArg7;
    property Arg8: string read FArg8 write FArg8;
  end;

//Lista de Entradas de sistema
type


  { TSysInputtList }

  TSysInputtList = class(TCollection)
  private
    procedure SetItems(Index: integer; AValue: TSysInputItem);
    function GetItems(Index: integer): TSysInputItem;
  public
    constructor Create;
    function Add: TSysInputItem;
    property Items[Index: integer]: TSysInputItem read GetItems write SetItems; default;
    procedure LoadFromStrings(StringList: TStringList);
  end;

//Conexiones cruzadas
type

  { TCrossConnectionItem }

  TCrossConnectionItem = class(TCollectionItem)

  private
    FAct1: string;
    FAct1_invert: string;
    FAct2: string;
    FAct2_invert: string;
    FAct3: string;
    FAct3_invert: string;
    FAct4: string;
    FAct4_invert: string;
    FAct5: string;
    FAct5_invert: string;
    FNombre: string;
    FOper1: string;
    FOper2: string;
    FOper3: string;
    FOper4: string;
    FOper5: string;
    FResult: string;
  public
    constructor Create(ACollection: TCollection); override;
    property Nombre: string read FNombre write FNombre;
    property Result: string read FResult write FResult;
    property Act1: string read FAct1 write FAct1;
    property Act2: string read FAct2 write FAct2;
    property Act3: string read FAct3 write FAct3;
    property Act4: string read FAct4 write FAct4;
    property Act5: string read FAct5 write FAct5;
    property Act1_invert: string read FAct1_invert write FAct1_invert;
    property Act2_invert: string read FAct2_invert write FAct2_invert;
    property Act3_invert: string read FAct3_invert write FAct3_invert;
    property Act4_invert: string read FAct4_invert write FAct4_invert;
    property Act5_invert: string read FAct5_invert write FAct5_invert;
    property Oper1: string read FOper1 write FOper1;
    property Oper2: string read FOper2 write FOper2;
    property Oper3: string read FOper3 write FOper3;
    property Oper4: string read FOper4 write FOper4;
    property Oper5: string read FOper5 write FOper5;
  end;

type

  { TCrossConnectionList }

  TCrossConnectionList = class(TCollection)
  private
    function GetItems(Index: integer): TCrossConnectionItem;
    procedure SetItems(Index: integer; AValue: TCrossConnectionItem);
  public
    constructor Create;
    function Add: TCrossConnectionItem;
    property Items[Index: integer]: TCrossConnectionItem read GetItems write SetItems;
      default;
    procedure LoadFromStrings(StringList: TStringList);
  end;

implementation

{ TCrossConnectionList }

function TCrossConnectionList.GetItems(Index: integer): TCrossConnectionItem;
begin
  Result := inherited Add as TCrossConnectionItem;
end;

procedure TCrossConnectionList.SetItems(Index: integer; AValue: TCrossConnectionItem);
begin
  items[Index].Assign(AValue);
end;

constructor TCrossConnectionList.Create;
begin
  inherited Create(TCrossConnectionItem);
end;

function TCrossConnectionList.Add: TCrossConnectionItem;
begin
  Result := inherited Add as TCrossConnectionItem;
end;
 { TODO : Continuar aquí. Rehacer la rutina. }
procedure TCrossConnectionList.LoadFromStrings(StringList: TStringList);
var
  I: integer;
  inicio: boolean;
  cadena, strStatus, strSignal, Parte1, Parte2: string;
  Palabras: SizeInt;
  dato: TCrossConnectionItem;
begin
  Inicio := False;
  I := 0;

  while I < StringList.Count - 1 do
  begin
    cadena := StringList[I];
    if (Cadena = '#') and (inicio = True) then
    begin
      i := StringList.Count;
      inicio := False;
    end;
    if (inicio = True) and (cadena <> '') then
    begin
      cadena := trim(cadena);
      Palabras := WordCount(Cadena, ['-']);
      if Palabras < 3 then
      begin
        raise EEioError.Create('Fallo leyendo archivo Eio. Seccion EIO_CROSS');
      end;
      Parte1 := ExtractWord(1, Cadena, ['-']);
      if Pos('Name', Parte1) <> 1 then
      begin
        raise EEioError.Create('Fallo leyendo archivo Eio. Seccion EIO_CROSS');
      end;
      strName := ExtractWord(2, Parte1, [' ']);

      Parte2 := ExtractWord(2, Cadena, ['-']);
      if Pos('Res', Parte2) <> 1 then
      begin
        raise EEioError.Create('Fallo leyendo archivo Eio. Seccion EIO_CROSS');
      end;
      strRes := ExtractWord(2, Parte2, [' ']);

      Parte3 := ExtractWord(3,Cadena,['-']);
      if (Pos('-Act1',Parte3) <> 1 then
      begin
         raise EEioError.Create('Fallo leyendo archivo Eio. Seccion EIO_CROSS');
      end;

      strAct1 := ExtractWord(3,Parte3,['-'])

      dato := Self.Add;
      dato.FSignal := TrimSet(strSignal, ['"']);
      dato.Fstatus := TrimSet(strStatus, ['"']);
    end;

    //Buscar inicio de seccion
    if Cadena = 'EIO_CROSS:' then
    begin
      inicio := True;
    end;

    I := I + 1;
  end;

end;

{ TCrossConnectionItem }

constructor TCrossConnectionItem.Create(ACollection: TCollection);
begin
  if Assigned(ACollection) then
    inherited Create(ACollection);
end;

{ TSysInputtList }

procedure TSysInputtList.SetItems(Index: integer; AValue: TSysInputItem);
begin
  items[Index].Assign(AValue);
end;

function TSysInputtList.GetItems(Index: integer): TSysInputItem;
begin
  Result := TSysInputItem(inherited Items[Index]);
end;

constructor TSysInputtList.Create;
begin
  inherited Create(TSysInputItem);
end;

function TSysInputtList.Add: TSysInputItem;
begin
  Result := inherited Add as TSysInputItem;
end;

procedure TSysInputtList.LoadFromStrings(StringList: TStringList);
var
  I: integer;
  inicio: boolean;
  cadena, Parte1, Parte2, strAction, srtSignal, Arg1, Arg2, Arg3,
  Arg4, Arg5, Arg6, Arg7, Arg8: string;
  Palabras: SizeInt;
  dato: TSysInputItem;
begin
  Inicio := False;
  I := 0;
  Arg1 := '';
  Arg2 := '';
  Arg3 := '';
  Arg4 := '';
  Arg5 := '';
  Arg6 := '';
  Arg7 := '';
  Arg8 := '';
  while I < StringList.Count - 1 do
  begin
    cadena := StringList[I];
    if (Cadena = '#') and (inicio = True) then
    begin
      i := StringList.Count;
      inicio := False;
    end;
    if (inicio = True) and (cadena <> '') then
    begin
      cadena := trim(cadena);
      Palabras := WordCount(Cadena, ['-']);
      if Palabras < 2 then
      begin
        raise EEioError.Create('Fallo leyendo archivo Eio. Seccion SYSSIG_IN');
      end;

      Parte1 := ExtractWord(1, Cadena, ['-']);
      if Pos('Signal', Parte1) <> 1 then
      begin
        raise EEioError.Create('Fallo leyendo archivo Eio. Seccion SYSSIG_IN');
      end;
      srtSignal := ExtractWord(2, Parte1, [' ']);

      Parte2 := ExtractWord(2, Cadena, ['-']);
      if Pos('Action', Parte2) <> 1 then
      begin
        raise EEioError.Create('Fallo leyendo archivo Eio. Seccion SYSSIG_IN');
      end;
      strAction := ExtractWord(2, Parte2, [' ']);
      //Hay un argumento opcional
      if Palabras > 2 then
      begin
        if (Pos('-Arg1', Cadena) > 1) then
        begin
          Arg1 := Copy(Cadena, Pos('-Arg1', Cadena), Length(Cadena));
          Arg1 := ExtractWord(2, Arg1, [' ']);
        end;
        if (Pos('-Arg2', Cadena) > 1) then
        begin
          Arg2 := Copy(Cadena, Pos('-Arg2', Cadena), Length(Cadena));
          Arg2 := ExtractWord(2, Arg2, [' ']);
        end;
        if (Pos('-Arg3', Cadena) > 1) then
        begin
          Arg3 := Copy(Cadena, Pos('-Arg3', Cadena), Length(Cadena));
          Arg3 := ExtractWord(2, Arg3, [' ']);
        end;

        if (Pos('-Arg4', Cadena) > 1) then
        begin
          Arg4 := Copy(Cadena, Pos('-Arg4', Cadena), Length(Cadena));
          Arg4 := ExtractWord(2, Arg4, [' ']);
        end;

        if (Pos('-Arg5', Cadena) > 1) then
        begin
          Arg5 := Copy(Cadena, Pos('-Arg5', Cadena), Length(Cadena));
          Arg5 := ExtractWord(2, Arg4, [' ']);
        end;

        if (Pos('-Arg6', Cadena) > 1) then
        begin
          Arg6 := Copy(Cadena, Pos('-Arg6', Cadena), Length(Cadena));
          Arg6 := ExtractWord(2, Arg6, [' ']);
        end;


        if (Pos('-Arg7', Cadena) > 1) then
        begin
          Arg7 := Copy(Cadena, Pos('-Arg7', Cadena), Length(Cadena));
          Arg7 := ExtractWord(2, Arg7, [' ']);
        end;


        if (Pos('-Arg8', Cadena) > 1) then
        begin
          Arg8 := Copy(Cadena, Pos('-Arg8', Cadena), Length(Cadena));
          Arg8 := ExtractWord(2, Arg8, [' ']);
        end;

      end;
      dato := Self.Add;
      dato.Fstatus := TrimSet(srtSignal, ['"']);
      dato.FAction := TrimSet(strAction, ['"']);
      dato.FArg1 := TrimSet(Arg1, ['"']);
      dato.FArg2 := TrimSet(Arg2, ['"']);
      dato.FArg3 := TrimSet(Arg3, ['"']);
      dato.FArg4 := TrimSet(Arg4, ['"']);
      dato.FArg5 := TrimSet(Arg5, ['"']);
      dato.FArg6 := TrimSet(Arg6, ['"']);
      dato.FArg7 := TrimSet(Arg7, ['"']);
      dato.FArg8 := TrimSet(Arg8, ['"']);
    end;

    //Buscar inicio de seccion
    if Cadena = 'SYSSIG_IN:' then
    begin
      inicio := True;
    end;

    I := I + 1;
  end;

end;

{ TSysInputItem }

constructor TSysInputItem.Create(ACollection: TCollection);
begin
  if Assigned(ACollection) then
    inherited Create(ACollection);
end;

{ TSysOutPutList }

procedure TSysOutPutList.SetItems(Index: integer; AValue: TSysOutputItem);
begin
  items[Index].Assign(AValue);
end;

function TSysOutPutList.GetItems(Index: integer): TSysOutputItem;
begin
  Result := TSysOutputItem(inherited Items[Index]);
end;

constructor TSysOutPutList.Create;
begin
  inherited Create(TSysOutputItem);
end;

function TSysOutPutList.Add: TSysOutputItem;
begin
  Result := inherited Add as TSysOutputItem;
end;

procedure TSysOutPutList.LoadFromStrings(StringList: TStringList);
var
  I: integer;
  inicio: boolean;
  cadena, strStatus, strSignal, Parte1, Parte2: string;
  Palabras: SizeInt;
  dato: TSysOutputItem;
begin
  Inicio := False;
  I := 0;

  while I < StringList.Count - 1 do
  begin
    cadena := StringList[I];
    if (Cadena = '#') and (inicio = True) then
    begin
      i := StringList.Count;
      inicio := False;
    end;
    if (inicio = True) and (cadena <> '') then
    begin
      cadena := trim(cadena);
      Palabras := WordCount(Cadena, ['-']);
      if Palabras <> 2 then
      begin
        raise EEioError.Create('Fallo leyendo archivo Eio. Seccion SYSSIG_OUT');
      end;
      Parte1 := ExtractWord(1, Cadena, ['-']);
      if Pos('Status', Parte1) <> 1 then
      begin
        raise EEioError.Create('Fallo leyendo archivo Eio. Seccion SYSSIG_OUT');
      end;
      strStatus := ExtractWord(2, Parte1, [' ']);

      Parte2 := ExtractWord(2, Cadena, ['-']);
      if Pos('Signal', Parte2) <> 1 then
      begin
        raise EEioError.Create('Fallo leyendo archivo Eio. Seccion SYSSIG_OUT');
      end;
      strSignal := ExtractWord(2, Parte2, [' ']);
      dato := Self.Add;
      dato.FSignal := TrimSet(strSignal, ['"']);
      dato.Fstatus := TrimSet(strStatus, ['"']);
    end;

    //Buscar inicio de seccion
    if Cadena = 'SYSSIG_OUT:' then
    begin
      inicio := True;
    end;

    I := I + 1;
  end;
end;

{ TSysOutputItem }

constructor TSysOutputItem.Create(ACollection: TCollection);
begin
  if Assigned(ACollection) then
    inherited Create(ACollection);
end;

end.
