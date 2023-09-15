unit iosystem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, parmacomun;

type

  { TAccessLevelItem }

  TAccessLevelItem = class(TCollectionItem)
  private
    FLocalAuto: boolean;
    FLocalManual: boolean;
    FName: string;
    FRapid: boolean;
    FRemoteAuto: boolean;
    FRemoteManual: boolean;
  public
    procedure Assign(Source: TPersistent); override;
    function GenerateLines: TStringList;
  published
    property Name: string read FName write FName;
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
    FSeccionName: string;
    procedure SetItems(Index: integer; AValue: TAccessLevelItem);
    function GetItems(Index: integer): TAccessLevelItem;
  public
    constructor Create;
    property SeccionName: string read FSeccionName;
    function Add: TAccessLevelItem;
    property Items[Index: integer]: TAccessLevelItem read GetItems write SetItems;
      default;
  published
    procedure LoadFromStrings(StringList: TStringList);
  end;


type
  { TCrossConexionItem }

  TCrossConexionItem = class(TCollectionItem)
  private
    FAct1: string;
    FAct1_invert: boolean;
    FAct2: string;
    FAct2_invert: boolean;
    FAct3: string;
    FAct3_invert: boolean;
    FAct4: string;
    FAct4_invert: boolean;
    FAct5: string;
    FAct5_invert: boolean;
    FName: string;
    FOper1: string;
    FOper2: string;
    FOper3: string;
    FOper4: string;
    FResultant: string;
  public
    procedure Assign(Source: TPersistent); override;
    function GenerateLines: TStringList;
  published
    property Name: string read FName write FName;
    property Res: string read FResultant write FResultant;
    property Act1: string read FAct1 write FAct1;
    property Act1_invert: boolean read FAct1_invert write FAct1_invert;
    property Oper1: string read FOper1 write FOper1;

    property Act2: string read FAct2 write FAct2;
    property Act2_invert: boolean read FAct2_invert write FAct2_invert;
    property Oper2: string read FOper2 write FOper3;

    property Act3: string read FAct3 write FAct3;
    property Act3_invert: boolean read FAct3_invert write FAct3_invert;
    property Oper3: string read FOper3 write FOper3;

    property Act4: string read FAct4 write FAct4;
    property Act4_invert: boolean read FAct4_invert write FAct4_invert;
    property Oper4: string read FOper4 write FOper4;

    property Act5: string read FAct5 write FAct5;
    property Act5_invert: boolean read FAct5_invert write FAct5_invert;
  end;

type

  { TCrossConexionList }

  TCrossConexionList = class(TCollection)
  private
    procedure SetItems(Index: integer; AValue: TCrossConexionItem);
    function GetItems(Index: integer): TCrossConexionItem;
  public
    constructor Create;
    function Add: TCrossConexionItem;
    property Items[Index: integer]: TCrossConexionItem read GetItems write SetItems;
      default;
  published
    procedure LoadFromStrings(StringList: TStringList);
    function Text: TStringList;
  end;

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
    FIdenficationLabel: string;
    FInvert: string;
    FMaxBitVal: string;
    FMaxLog: string;
    FMaxPhys: string;
    FMaxPhysLimit: string;
    FMinBitVal: string;
    FMinLog: string;
    FMinPhys: string;
    FMinPhysLimit: string;
    FName: string;
    FSafeLevel: string;
    FSignalType: string;
    FSize: string;
  public
    procedure Assign(Source: TPersistent); override;
    function GenerateLines: TStringList;
  published
    constructor Create(ACollection: TCollection); override;
    property Name: string read FName write FName;
    property SignalType: string read FSignalType write FSignalType;
    property Device: string read FDevice write FDevice;
    property DeviceMap: string read FDeviceMap write FDeviceMap;
    property IdenficationLabel: string read FIdenficationLabel write FIdenficationLabel;
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
  end;

type

  { TSignalList }

  TSignalList = class(TCollection)
  private
    procedure SetItems(Index: integer; AValue: TSignalItem);
    function GetItems(Index: integer): TSignalItem;
  public
    constructor Create;
    procedure LoadFromStrings(StringList: TStringList);
    function Add: TSignalItem;
    property Items[Index: integer]: TSignalItem read GetItems write SetItems; default;
    function Text: TStringList;
  end;

type

  { TSystemInputItem }

  TSystemInputItem = class(TCollectionItem)
  private
    FAccion: string;
    FArg1: string;
    FArg2: string;
    FArg3: string;
    FArg4: string;
    FArg5: string;
    FArg6: string;
    FArg7: string;
    FArg8: string;
    FArg9: string;
    FSignal: string;
  public
    procedure Assign(Source: TPersistent); override;
    function GenerateLines: TStringList;
  published
    property Signal: string read FSignal write FSignal;
    property Accion: string read FAccion write FAccion;
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


type

  { TSystemInputList }

  TSystemInputList = class(TCollection)
  private
    procedure SetItems(Index: integer; AValue: TSystemInputItem);
    function GetItems(Index: integer): TSystemInputItem;
  public
    constructor Create;
    procedure LoadFromStrings(StringList: TStringList);
    function Add: TSystemInputItem;
    property Items[Index: integer]: TSystemInputItem read GetItems write SetItems;
      default;
    function Text: TStringList;
  end;

type

  { TSystemOutputItem }

  TSystemOutputItem = class(TCollectionItem)
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
    FStatus: string;
  public
    function GenerateLines: TStringList;
  published
    property Signal: string read FSignal write FSignal;
    property Status: string read FStatus write FStatus;
    property Arg1: string read FArg1 write FArg1;
    property Arg2: string read FArg2 write FArg2;
    property Arg3: string read FArg3 write FArg3;
    property Arg4: string read FArg4 write FArg4;
    property Arg5: string read FArg5 write FArg5;
    property Arg6: string read FArg6 write FArg6;
    property Arg7: string read FArg7 write FArg7;
    property Arg8: string read FArg8 write FArg8;
  end;

type

  { TSystemOutputList }

  TSystemOutputList = class(TCollection)
  private
    procedure SetItems(Index: integer; AValue: TSystemOutputItem);
    function GetItems(Index: integer): TSystemOutputItem;
  public

    constructor Create;
    procedure LoadFromStrings(StringList: TStringList);
    function Add: TSystemOutputItem;
    property Items[Index: integer]: TSystemOutputItem read GetItems write SetItems;
      default;
    function Text: TStringList;
  end;

type

  { TIndustrialNetworkItem }

  TIndustrialNetworkItem = class(TCollectionItem)
  private
    FAddress: string;
    FCfgPath: string;
    FConnection: string;
    FIdenficationLabel: string;
    FName: string;
    FNestedDiagnosis: boolean;
    FSimulated: boolean;
    FStationName: string;
  public
    procedure Assign(Source: TPersistent); override;
    function GenerateLines: TStringList;
  published
    property Name: string read FName write FName;
    property Connection: string read FConnection write FConnection;
    property IdenficationLabel: string read FIdenficationLabel write FIdenficationLabel;
    property CfgPath: string read FCfgPath write FCfgPath;
    property StationName: string read FStationName write FStationName;
    property Address: string read FAddress write FAddress;
    property Simulated: boolean read FSimulated write FSimulated;
    property NestedDiagnosis: boolean read FNestedDiagnosis write FNestedDiagnosis;
  end;

type

  { TIndustrialNetworkList }

  TIndustrialNetworkList = class(TCollection)
    procedure SetItems(Index: integer; AValue: TIndustrialNetworkItem);
    function GetItems(Index: integer): TIndustrialNetworkItem;



  public
    constructor Create;
    procedure LoadFromStrings(StringList: TStringList);
    function Add: TIndustrialNetworkItem;
    property Items[Index: integer]: TIndustrialNetworkItem read GetItems write SetItems;
      default;
    function Text: TStringList;
  end;

type

  { TioSystem }

  TioSystem = class

  private
    FAccessLevelList: TAccessLevelList;
    FCrossConexions: TCrossConexionList;
    FIndustrialNetworkList: TIndustrialNetworkList;
    FSignals: TSignalList;
    FSystemInputList: TSystemInputList;
    FSystemOutputList: TSystemOutputList;
  public
    constructor Create;
    destructor Destroy; override;
  public
    property SignalsList: TSignalList read FSignals write FSignals;
    property CrossConexionsList: TCrossConexionList
      read FCrossConexions write FCrossConexions;
    property AccessLevelList: TAccessLevelList
      read FAccessLevelList write FAccessLevelList;
    property SystemInputList: TSystemInputList
      read FSystemInputList write FSystemInputList;
    property SystemOutputList: TSystemOutputList
      read FSystemOutputList write FSystemOutputList;
    property IndustrialNetworkList: TIndustrialNetworkList
      read FIndustrialNetworkList write FIndustrialNetworkList;
  public
    procedure LoadFromFile(FileName: TFileName);
  end;

implementation

uses TypInfo;

{ TioSystem }

constructor TioSystem.Create;
begin
  FAccessLevelList := TAccessLevelList.Create;
  FCrossConexions := TCrossConexionList.Create;
  FIndustrialNetworkList := TIndustrialNetworkList.Create;
  FSignals := TSignalList.Create;
  FSystemInputList := TSystemInputList.Create;
  FSystemOutputList := TSystemOutputList.Create;
end;

destructor TioSystem.Destroy;
begin
  FreeAndNil(FAccessLevelList);
  FreeAndNil(FCrossConexions);
  FreeAndNil(FIndustrialNetworkList);
  FreeAndNil(FSignals);
  FreeAndNil(FSystemInputList);
  FreeAndNil(FSystemOutputList);
  inherited Destroy;
end;

procedure TioSystem.LoadFromFile(FileName: TFileName);
var
  lsFile: TStringList;
begin
  lsFile := TStringList.Create;
  try
    lsFile.LoadFromFile(FileName);
    if GetEioVersion(lsFile) <> vEio61 then
    begin
      { #todo : Poner excepción     }
      Exit;
    end;
    FAccessLevelList.LoadFromStrings(lsFile);
    FCrossConexions.LoadFromStrings(lsFile);
    FIndustrialNetworkList.LoadFromStrings(lsFile);
    FSignals.LoadFromStrings(lsFile);
    FSystemInputList.LoadFromStrings(lsFile);
    FSystemOutputList.LoadFromStrings(lsFile);
  finally
    FreeAndNil(lsFile);
  end;
end;

{ TSystemOutputItem }

function TSystemOutputItem.GenerateLines: TStringList;
begin
  Result := TStringList.Create;
  EscribirPropiedades(TCollectionItem(Self), Result);
end;

{ TIndustrialNetworkList }

procedure TIndustrialNetworkList.SetItems(Index: integer;
  AValue: TIndustrialNetworkItem);
begin
  items[Index].Assign(AValue);
end;

function TIndustrialNetworkList.GetItems(Index: integer): TIndustrialNetworkItem;
begin
  Result := TIndustrialNetworkItem(inherited Items[Index]);
end;

constructor TIndustrialNetworkList.Create;
begin
  inherited Create(TIndustrialNetworkItem);
end;

procedure TIndustrialNetworkList.LoadFromStrings(StringList: TStringList);
var
  Datos, Valores: TStringList;
  Elemento: TIndustrialNetworkItem;
  I: integer;
begin
  Datos := SeccionACadenas('EIO_CROSS:', StringList);
  for I := 0 to Datos.Count - 1 do
  begin
    Valores := LineaAValores(Trim(Datos[i]));
    Elemento := Self.Add;
    LeerPropiedades(TCollectionItem(Elemento), Valores);
    FreeAndNil(Valores);
  end;
  FreeAndNil(Datos);

end;

function TIndustrialNetworkList.Add: TIndustrialNetworkItem;
begin
  Result := inherited Add as TIndustrialNetworkItem;
end;

function TIndustrialNetworkList.Text: TStringList;
var
  stCross: TStringList;
  I: integer;
begin
  Result := TStringList.Create;
  Result.Add('INDUSTRIAL_NETWORK:  :');
  Result.Add('');
  for I := 0 to Self.Count - 1 do
  begin
    stCross := Self[I].GenerateLines;
    Result.AddStrings(stCross);
    Result.Add('');
    FreeAndNil(stCross);
  end;
  Result.Add('#');
end;

{ TSystemOutputList }

procedure TSystemOutputList.SetItems(Index: integer; AValue: TSystemOutputItem);
begin
  Items[Index].Assign(AValue);
end;

function TSystemOutputList.GetItems(Index: integer): TSystemOutputItem;
begin
  Result := TSystemOutputItem(inherited Items[Index]);
end;



constructor TSystemOutputList.Create;
begin
  inherited Create(TSystemOutputItem);
end;

procedure TSystemOutputList.LoadFromStrings(StringList: TStringList);
var
  Datos, Valores: TStringList;
  Elemento: TSystemOutputItem;
  I: integer;
begin
  Datos := SeccionACadenas('EIO_CROSS:', StringList);
  for I := 0 to Datos.Count - 1 do
  begin
    Valores := LineaAValores(Trim(Datos[i]));
    Elemento := Self.Add;
    LeerPropiedades(TCollectionItem(Elemento), Valores);
    FreeAndNil(Valores);
  end;
  FreeAndNil(Datos);

end;

function TSystemOutputList.Add: TSystemOutputItem;
begin
  Result := inherited Add as TSystemOutputItem;
end;

function TSystemOutputList.Text: TStringList;
var
  stCross: TStringList;
  I: integer;
begin
  Result := TStringList.Create;
  Result.Add('SYSSIG_OUT:');
  Result.Add('');
  for I := 0 to Self.Count - 1 do
  begin
    stCross := Self[I].GenerateLines;
    Result.AddStrings(stCross);
    Result.Add('');
    FreeAndNil(stCross);
  end;
  Result.Add('#');

end;

{ TSystemInputList }

procedure TSystemInputList.SetItems(Index: integer; AValue: TSystemInputItem);
begin
  Items[Index].Assign(AValue);
end;

function TSystemInputList.GetItems(Index: integer): TSystemInputItem;
begin
  Result := TSystemInputItem(inherited Items[Index]);
end;


constructor TSystemInputList.Create;
begin
  inherited Create(TSystemInputItem);
end;

procedure TSystemInputList.LoadFromStrings(StringList: TStringList);
var
  Datos, Valores: TStringList;
  Elemento: TSystemInputItem;
  I: integer;
begin
  Datos := SeccionACadenas('EIO_CROSS:', StringList);
  for I := 0 to Datos.Count - 1 do
  begin
    Valores := LineaAValores(Trim(Datos[i]));
    Elemento := Self.Add;
    LeerPropiedades(TCollectionItem(Elemento), Valores);
    //Elemento.LeerValores(Valores);
    FreeAndNil(Valores);
  end;
  FreeAndNil(Datos);

end;

function TSystemInputList.Add: TSystemInputItem;
begin
  Result := inherited Add as TSystemInputItem;
end;

function TSystemInputList.Text: TStringList;
var
  stInputList: TStringList;
  I: integer;
begin
  Result := TStringList.Create;
  Result.Add('SYSSIG_IN:');
  Result.Add('');
  for I := 0 to Self.Count - 1 do
  begin
    stInputList := Self[I].GenerateLines;
    Result.AddStrings(stInputList);
    Result.Add('');
    FreeAndNil(stInputList);
  end;
  Result.Add('#');

end;

{ TSignalList }

procedure TSignalList.SetItems(Index: integer; AValue: TSignalItem);
begin
  items[Index].Assign(AValue);
end;

function TSignalList.GetItems(Index: integer): TSignalItem;
begin
  Result := TSignalItem(inherited Items[Index]);
end;

constructor TSignalList.Create;
begin
  inherited Create(TSignalItem);
end;

procedure TSignalList.LoadFromStrings(StringList: TStringList);
var
  Datos, Valores: TStringList;
  Elemento: TSignalItem;
  I: integer;
begin
  Datos := SeccionACadenas('EIO_CROSS:', StringList);
  for I := 0 to Datos.Count - 1 do
  begin
    Valores := LineaAValores(Trim(Datos[i]));
    Elemento := Self.Add;
    LeerPropiedades(TCollectionItem(Elemento), Valores);
    //Elemento.LeerValores(Valores);
    FreeAndNil(Valores);
  end;
  FreeAndNil(Datos);

end;

function TSignalList.Add: TSignalItem;
begin
  Result := inherited Add as TSignalItem;
end;

function TSignalList.Text: TStringList;
var
  stSignal: TStringList;
  I: integer;
begin
  Result := TStringList.Create;
  Result.Add('EIO_SIGNAL:');
  Result.Add('');
  for I := 0 to Self.Count - 1 do
  begin
    stSignal := Self[I].GenerateLines;
    Result.AddStrings(stSignal);
    Result.Add('');
    FreeAndNil(stSignal);
  end;
  Result.Add('#');

end;

{ TIndustrialNetworkItem }

procedure TIndustrialNetworkItem.Assign(Source: TPersistent);
begin
  if Source is TIndustrialNetworkItem then
  begin
    FName := TIndustrialNetworkItem(Source).FName;
    FConnection := TIndustrialNetworkItem(Source).FConnection;
    FIdenficationLabel := TIndustrialNetworkItem(Source).FIdenficationLabel;
    FCfgPath := TIndustrialNetworkItem(Source).FCfgPath;
    FStationName := TIndustrialNetworkItem(Source).FStationName;
    FAddress := TIndustrialNetworkItem(Source).FAddress;
    FSimulated := TIndustrialNetworkItem(Source).FSimulated;
    FNestedDiagnosis := TIndustrialNetworkItem(Source).FNestedDiagnosis;
  end
  else
  begin
    inherited Assign(Source);
  end;
end;

function TIndustrialNetworkItem.GenerateLines: TStringList;
begin
  Result := TStringList.Create;
  EscribirPropiedades(TCollectionItem(Self), Result);
end;

{ TSystemOutputItem }



{ TSystemInputItem }

procedure TSystemInputItem.Assign(Source: TPersistent);
begin
  if Source is TSystemInputItem then
  begin
    FSignal := TSystemInputItem(Source).FSignal;
    FArg1 := TSystemInputItem(Source).FArg1;
    FArg2 := TSystemInputItem(Source).FArg2;
    FArg3 := TSystemInputItem(Source).FArg3;
    FArg4 := TSystemInputItem(Source).FArg4;
    FArg5 := TSystemInputItem(Source).FArg5;
    FArg6 := TSystemInputItem(Source).FArg6;
    FArg7 := TSystemInputItem(Source).FArg7;
    FArg8 := TSystemInputItem(Source).FArg8;
    FArg9 := TSystemInputItem(Source).FArg9;
  end
  else
  begin
    inherited Assign(Source);
  end;
end;

function TSystemInputItem.GenerateLines: TStringList;
begin
  Result := TStringList.Create;
  EscribirPropiedades(TCollectionItem(Self), Result);
end;

{ TSignalItem }

constructor TSignalItem.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
end;



procedure TSignalItem.Assign(Source: TPersistent);
begin
  if Source is TSignalItem then
  begin
    FAccess := TSignalItem(Source).FAccess;
    FCategory := TSignalItem(Source).FCategory;
    FDefaultValue := TSignalItem(Source).FDefaultValue;
    FDevice := TSignalItem(Source).FDevice;
    FDeviceMap := TSignalItem(Source).DeviceMap;
    FEncType := TSignalItem(Source).FEncType;
    FFiltAct := TSignalItem(Source).FFiltAct;
    FFiltPas := TSignalItem(Source).FFiltPas;
    FInvert := TSignalItem(Source).FInvert;
    FMaxBitVal := TSignalItem(Source).FMaxBitVal;
    FMaxLog := TSignalItem(Source).FMaxLog;
    FMaxPhys := TSignalItem(Source).FMaxPhys;
    FMaxPhysLimit := TSignalItem(Source).FMaxPhysLimit;
    FMinBitVal := TSignalItem(Source).FMinBitVal;
    FMinLog := TSignalItem(Source).FMaxLog;
    FMinPhys := TSignalItem(Source).FMinPhys;
    FMinPhysLimit := TSignalItem(Source).FMinPhysLimit;
    FName := TSignalItem(Source).FName;
    FSafeLevel := TSignalItem(Source).FSafeLevel;
    FIdenficationLabel := TSignalItem(Source).FIdenficationLabel;
    FSignalType := TSignalItem(Source).FSignalType;
    FSize := TSignalItem(Source).FSize;
  end
  else
  begin
    inherited Assign(Source);
  end;
end;

function TSignalItem.GenerateLines: TStringList;
begin
  Result := TStringList.Create;
  EscribirPropiedades(TCollectionItem(Self), Result);
end;

{ TAccessLevelList }

procedure TAccessLevelList.SetItems(Index: integer; AValue: TAccessLevelItem);
begin
  items[Index].Assign(AValue);
end;

function TAccessLevelList.GetItems(Index: integer): TAccessLevelItem;
begin
  Result := TAccessLevelItem(inherited Items[Index]);
end;

constructor TAccessLevelList.Create;
begin
  inherited Create(TAccessLevelItem);
end;

procedure TAccessLevelList.LoadFromStrings(StringList: TStringList);
var
  Datos, Valores: TStringList;
  Elemento: TAccessLevelItem;
  I: integer;
begin
  Datos := SeccionACadenas('EIO_ACCESS:', StringList);
  for I := 0 to Datos.Count - 1 do
  begin
    Valores := LineaAValores(Trim(Datos[i]));
    Elemento := Self.Add;
    LeerPropiedades(TCollectionItem(Elemento), Valores);
    FreeAndNil(Valores);
  end;
  FreeAndNil(Datos);
end;


function TAccessLevelList.Add: TAccessLevelItem;
begin
  Result := inherited Add as TAccessLevelItem;
end;

{ TAccessLevelItem }
procedure TAccessLevelItem.Assign(Source: TPersistent);
begin
  if Source is TAccessLevelItem then
  begin
    FName := TAccessLevelItem(Source).FName;
    FRapid := TAccessLevelItem(Source).FRapid;
    FLocalManual := TAccessLevelItem(Source).FLocalManual;
    FLocalAuto := TAccessLevelItem(Source).FLocalAuto;
    FRemoteManual := TAccessLevelItem(Source).FRemoteManual;
    FRemoteAuto := TAccessLevelItem(Source).FRemoteAuto;
  end
  else
  begin
    inherited Assign(Source);
  end;
end;

function TAccessLevelItem.GenerateLines: TStringList;
begin
  Result := TStringList.Create;
  EscribirPropiedades(TCollectionItem(Self), Result);
end;

{ TCrossConexionList }

procedure TCrossConexionList.SetItems(Index: integer; AValue: TCrossConexionItem);
begin
  items[Index].Assign(AValue);
end;

function TCrossConexionList.GetItems(Index: integer): TCrossConexionItem;
begin
  Result := TCrossConexionItem(inherited Items[Index]);
end;

constructor TCrossConexionList.Create;
begin
  inherited Create(TCrossConexionItem);
end;

procedure TCrossConexionList.LoadFromStrings(StringList: TStringList);
var
  Datos, Valores: TStringList;
  Elemento: TCrossConexionItem;
  I: integer;
begin
  Datos := SeccionACadenas('EIO_CROSS:', StringList);
  for I := 0 to Datos.Count - 1 do
  begin
    Valores := LineaAValores(Trim(Datos[i]));
    Elemento := Self.Add;
    LeerPropiedades(TCollectionItem(Elemento), Valores);
    //Elemento.LeerValores(Valores);
    FreeAndNil(Valores);
  end;
  FreeAndNil(Datos);
end;

function TCrossConexionList.Text: TStringList;
var
  stCross: TStringList;
  I: integer;
begin
  Result := TStringList.Create;
  Result.Add('EIO_CROSS:');
  Result.Add('');
  for I := 0 to Self.Count - 1 do
  begin
    stCross := Self[I].GenerateLines;
    Result.AddStrings(stCross);
    Result.Add('');
    FreeAndNil(stCross);
  end;
  Result.Add('#');
end;

function TCrossConexionList.Add: TCrossConexionItem;
begin
  Result := inherited Add as TCrossConexionItem;
end;

{ TCrossConexionItem }


procedure TCrossConexionItem.Assign(Source: TPersistent);
begin
  if Source is TCrossConexionItem then
  begin
    FName := TCrossConexionItem(Source).FName;

    FAct1 := TCrossConexionItem(Source).FAct1;
    FAct1_invert := TCrossConexionItem(Source).FAct1_invert;

    FAct2 := TCrossConexionItem(Source).FAct2;
    FAct2_invert := TCrossConexionItem(Source).FAct2_invert;

    FAct3 := TCrossConexionItem(Source).FAct3;
    FAct3_invert := TCrossConexionItem(Source).FAct3_invert;

    FAct4 := TCrossConexionItem(Source).FAct4;
    FAct4_invert := TCrossConexionItem(Source).FAct4_invert;

    FAct5 := TCrossConexionItem(Source).FAct5;
    FAct5_invert := TCrossConexionItem(Source).FAct5_invert;

    FOper1 := TCrossConexionItem(Source).FOper1;
    FOper2 := TCrossConexionItem(Source).FOper2;
    FOper3 := TCrossConexionItem(Source).FOper3;
    FOper4 := TCrossConexionItem(Source).FOper4;

    FResultant := TCrossConexionItem(Source).FResultant;
  end
  else
  begin
    inherited Assign(Source);
  end;

end;

function TCrossConexionItem.GenerateLines: TStringList;
var
  lsTemp: TStringList;
begin
  Result := TStringList.Create;
  EscribirPropiedades(TCollectionItem(Self), Result);
end;

end.
