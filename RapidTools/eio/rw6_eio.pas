unit rw6_eio;

{ #todo : En construcción }
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StrUtils, paramcomun;




  // Salida de Sistema
type

  { TSysOutputItem }

  TSysOutputItem = class(TCollectionItem)
  private
    FArg1: string;
    FArg2: string;
    FArg3: string;
    FArg4: string;
    FArg5: string;
    FArg6: string;
    FArg7: string;
    FArg8: string;
    FSignal: string;
    Fstatus: string;
  public
    constructor Create(ACollection: TCollection); override;
    property Status: string read Fstatus write FStatus;
    property Signal: string read FSignal write FSignal;
    property Arg1: string read FArg1 write FArg1;
    property Arg2: string read FArg2 write FArg3;
    property Arg3: string read FArg3 write FArg3;
    property Arg4: string read FArg4 write FArg4;
    property Arg5: string read FArg5 write FArg5;
    property Arg6: string read FArg6 write FArg6;
    property Arg7: string read FArg7 write FArg7;
    property Arg8: string read FArg8 write FArg8;

  end;

  //Lista de salidas de sistema
type

  { TSysOutPutList }

  TSysOutPutList = class(TCollection)
  private
    FNombreSeccion: string;
    procedure SetItems(Index: integer; AValue: TSysOutputItem);
    function GetItems(Index: integer): TSysOutputItem;
  public
    constructor Create;
    function Add: TSysOutputItem;
    property Items[Index: integer]: TSysOutputItem read GetItems write SetItems; default;
    procedure LoadFromStrings(StringList: TStringList);

    property NombreSeccion: string read FNombreSeccion;
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
    FArg9: string;
    FSignalName: string;

  public
    constructor Create(ACollection: TCollection); override;
    property SignalName: string read FSignalName write FSignalName;
    property Action: string read FAction write FAction;
    property Arg1: string read FArg1 write FArg1;
    property Arg2: string read FArg2 write FArg2;
    property Arg3: string read FArg3 write FArg3;
    property Arg4: string read FArg4 write FArg4;
    property Arg5: string read FArg5 write FArg5;
    property Arg6: string read FArg6 write FArg6;
    property Arg7: string read FArg7 write FArg7;
    property Arg8: string read FArg8 write FArg8;
    property Arg9: string read FArg9 write FArg9;
  end;

  //Lista de Entradas de sistema
type


  { TSysInputtList }

  TSysInputtList = class(TCollection)
  private
    FNombreSeccion: string;
    procedure SetItems(Index: integer; AValue: TSysInputItem);
    function GetItems(Index: integer): TSysInputItem;
  public
    constructor Create;
    function Add: TSysInputItem;
    property Items[Index: integer]: TSysInputItem read GetItems write SetItems; default;
    procedure LoadFromStrings(StringList: TStringList);
    property NombreSeccion: string read FNombreSeccion;
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
  protected
    function GetNumberActors: integer;
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
  public
    property NumberActors: integer read GetNumberActors;
  end;

type

  { TCrossConnectionList }

  TCrossConnectionList = class(TCollection)
  private
    FNombreSeccion: string;
    function GetItems(Index: integer): TCrossConnectionItem;
    procedure SetItems(Index: integer; AValue: TCrossConnectionItem);
  public
    constructor Create;
    function Add: TCrossConnectionItem;
    property Items[Index: integer]: TCrossConnectionItem read GetItems write SetItems;
      default;
    procedure LoadFromStrings(StringList: TStringList);
    property NombreSeccion: string read FNombreSeccion;
    function GetCrossByName(aCrossName: string): TCrossConnectionItem;
  end;


  //Entradas y salidas del usuario
type

  { TSignalitem }

  TSignalItem = class(TCollectionItem)

  private
    FAccess: string;
    FCategory: string;
    FDefaultValue: string;
    FDevice: string;
    FDeviceMap: string;
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
    FSafeLevel: string;
    FSignalLabel: string;
    FSignalType: string;
    FSize: string;
  public
    constructor Create(ACollection: TCollection); override;
    property Nombre: string read FNombre write FNombre;
    property SignalType: string read FSignalType write FSignalType;
    property Device: string read FDevice write FDevice;
    property DeviceMap: string read FDeviceMap write FDeviceMap;
    property SignalLabel: string read FSignalLabel write FSignalLabel;
    property Category: string read FCategory write FCategory;
    property Access: string read FAccess write FAccess;
    property DefaultValue: string read FDefaultValue write FDefaultValue; //Default
    property SafeLevel: string read FSafeLevel write FSafeLevel;
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
  public
    function Exportar: TStringList;
    procedure Assign(T: TPersistent); override;
  end;

type

  { TSignalList }

  TSignalList = class(TCollection)
  private
    FNombreSeccion: string;
    function GetItems(Index: integer): TSignalItem;
    procedure SetItems(Index: integer; AValue: TSignalItem);
  public
    constructor Create;
    function Add: TSignalItem;   //maximo senales 12000
    property Items[Index: integer]: TSignalItem read GetItems write SetItems; default;
    procedure LoadFromStrings(StringList: TStringList);
    function GetListaUnidades: TStringList;
    procedure AddFromCvsList(aLista: TStringList);
    procedure Exportar(aFilename: TFileName);
    property NombreSeccion: string read FNombreSeccion;
  end;

  //Redes industriales
type

  { TNetWorkItem }

  TNetWorkItem = class(TCollectionItem)
  private
    FAddress: string;
    FGateway: string;
    FIdenficationLabel: string;
    FNombre: string;
    FSimulated: string;
    FSubnetMask: string;
  public
    constructor Create(ACollection: TCollection); override;
    property Nombre: string read FNombre write FNombre;
    property IdenficationLabel: string read FIdenficationLabel write FIdenficationLabel;
    property Address: string read FAddress write FAddress;
    property SubnetMask: string read FSubnetMask write FSubnetMask;
    property Gateway: string read FGateway write FGateway;
    property Simulated: string read FSimulated write FSimulated;
    function Exportar: TStringList;
  end;

type

  { TNetWorkList }

  TNetWorkList = class(TCollection)
  private
    FNombreSeccion: string;
    function GetItems(Index: integer): TNetWorkItem;
    procedure SetItems(Index: integer; AValue: TNetWorkItem);
  public
    constructor Create;
    function Add: TNetWorkItem;
    property Items[Index: integer]: TNetWorkItem read GetItems write SetItems; default;
    procedure LoadFromStrings(StringList: TStringList);
    property NombreSeccion: string read FNombreSeccion;
  end;

type

  { TAccessLevelItem }

  TAccessLevelItem = class(TCollectionItem)
  private
    FLocalAuto: boolean;
    FLocalManual: boolean;
    FNombre: string;
    FRapid: boolean;
    FRemoteAuto: boolean;
    FRemoteManual: boolean;
  public
    constructor Create(ACollection: TCollection); override;
  published
   {
    -Rapid  -LocalManual  -LocalAuto  -RemoteManual \
      -RemoteAuto }
    property Nombre: string read FNombre write FNombre;
    property Rapid: boolean read FRapid write FRapid;
    property LocalManual: boolean read FLocalManual write FLocalManual;
    property LocalAuto: boolean read FLocalAuto write FLocalAuto;
    property RemoteManual: boolean read FRemoteManual write FRemoteManual;
    property RemoteAuto: boolean read FRemoteAuto write FRemoteAuto;
  end;

type

  { TAccessLevelList }

  TAccessLevelList = class(TCollection)
  private
    FNombreSeccion: string;
    function GetItems(index: integer): TAccessLevelItem;
    procedure SetItems(Index: integer; AValue: TAccessLevelItem);
  public
    constructor Create;
    function Add: TAccessLevelItem;
    property Items[Index: integer]: TAccessLevelItem read GetItems write SetItems;
      default;
    procedure LoadFromString(StringList: TStringList);
    property NombreSeccion: string read FNombreSeccion;
  end;

type

  { TEioRw6 }

  TEioRw6 = class
  private
    FAccessLevelList: TAccessLevelList;
    FConexionesCruzadas: TCrossConnectionList;
    FEntradasSistema: TSysInputtList;
    FNetWorks: TNetWorkList;
    FSalidasSistema: TSysOutPutList;
    FSenales: TSignalList;

  public
    property SysOutPutList: TSysOutPutList read FSalidasSistema write FSalidasSistema;
    property SysInputtList: TSysInputtList read FEntradasSistema write FEntradasSistema;
    property CrossConnectionList: TCrossConnectionList
      read FConexionesCruzadas write FConexionesCruzadas;
    property SignalList: TSignalList read FSenales write FSenales;
    property NetWorkList: TNetWorkList read FNetWorks write FNetWorks;
    property AccessLevelList: TAccessLevelList
      read FAccessLevelList write FAccessLevelList;
  public
    procedure Add(aListaSenales: TSignalList);
    procedure Add(aListaEntradasSistema: TSysInputtList); overload;
    procedure Add(aListaSalidasSistema: TSysOutPutList); overload;
    procedure Add(aListaConexionesCruzadas: TCrossConnectionList); overload;
    procedure Add(aListaAccessLevel: TAccessLevelList); overload;
  public
    procedure LoadFromFile(FileName: TFileName);
    procedure Clear;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{$IFDEF DEBUG}
  uses LazLogger;
{$ENDIF}
{ TEioRw6 }

procedure TEioRw6.Add(aListaSenales: TSignalList);
var
  I: integer;
  Dato: TSignalItem;
begin
  for I := 0 to aListaSenales.Count - 1 do
  begin
    Dato := Self.SignalList.Add;
    Dato := aListaSenales.Items[I];
  end;
end;

procedure TEioRw6.Add(aListaEntradasSistema: TSysInputtList);
var
  I: integer;
  Dato: TSysInputItem;
begin
  for I := 0 to aListaEntradasSistema.Count - 1 do
  begin
    Dato := Self.SysInputtList.Add;
    Dato := aListaEntradasSistema.Items[I];
  end;
end;

procedure TEioRw6.Add(aListaSalidasSistema: TSysOutPutList);
var
  Dato: TSysOutputItem;
  I: integer;
begin
  for I := 0 to aListaSalidasSistema.Count - 1 do
  begin
    Dato := Self.SysOutPutList.Add;
    Dato := aListaSalidasSistema.Items[I];
  end;
end;

procedure TEioRw6.Add(aListaConexionesCruzadas: TCrossConnectionList);
var
  Dato: TCrossConnectionItem;
  I: integer;
begin
  for I := 0 to aListaConexionesCruzadas.Count - 1 do
  begin
    Dato := Self.CrossConnectionList.Add;
    Dato := aListaConexionesCruzadas.Items[I];
  end;
end;

procedure TEioRw6.Add(aListaAccessLevel: TAccessLevelList);
var
  Dato: TAccessLevelItem;
  I: integer;
begin
  for I := 0 to aListaAccessLevel.Count - 1 do
  begin
    Dato := Self.AccessLevelList.Add;
    Dato := aListaAccessLevel.Items[I];
  end;
end;

procedure TEioRw6.LoadFromFile(FileName: TFileName);
var
  Archivo: TStringList;
  CabeceraValida: boolean;
  Cadena: string;
  I: integer;
begin
  Archivo := TStringList.Create;
  try
    //Comprobar cabecera
    Archivo.LoadFromFile(FileName);
    {$IFDEF DEBUG}
      DebugLn({$I %CURRENTROUTINE%});
      DebugLn('Fichero cargado: '+FileName);
       if Archivo.Count < 10 then
       begin
         DebugLn(Archivo.text);
       end
       else
       begin
         For I := 0 To 9 Do
         begin
           DebugLn(Archivo[I]);
         end;
       end;
    {$ENDIF}
    I := 0;
    CabeceraValida := False;
    while I < Archivo.Count do
    begin
      Cadena := trim(uppercase(Archivo[I]));
      if (Cadena = 'EIO:CFG_1.0:6:1::') or (Cadena = 'EIO:CFG_1.0:6:0::') then
      begin
        CabeceraValida := True;
        I := Archivo.Count;
      end;
      I := I + 1;
    end;
    if CabeceraValida = False then
    begin
      raise  EEioError.Create('No se reconece el archivo: ' + ExtractFileName(FileName));
    end;
    //  I := Archivo.Count;
    FSalidasSistema.LoadFromStrings(Archivo);
    FEntradasSistema.LoadFromStrings(Archivo);
    FConexionesCruzadas.LoadFromStrings(Archivo);
    FSenales.LoadFromStrings(Archivo);
    FNetWorks.LoadFromStrings(Archivo);
    FAccessLevelList.LoadFromString(Archivo);

  finally
    FreeAndNil(Archivo);
  end;
end;

procedure TEioRw6.Clear;
begin
  FSalidasSistema.Clear;
  FEntradasSistema.Clear;
  FConexionesCruzadas.Clear;
  FSenales.Clear;
  FNetWorks.Clear;
  FAccessLevelList.Clear;
end;



constructor TEioRw6.Create;
begin
  FSalidasSistema := TSysOutPutList.Create;
  FEntradasSistema := TSysInputtList.Create;
  FConexionesCruzadas := TCrossConnectionList.Create;
  FSenales := TSignalList.Create;
  FNetWorks := TNetWorkList.Create;
  FAccessLevelList := TAccessLevelList.Create;
end;

destructor TEioRw6.Destroy;
begin
  FreeAndNil(FSalidasSistema);
  FreeAndNil(FEntradasSistema);
  FreeAndNil(FConexionesCruzadas);
  FreeAndNil(FSenales);
  FreeAndNil(FNetWorks);
  FreeAndNil(FAccessLevelList);
  inherited Destroy;
end;

{ TAccessLevelList }

function TAccessLevelList.GetItems(index: integer): TAccessLevelItem;
begin
  Result := TAccessLevelItem(inherited Items[index]);
end;

procedure TAccessLevelList.SetItems(Index: integer; AValue: TAccessLevelItem);
begin
  items[Index].Assign(AValue);
end;

constructor TAccessLevelList.Create;
begin
  FNombreSeccion := 'EIO_SIGNAL_SAFELEVEL';
  inherited Create(TAccessLevelItem);
end;

function TAccessLevelList.Add: TAccessLevelItem;
begin
  Result := inherited Add as TAccessLevelItem;
end;

procedure TAccessLevelList.LoadFromString(StringList: TStringList);
var
  Inicio, bRapid, bLocalManual, bRemoteManual, bLocalAuto, bRemoteAuto: boolean;
  I, x: integer;
  Temp, Parte, Parametro, strNombre, cadena: string;
  Palabras: SizeInt;
  dato: TAccessLevelItem;
begin
  Inicio := False;
  I := 0;
  while I < StringList.Count - 1 do
  begin
    cadena := StringList[I];
    if ((cadena = '#') or AnsiEndsStr(':', Cadena)) and (Inicio = True) then
    begin
      i := StringList.Count;
      inicio := False;
      if (inicio = True) and (Cadena <> '') then
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
        strNombre := '';
        bRapid := False;
        bLocalManual := False;
        bLocalAuto := False;
        bRemoteManual := False;
        bRemoteAuto := False;
        Palabras := WordCount(Cadena, ['-']);
        for x := 1 to Palabras do
        begin
          Parte := ExtractWord(X, Cadena, ['-']);
          Parametro := ExtractWord(1, Parte, [' ']);
          case Parametro of
            'Name':
              strNombre := ExtractWord(2, Parte, [' ']);
            'Rapid':
              bRapid := True;
            'LocalManual':
              bLocalManual := True;
            'LocalAuto':
              bLocalAuto := True;
            'RemoteManual':
              bRemoteManual := True;
            'RemoteAuto':
              bRemoteAuto := True;
            else
              raise EEioError.Create('Fail Reading AccessLevel Seccion');
          end;
        end;
        if strNombre <> '' then
        begin
          raise EEioError.Create('Fail Reading AccessLevel Seccion');
        end;
        if (bRapid or bLocalManual or bLocalAuto or bRemoteManual or
          bRemoteAuto) = False then
        begin
          raise EEioError.Create('Fail Reading AccessLevel Seccion');
        end;
        dato := self.Add;
        dato.Nombre := strNombre;
        dato.Rapid := bRapid;
        dato.LocalAuto := bLocalAuto;
        dato.LocalManual := bLocalManual;
        dato.RemoteAuto := bRemoteAuto;
        dato.RemoteManual := bRemoteManual;
      end;

      if Cadena = 'EIO_ACCESS:' then
      begin
        inicio := True;
      end;
    end;
    I := I + 1;
  end;
end;

{ TAccessLevelItem }

constructor TAccessLevelItem.Create(ACollection: TCollection);
begin
  if Assigned(ACollection) then
    inherited Create(ACollection);
end;


{ TNetWorkList }

function TNetWorkList.GetItems(Index: integer): TNetWorkItem;
begin
  Result := TNetWorkItem(inherited Items[index]);
end;

procedure TNetWorkList.SetItems(Index: integer; AValue: TNetWorkItem);
begin
  items[Index].Assign(AValue);
end;

constructor TNetWorkList.Create;
begin
  FNombreSeccion := 'INDUSTRIAL_NETWORK';
  inherited Create(TNetWorkItem);
end;

function TNetWorkList.Add: TNetWorkItem;
begin
  Result := inherited Add as TNetWorkItem;
end;

procedure TNetWorkList.LoadFromStrings(StringList: TStringList);
var
  Inicio: boolean;
  I, X: integer;
  cadena, Temp, Valor, stName, stLabel, stAddress, stSubnetMask,
  stGateway, Parte, Parametro: string;
  Palabras: SizeInt;
  dato: TNetWorkItem;
begin
  Inicio := False;
  I := 0;
  while I < StringList.Count - 1 do
  begin
    cadena := StringList[I];
    if ((Cadena = '#') or AnsiEndsStr(':', Cadena)) and (inicio = True) then
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
      //if Palabras < 5 then
      //begin
      //  raise EEioError.Create('Fail reading file Eio. Seccion INDUSTRIAL_NETWORK');
      //end;

      stName := '';
      stLabel := '';
      stAddress := '';
      stSubnetMask := '';
      stGateway := '';

      for X := 1 to Palabras do
      begin
        Parte := ExtractWord(X, Cadena, ['-']);
        Parametro := ExtractWord(1, Parte, [' ']);
        Valor := ExtractWord(2, Parte, [' ']);
        Valor := TrimSet(Valor, ['"']);
        case Parametro of
          'Name':
            stName := Valor;
          'Label':
            stLabel := Valor;
          'Address':
            stAddress := Valor;
          'SubnetMask':
            stSubnetMask := Valor;
          'Gateway':
            stGateway := Valor;
        end;
      end;


      dato := Self.Add;
      dato.Nombre := stName;
      dato.IdenficationLabel := stLabel;
      dato.Address := stAddress;
      dato.SubnetMask := stSubnetMask;
      dato.Gateway := stGateway;

    end;

    //Buscar inicio de seccion
    if Cadena = 'INDUSTRIAL_NETWORK:' then
    begin
      inicio := True;
    end;

    I := I + 1;
  end;

end;

{ TNetWorkItem }

constructor TNetWorkItem.Create(ACollection: TCollection);
begin

  if Assigned(ACollection) then
  begin

    inherited Create(ACollection);

  end;
end;

function TNetWorkItem.Exportar: TStringList;
var
  Cadena: string;
  temp: string;

  procedure NuevoCampo;
  begin
    if Length(Cadena) + Length(Temp) < 80 then
    begin
      Cadena := Cadena + Temp;
    end
    else
    begin
      Result.Add(#09 + Cadena + '\');
      Cadena := Temp;
    end;
  end;

begin
  Result := TStringList.Create;
  Result.Add('');
  Result.Add(Format('-Name "%s"', [FNombre]));

  if FIdenficationLabel <> '' then
  begin
    Cadena := Cadena + Format(' -IdenficationLabel "%s"', [FIdenficationLabel]);
    NuevoCampo;
  end;
  if FAddress <> '' then
  begin
    Cadena := Cadena + Format(' -Address "%s"', [FAddress]);
    NuevoCampo;
  end;
  if FSubnetMask <> '' then
  begin
    Cadena := Cadena + Format(' -SubnetMask "%s"', [FSubnetMask]);
    NuevoCampo;
  end;

  if FGateway <> '' then
  begin
    Cadena := Cadena + Format(' -Gateway "%s"', [FSubnetMask]);
    NuevoCampo;
  end;

  //if Fsim
end;

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
  FNombreSeccion := 'EIO_SIGNAL';
  inherited Create(TSignalItem);
end;

function TSignalList.Add: TSignalItem;
begin
  Result := inherited Add as TSignalItem;
end;

procedure TSignalList.LoadFromStrings(StringList: TStringList);
var
  dato: TSignalItem;
  Parametro, cadena, Parte, stSize, stName, stSignalType, stDevice,
  stDeviceMap, stSignalLabel, stCategory, stAccess, stDefault,
  stSafeLevel, stFiltPas, stFiltAct, stInvert, stEncType, stMaxLog,
  stMaxPhys, stMaxPhysLimit, stMaxBitVal, stMinLog, stMinPhys,
  stMinPhysLimit, stMinBitVal, Temp, Valor: string;
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
      stDevice := '';
      stDeviceMap := '';
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
          'Device':
            stDevice := Valor;
          'DeviceMap':
            stDeviceMap := Valor;
          'SignalLabel':
            stSignalLabel := Valor;
          'Category':
            stCategory := Valor;
          'Access':
            stAccess := Valor;
          'Default':
            stDefault := Valor;
          'SafeLevel':
            stSafeLevel := Valor;
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
      dato.DeviceMap := stDeviceMap;
      dato.Device := stDevice;
      dato.SignalLabel := stSignalLabel;
      dato.Category := stCategory;
      dato.Access := stAccess;
      dato.DefaultValue := stDefault;
      dato.SafeLevel := stSafeLevel;
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
  Carta: string;
begin
  Result := TStringList.Create;
  Result.Sorted := True;
  Result.Duplicates := dupIgnore;
  for I := 0 to Self.Count - 1 do
  begin
    Carta := Self.GetItems(I).Device;
    Result.Add(Carta);
  end;
end;

procedure TSignalList.AddFromCvsList(aLista: TStringList);
var
  I: integer;
  Punto: TSignalItem;
  Cadena: string;
begin
  for I := 0 to aLista.Count - 1 do
  begin
    Cadena := aLista[I];
    if WordCount(Cadena, [',']) > 2 then
    begin
      Punto := Self.Add;
      Punto.Nombre := ExtractWord(1, Cadena, [',']);
      { TODO : Continuar }    end;
  end;
end;

procedure TSignalList.Exportar(aFilename: TFileName);
var
  ArchivoFinal, Lineas: TStringList;
  I: integer;
begin
  ArchivoFinal := TStringList.Create;
  ArchivoFinal.Add('EIO:CFG_1.0:6:1::');
  ArchivoFinal.Add('#');
  ArchivoFinal.Add('EIO_SIGNAL:');
  try
    // Lineas := TStringList.Create;
    for I := 0 to Self.Count - 1 do
    begin
      //Line//as.Clear;
      Lineas := Self.Items[I].Exportar;
      ArchivoFinal.AddStrings(Lineas);
      Lineas.Free;
    end;
  finally
    ArchivoFinal.SaveToFile(aFilename);
    FreeAndNil(ArchivoFinal);
  end;
end;

{ TSignalItem }

constructor TSignalItem.Create(ACollection: TCollection);
begin
  if Assigned(ACollection) then
    inherited Create(ACollection);
end;

function TSignalItem.Exportar: TStringList;
var
  Cadena: string;
  temp: string;

  procedure NuevoCampo;
  begin
    if Length(Cadena) + Length(Temp) < 80 then
    begin
      Cadena := Cadena + Temp;
    end
    else
    begin
      Result.Add(#09 + Cadena + '\');
      Cadena := Temp;
    end;
  end;

begin
  Result := TStringList.Create;
  Result.Add('');
  Cadena := Format('-Name "%s" -SignalType "%s"',
    [Nombre, SignalType, Device, DeviceMap]);

  if Device <> '' then
  begin
    Cadena := Cadena + Format(' -Device "%s" -DeviceMap "%s"', [Device, DeviceMap]);
  end;

  if Category <> '' then
  begin
    Temp := Format(' -Category "%s"', [Category]);
    NuevoCampo;
  end;


  if SignalLabel <> '' then
  begin
    Temp := Format(' -Label "%s"', [SignalLabel]);
    NuevoCampo;
  end;


  if FiltAct <> '' then
  begin
    Temp := Format(' -FiltAct %s', [FiltAct]);
    NuevoCampo;
  end;

  if FiltPas <> '' then
  begin
    Temp := Format(' -FiltPas %s', [FiltPas]);
    NuevoCampo;
  end;

  if DefaultValue <> '' then
  begin
    Temp := Format(' -DefaultValue "%s"', [DefaultValue]);
    NuevoCampo;
  end;

  if SafeLevel <> '' then
  begin
    temp := Format(' -SafeLevel "%s"', [SafeLevel]);
    NuevoCampo;
  end;

  if Invert <> '' then
  begin
    temp := Format(' -Invert "%s"', [Invert]);
    NuevoCampo;
  end;

  if EncType <> '' then
  begin
    temp := Format(' -EncType "%s"', [EncType]);
    NuevoCampo;
  end;

  if MaxLog <> '' then
  begin
    temp := Format(' -MaxLog %s', [MaxLog]);
    NuevoCampo;
  end;

  if MaxPhys <> '' then
  begin
    temp := Format(' -MaxPhys %s', [MaxLog]);
    NuevoCampo;
  end;

  if MaxPhysLimit <> '' then
  begin
    temp := Format(' -MaxPhysLimit %s', [MaxPhysLimit]);
    NuevoCampo;
  end;

  if MaxBitVal <> '' then
  begin
    temp := Format(' -MaxBitVal %s', [MaxBitVal]);
    NuevoCampo;
  end;

  if MinLog <> '' then
  begin
    temp := Format(' -MinLog %s', [MinLog]);
    NuevoCampo;
  end;

  if MinPhys <> '' then
  begin
    temp := Format(' -MinPhys %s', [MinPhys]);
    NuevoCampo;
  end;

  if MinPhysLimit <> '' then
  begin
    temp := Format(' -MinPhysLimit %s', [MinPhysLimit]);
    NuevoCampo;
  end;

  if MinBitVal <> '' then
  begin
    temp := Format(' -MinBitVal %s', [MinPhysLimit]);
    NuevoCampo;
  end;

  temp := ' -Size 1';
  NuevoCampo;

  if Cadena <> '' then
  begin
    Result.Add(#09 + Cadena);
  end;

end;

procedure TSignalItem.Assign(T: TPersistent);
begin
  if T is TSignalItem then
  begin
    FAccess := TSignalItem(T).Access;
    FCategory := TSignalItem(T).Category;
    FDefaultValue := TSignalItem(T).DefaultValue;
    FDevice := TSignalItem(T).Device;
    FDeviceMap := TSignalItem(T).DeviceMap;
    FEncType := TSignalItem(T).EncType;
    FFiltAct := TSignalItem(T).FiltAct;
    FFiltPas := TSignalItem(T).FiltPas;
    FInvert := TSignalItem(T).Invert;
    FMaxBitVal := TSignalItem(T).MaxBitVal;
    FMaxLog := TSignalItem(T).MaxLog;
    FMaxPhys := TSignalItem(T).FMaxPhys;
    FMaxPhysLimit := TSignalItem(T).FMaxPhysLimit;
    FMinBitVal := TSignalItem(T).MinBitVal;
    FMinLog := TSignalItem(T).FMaxLog;
    FMinPhys := TSignalItem(T).FMinPhys;
    FMinPhysLimit := TSignalItem(T).FMinPhysLimit;
    FNombre := TSignalItem(T).Nombre;
    FSafeLevel := TSignalItem(T).SafeLevel;
    FSignalLabel := TSignalItem(T).SignalLabel;
    FSignalType := TSignalItem(T).SignalType;
    FSize := TSignalItem(T).Size;
  end
  else
  begin
    inherited Assign(T);
  end;
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

function TCrossConnectionList.GetCrossByName(aCrossName: string): TCrossConnectionItem;
var
  I: integer;
begin
  Result := TCrossConnectionItem.Create(nil);
  for I := 0 to Count - 1 do
  begin
    if CompareText(Items[I].Nombre, aCrossName) = 0 then
    begin
      Result := Items[I];
      Exit;
    end;
  end;
  Result := nil;
end;

constructor TCrossConnectionList.Create;
begin
  FNombreSeccion := 'EIO_CROSS';
  inherited Create(TCrossConnectionItem);
end;

function TCrossConnectionList.Add: TCrossConnectionItem;
begin
  Result := inherited Add as TCrossConnectionItem;
end;

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
      //Las tres parametros: name res y act1 son obligatorios y por este orden
      Palabras := WordCount(Cadena, ['-']);
      if Palabras < 3 then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion EIO_CROSS');
      end;
      Parte1 := ExtractWord(1, Cadena, ['-']);
      Parametro := ExtractWord(1, Parte1, [' ']);
      if Parametro <> 'Name' then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion EIO_CROSS');
      end;
      strName := ExtractWord(2, Cadena, [' ']);

      Parte1 := ExtractWord(2, Cadena, ['-']);
      Parametro := ExtractWord(1, Parte1, [' ']);
      if Parametro <> 'Res' then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion EIO_CROSS');
      end;
      strRes := ExtractWord(2, Parte1, [' ']);

      Parte1 := ExtractWord(3, Cadena, ['-']);
      Parametro := ExtractWord(1, Parte1, [' ']);
      if Parametro <> 'Act1' then
      begin
        raise EEioError.Create('Fail reading file Eio. Seccion EIO_CROSS');
      end;
      strAct1 := ExtractWord(2, Parte1, [' ']);

      //Parámetros  opcionales

      if Palabras > 3 then
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
      dato.Nombre := TrimSet(strName, ['"']);
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

function TCrossConnectionItem.GetNumberActors: integer;
begin
  Result := 0;
  if FAct1 <> '' then
    Result := Result + 1;
  if FAct2 <> '' then
    Result := Result + 1;
  if FAct3 <> '' then
    Result := Result + 1;
  if FAct4 <> '' then
    Result := Result + 1;
  if FAct5 <> '' then
    Result := Result + 1;

end;

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
  FNombreSeccion := 'SYSSIG_IN';
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
  Arg4, Arg5, Arg6, Arg7, Arg8, Arg9: string;
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
      Arg7 := '';
      Arg8 := '';
      Arg9 := '';
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

        if (Pos('-Arg9', Cadena) > 1) then
        begin
          Arg9 := Copy(Cadena, Pos('-Arg9', Cadena), Length(Cadena));
          Arg9 := ExtractWord(2, Arg9, [' ']);
        end;

      end;
      dato := Self.Add;
      dato.FSignalName := TrimSet(srtSignal, ['"']);
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
  FNombreSeccion := 'SYSSIG_OUT';
  inherited Create(TSysOutputItem);
end;

function TSysOutPutList.Add: TSysOutputItem;
begin
  Result := inherited Add as TSysOutputItem;
end;

procedure TSysOutPutList.LoadFromStrings(StringList: TStringList);
var
  I, X: integer;
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
      if Palabras < 2 then
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

      for X := 3 to Palabras do
      begin
        Parte1 := ExtractWord(X, Cadena, ['-']);
        Parte2 := ExtractWord(2, Parte1, [#32]);
        Parte2 := TrimSet(Parte2, ['"']);
        case X of
          3:
            dato.FArg1 := Parte2;
          4:
            dato.FArg2 := Parte2;
          5:
            dato.FArg3 := Parte2;
          6:
            dato.FArg4 := Parte2;
          7:
            dato.FArg5 := Parte2;
          8:
            dato.FArg6 := Parte2;
          9:
            dato.FArg7 := Parte2;
          10:
            dato.FArg8 := Parte2;
        end;
      end;

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
