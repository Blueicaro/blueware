{ TODO : Hacer  test }
unit rw56_eio;

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
    property Res: string read FResult write FResult;
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

//Entradas y salidas del usuario
type

  { TSignalitem }

  TSignalItem = class(TCollectionItem)

  private
    FAccess: string;
    FCategory: string;
    FDefaultValue: string;
    FUnitMap: string;
    FEncType: string;
    FFiltAct: string;
    FFiltPas: string;
    FInvert: string;
    FMaxBitVal: string;
    FMaxLog: string;
    FMaxPhys: string;
    FMaxPhysLimit: string;
    FMinBitVal: string;
    FMinLog: string;
    FMinPhys: string;
    FMinPhysLimit: string;
    FNombre: string;
    Fstore: string;
    FSignalLabel: string;
    FSignalType: string;
    FSize: string;
    FUnidad: string;
  public
    constructor Create(ACollection: TCollection); override;
    property Nombre: string read FNombre write FNombre;
    property SignalType: string read FSignalType write FSignalType;
    property Unidad: string read FUnidad write FUnidad;
    property UnitMap: string read FUnitMap write FUnitMap;
    property SignalLabel: string read FSignalLabel write FSignalLabel;
    property Category: string read FCategory write FCategory;
    property Access: string read FAccess write FAccess;
    property DefaultValue: string read FDefaultValue write FDefaultValue; //Default
    property Store: string read FStore write FStore;
    property FiltPas: string read FFiltPas write FFiltPas;
    property FiltAct: string read FFiltAct write FFiltAct;
    property Invert: string read FInvert write FInvert;
    property EncType: string read FInvert write FEncType;
    property MaxLog: string read FMaxLog write FMaxLog;
    property MaxPhys: string read FMaxPhys write FMaxPhys;
    property MaxPhysLimit: string read FMaxPhys write FMaxPhysLimit;
    property MaxBitVal: string read FMaxBitVal write FMaxBitVal;
    property MinLog: string read FMinLog write FMinLog;
    property MinPhys: string read FMinPhys write FMinPhys;
    property MinPhysLimit: string read FMinPhys write FMinPhysLimit;
    property MinBitVal: string read FMinBitVal write FMinBitVal;
    property Size: string read FSize write FSize;
  end;

type

  { TSignalList }

  TSignalList = class(TCollection)
  private

    function GetItems(Index: integer): TSignalItem;
    procedure SetItems(Index: integer; AValue: TSignalItem);
  public
    constructor Create;
    function Add: TSignalItem;
    property Items[Index: integer]: TSignalItem read GetItems write SetItems; default;
    procedure LoadFromStrings(StringList: TStringList);
    function GetListaUnidades: TStringList;
  end;


implementation

{ TSignalList }

function TSignalList.GetItems(Index: integer): TSignalItem;
begin
  Result := TSignalItem(inherited Items[index]);
end;



procedure TSignalList.SetItems(Index: integer; AValue: TSignalItem);
begin
  items[Index].Assign(AValue);
end;

constructor TSignalList.Create;
begin
  inherited Create(TSignalItem);
end;

function TSignalList.Add: TSignalItem;
begin
  Result := inherited Add as TSignalItem;
end;

{ TODO : Revisar. Testear }
procedure TSignalList.LoadFromStrings(StringList: TStringList);
var
  dato: TSignalItem;
  Parametro, cadena, Parte, stSize, stName, stSignalType, stUnidad,
  stUnitMap, stSignalLabel, stCategory, stAccess, stDefault, stSafeLevel,
  stFiltPas, stFiltAct, stInvert, stEncType, stMaxLog, stMaxPhys,
  stMaxPhysLimit, stMaxBitVal, stMinLog, stMinPhys, stMinPhysLimit,
  stMinBitVal, Temp, Valor: string;
  Palabras: SizeInt;
  Inicio: boolean;
  I, X: integer;
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
      while AnsiEndsStr('\', Cadena) do
      begin
        if I + 1 < StringList.Count then
        begin
          Temp := Trim(StringList[I + 1]);
          if (Pos('-', Temp) = 1) then
          begin
            //Retirar barra final  y le añadimos un final
            Cadena := TrimRightSet(Cadena, ['\']);
            // Le añadimos la nueva cadena
            Cadena := Cadena + ' ' + Temp;
            I := I + 1;
          end
          else
          begin
            Cadena := TrimRightSet(Cadena, ['\']);
          end;
        end
        else
        begin
          Cadena := TrimRightSet(Cadena, ['\']);
        end;
      end;
      Palabras := WordCount(Cadena, ['-']);
      if Palabras < 2 then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion EIO_SIGNAL');
      end;

      stSize := '';
      stName := '';
      stSignalType := '';
      stUnidad := '';
      stUnitMap := '';
      stSignalLabel := '';
      stCategory := '';
      stAccess := '';
      stDefault := '';
      stSafeLevel := '';
      stFiltPas := '';
      stFiltAct := '';
      stInvert := '';
      stEncType := '';
      stMaxLog := '';
      stMaxPhys := '';
      stMaxPhysLimit := '';
      stMaxBitVal := '';
      stMinLog := '';
      stMinPhys := '';
      stMinPhysLimit := '';
      stMinBitVal := '';

      for X := 1 to Palabras do
      begin
        Parte := ExtractWord(X, Cadena, ['-']);
        Parametro := ExtractWord(1, Parte, [' ']);
        Valor := ExtractWord(2, Parte, [' ']);
        Valor := TrimSet(Valor, ['"']);
        case Parametro of
          'Name':
            stName := Valor;
          'SignalType':
            stSignalType := Valor;
          'Unit':
            stUnidad := Valor;
          'UnitMap':
            stUnitMap := Valor;
          'SignalLabel':
            stSignalLabel := Valor;
          'Category':
            stCategory := Valor;
          'Access':
            stAccess := Valor;
          'Default':
            stDefault := Valor;
          'Store':
            stSafeLevel := 'Store';
          'FiltPas':
            stFiltPas := Valor;
          'FiltAct':
            stFiltAct := Valor;
          'Invert':
            stInvert := Valor;
          'EncType':
            stEncType := Valor;
          'MaxLog':
            stMaxLog := Valor;
          'MaxPhys':
            stMaxPhys := Valor;
          'MaxPhysLimit':
            stMaxPhysLimit := Valor;
          'MaxBitVal':
            stMaxBitVal := Valor;
          'MinLog':
            stMinLog := Valor;
          'MinPhys':
            stMinPhys := Valor;
          'MinPhysLimit':
            stMinPhysLimit := Valor;
          'MinBitVal':
            stMinBitVal := Valor;
          'Size':
            stSize := Valor;
        end;
      end;


      dato := Self.Add;
      dato.Nombre := stName;
      dato.SignalType := stSignalType;
      dato.Unidad := stUnidad;
      dato.UnitMap:=stUnitMap;
      dato.SignalLabel := stSignalLabel;
      dato.Category := stCategory;
      dato.Access := stAccess;
      dato.DefaultValue := stDefault;
      dato.Store := stSafeLevel;
      dato.FiltPas := stFiltPas;
      dato.FiltAct := stFiltAct;
      dato.Invert := stInvert;
      dato.EncType := stEncType;
      dato.MaxLog := stMaxLog;
      dato.MaxPhys := stMaxPhys;
      dato.MaxPhysLimit := stMaxPhysLimit;
      dato.MaxBitVal := stMaxBitVal;
      dato.MinLog := stMinLog;
      dato.MinPhys := stMinPhys;
      dato.MinPhysLimit := stMinPhysLimit;
      dato.MinBitVal := stMinBitVal;
      dato.Size := stSize;

    end;

    //Buscar inicio de seccion
    if Cadena = 'EIO_SIGNAL:' then
    begin
      inicio := True;
    end;

    I := I + 1;
  end;

end;

function TSignalList.GetListaUnidades: TStringList;
var
  I: integer;
  Carta: String;
begin
  Result := TStringList.Create;
  Result.Sorted := True;
  Result.Duplicates := dupIgnore;
  for I := 0 to Self.Count - 1 do
  begin
    Carta:= Self.GetItems(I).Unidad;
    Result.Add(Carta);
  end;

end;


{ TSignalItem }

constructor TSignalItem.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
end;

{ TCrossConnectionList }

function TCrossConnectionList.GetItems(Index: integer): TCrossConnectionItem;
begin
  Result := TCrossConnectionItem(inherited Items[Index]);
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

{ TODO : Revisar. Testear }
procedure TCrossConnectionList.LoadFromStrings(StringList: TStringList);
var
  I, X: integer;
  inicio: boolean;
  cadena, Temp, Parte1, strAct1, strName, strRes, Parametro, strAct5,
  strAct4, strAct3, strAct2, strOper4, strOper1, strOper2, strOper3,
  strAct1Invert, strAct3Invert, strAct4Invert, strAct5Invert, strAct2Invert: string;
  dato: TCrossConnectionItem;
  Palabras: SizeInt;
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
      Cadena := trim(Cadena);
      //Fin := False;
      while AnsiEndsStr('\', Cadena) do
      begin
        if I + 1 < StringList.Count - 1 then
        begin
          Temp := Trim(StringList[I + 1]);
          if (Pos('-', Temp) = 1) then
          begin
            //Retirar barra final  y le añadimos un final
            Cadena := TrimRightSet(Cadena, ['\']);
            // Le añadimos la nueva cadena
            Cadena := Cadena + ' ' + Temp;
            I := I + 1;
          end
          else
          begin
            Cadena := TrimRightSet(Cadena, ['\']);
          end;
        end;
      end;
      strAct2 := '';
      strAct3 := '';
      strAct4 := '';
      strAct5 := '';
      strOper1 := '';
      strOper2 := '';
      strOper3 := '';
      strOper4 := '';
      strAct1Invert := '';
      strAct2Invert := '';
      strAct3Invert := '';
      strAct4Invert := '';
      strAct5Invert := '';
      //Las tres parametros:  res y act1 son obligatorios y por este orden
      Palabras := WordCount(Cadena, ['-']);
      if Palabras < 2 then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion EIO_CROSS');
      end;
      Parte1 := ExtractWord(1, Cadena, ['-']);
      Parametro := ExtractWord(1, Parte1, [' ']);
      if Parametro <> 'Res' then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion EIO_CROSS');
      end;
      strName := ExtractWord(2, Cadena, [' ']);

      Parte1 := ExtractWord(2, Cadena, ['-']);
      Parametro := ExtractWord(1, Parte1, [' ']);
      if Parametro <> 'Act1' then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion EIO_CROSS');
      end;
      strRes := ExtractWord(2, Parte1, [' ']);

      Parte1 := ExtractWord(2, Cadena, ['-']);
      Parametro := ExtractWord(1, Parte1, [' ']);
      if Parametro <> 'Act1' then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion EIO_CROSS');
      end;
      strAct1 := ExtractWord(2, Parte1, [' ']);

      //Parámetros  opcionales

      if Palabras > 2 then
      begin
        for X := 4 to Palabras do
        begin
          Parte1 := ExtractWord(X, Cadena, ['-']);
          Parametro := ExtractWord(1, Parte1, [' ']);
          case Parametro of
            'Act2':
            begin
              strAct2 := ExtractWord(2, Parte1, [' ']);
            end;
            'Act3':
            begin
              strAct3 := ExtractWord(2, Parte1, [' ']);
            end;
            'Act4':
            begin
              strAct4 := ExtractWord(2, Parte1, [' ']);
            end;
            'Act5':
            begin
              strAct5 := ExtractWord(2, Parte1, [' ']);
            end;
            'Oper1':
            begin
              strOper1 := ExtractWord(2, Parte1, [' ']);
            end;
            'Oper2':
            begin
              strOper2 := ExtractWord(2, Parte1, [' ']);
            end;
            'Oper3':
            begin
              strOper3 := ExtractWord(2, Parte1, [' ']);
            end;
            'Oper4':
            begin
              strOper4 := ExtractWord(2, Parte1, [' ']);
            end;
            'Act1_invert':
            begin
              strAct1Invert := Parte1;
            end;
            'Act2_invert':
            begin
              strAct2Invert := Parte1;
            end;
            'Act3_invert':
            begin
              strAct3Invert := Parte1;
            end;
            'Act4_invert':
            begin
              strAct4Invert := Parte1;
            end;
            'Act5_invert':
            begin
              strAct5Invert := Parte1;
            end;
          end;
        end;
      end;
      //Guardar datos
      dato := Self.Add;
      dato.Res := TrimSet(strRes, ['"']);

      dato.Act1 := TrimSet(strAct1, ['"']);
      dato.Act2 := TrimSet(strAct2, ['"']);
      dato.Act3 := TrimSet(strAct3, ['"']);
      dato.Act4 := TrimSet(strAct4, ['"']);
      dato.Act5 := TrimSet(strAct5, ['"']);

      dato.Oper1 := TrimSet(strOper1, ['"']);
      dato.Oper2 := TrimSet(strOper2, ['"']);
      dato.Oper3 := TrimSet(strOper3, ['"']);
      dato.Oper4 := TrimSet(strOper4, ['"']);

      dato.Act1_invert := TrimSet(strAct1Invert, ['"']);
      dato.Act2_invert := TrimSet(strAct2Invert, ['"']);
      dato.Act3_invert := TrimSet(strAct3Invert, ['"']);
      dato.Act4_invert := TrimSet(strAct4Invert, ['"']);
      dato.Act5_invert := TrimSet(strAct5Invert, ['"']);

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

{ TSysInputItem }

constructor TSysInputItem.Create(ACollection: TCollection);
begin
  if Assigned(ACollection) then
    inherited Create(ACollection);

end;

{ TSysOutputItem }

constructor TSysOutputItem.Create(ACollection: TCollection);
begin
  if Assigned(ACollection) then
    inherited Create(ACollection);
end;

{ TSysInputtList }

procedure TSysInputtList.SetItems(Index: integer; AValue: TSysInputItem);
begin
  items[index].Assign(AValue);
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
  ;
end;

procedure TSysInputtList.LoadFromStrings(StringList: TStringList);
var
  I: integer;
  inicio: boolean;
  cadena, Parte1, Parte2, strAction, srtSignal, Arg1, Arg2, Arg3,
  Arg4, Arg5, Arg6: string;
  Palabras: SizeInt;
  dato: TSysInputItem;
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
      Arg1 := '';
      Arg2 := '';
      Arg3 := '';
      Arg4 := '';
      Arg5 := '';
      Arg6 := '';
      Palabras := WordCount(Cadena, ['-']);
      if Palabras < 2 then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion SYSSIG_IN');
      end;

      Parte1 := ExtractWord(1, Cadena, ['-']);
      if Pos('Signal', Parte1) <> 1 then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion SYSSIG_IN');
      end;
      srtSignal := ExtractWord(2, Parte1, [' ']);

      Parte2 := ExtractWord(2, Cadena, ['-']);
      if Pos('Action', Parte2) <> 1 then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion SYSSIG_IN');
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

    end;

    //Buscar inicio de seccion
    if Cadena = 'SYSSIG_IN:' then
    begin
      inicio := True;
    end;

    I := I + 1;
  end;

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
        raise EEioError.Create('Fail readin file Eio. Seccion SYSSIG_OUT');
      end;
      Parte1 := ExtractWord(1, Cadena, ['-']);
      if Pos('Status', Parte1) <> 1 then
      begin
        raise EEioError.Create('Fail readin file Eio. Seccion SYSSIG_OUT');
      end;
      strStatus := ExtractWord(2, Parte1, [' ']);

      Parte2 := ExtractWord(2, Cadena, ['-']);
      if Pos('Signal', Parte2) <> 1 then
      begin
        raise EEioError.Create('Fail readin file Eio. Seccion SYSSIG_OUT');
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

end.
