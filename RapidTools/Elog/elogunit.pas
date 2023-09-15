unit ElogUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TElogItem }

  TElogItem = class(TCollectionItem)
  private
    FCategoria: string;
    FCodigo: integer;
    FDescripcion: string;
    FFecha: TDateTime;
    FSeqNo: integer;
    FTipo: string;
    FTitulo: string;
  public
    property SeqNo: integer read FSeqNo write FSeqNo;
    property Tipo: string read FTipo write FTipo;
    property Categoria: string read FCategoria write FCategoria;
    property Codigo: integer read FCodigo write FCodigo;
    property Titulo: string read FTitulo write FTitulo;
    property Descripcion: string read FDescripcion write FDescripcion;
    property Fecha: TDateTime read FFecha write FFecha;
  public
    function ToString: ansistring; override;
    procedure Assign(Source: TPersistent); override;
  end;

type

  { TElogList }

  TElogList = class(TCollection)
  private
    FCabecera: string;
    procedure SetItems(Index: integer; AValue: TElogItem);
    function GetItems(Index: integer): TElogItem;
  public
    function Add: TElogItem;
    property Items[Index: integer]: TElogItem read GetItems write SetItems; default;
    property Cabecera: string read FCabecera write FCabecera;

  end;

type

  { TDriveModuleInfo }

  TDriveModuleInfo = class(TCollectionItem)
  private
    FClave: string;
    FNombre: string;
    FOpciones: TStringList;
  public
    property Nombre: string read FNombre write FNombre;
    property Clave: string read FClave write FClave;
    property Opciones: TStringList read FOpciones write FOpciones;
  public
    procedure Assign(Source: TPersistent); override;
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
  end;

type

  { TDriveModuleList }

  TDriveModuleList = class(TCollection)
  public
    constructor Create;
    destructor Destroy; override;
  private
    procedure SetItems(Index: integer; AValue: TDriveModuleInfo);
    function GetItems(Index: integer): TDriveModuleInfo;
  public
    function Add: TDriveModuleInfo;
    property Items[Index: integer]: TDriveModuleInfo read GetItems write SetItems;
      default;
  end;

type
  TElog = class
  private
    FClaveControlador: string;
    FDate: TDateTime;
    FDriveModuleList: TDriveModuleList;
    FElog: TElogList;
    FIdControlador: string;
    FNombreControlador: string;
    FNombreSistema: string;
    FOpcionesControlador: TStringList;
    FRobotWare: string;
  private
    FFichero: TFileName;
    function GetListCategoria: TStringList;
  public
    property Elog: TElogList read FElog;
    property Date: TDateTime read FDate;
    property NombreSistema: string read FNombreSistema;
    property NombreControlador: string read FNombreControlador;
    property IdControlador: string read FIdControlador;
    property RobotWare: string read FRobotWare;
    property ClaveControlador: string read FClaveControlador;
    property OpcionesControlador: TStringList read FOpcionesControlador;
    property DriveModule: TDriveModuleList read FDriveModuleList;
    property ListaCategorias: TStringList read GetListCategoria;
    property Fichero: TFileName read FFichero;
  public
    procedure ReadElogFile(aFileName: TFileName);
    procedure Assign(Source: TElog);
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses StrUtils;

{
  Función auxiliar
  convierte la cadena de la fecha y hora a datetime, teniendo
  en cuenta los ajustes locales
}
function FechaToDateTime(ElogFecha: string): TDateTime;
var
  Ajustes: TFormatSettings;
begin
  Ajustes := DefaultFormatSettings;
  DefaultFormatSettings.DateSeparator := '-';
  DefaultFormatSettings.ShortDateFormat := 'YYYY-mm-dd';
  Result := StrToDateTime(ElogFecha);
  DefaultFormatSettings := Ajustes;
end;

{ TElogItem }

function TElogItem.ToString: ansistring;
var
  Cadena: string;
begin
  Cadena := IntToStr(FSeqNo);
  Cadena := Cadena + #09 + FTipo;
  Cadena := Cadena + #09 + FCategoria;
  Cadena := Cadena + #09 + IntToStr(FCodigo);
  Cadena := Cadena + #09 + FTitulo;
  Cadena := Cadena + #09 + DateTimeToStr(FFecha);
  Cadena := Cadena + #09 + FDescripcion;
  Result := Cadena;

end;

procedure TElogItem.Assign(Source: TPersistent);
begin
  if Source is TElogItem then
  begin
    FCategoria := TElogItem(Source).Categoria;
    FCodigo := TElogItem(Source).Codigo;
    FDescripcion := TElogItem(Source).Descripcion;
    FFecha := TElogItem(Source).Fecha;
    FSeqNo := TElogItem(Source).SeqNo;
    FTipo := TElogItem(Source).Tipo;
    FTitulo := TElogItem(Source).Titulo;
  end
  else
  begin
    inherited Assign(Source);
  end;
end;


{ TElogList }

procedure TElogList.SetItems(Index: integer; AValue: TElogItem);
begin
  Items[Index].Assign(AValue);
end;

function TElogList.GetItems(Index: integer): TElogItem;
begin
  Result := TElogItem(inherited Items[Index]);
end;

function TElogList.Add: TElogItem;
begin
  Result := inherited Add as TElogItem;
end;

{ TDriveModuleInfo }

procedure TDriveModuleInfo.Assign(Source: TPersistent);
begin
  if Source is TDriveModuleInfo then
  begin
    FClave := TDriveModuleInfo(Source).Clave;
    FNombre := TDriveModuleInfo(Source).Nombre;
    FOpciones.Assign(TDriveModuleInfo(Source).Opciones);
  end
  else
  begin
    inherited Assign(Source);
  end;
end;

constructor TDriveModuleInfo.Create(ACollection: TCollection);
begin
  FOpciones := TStringList.Create;
  inherited Create(ACollection);
end;

destructor TDriveModuleInfo.Destroy;
begin
  FreeAndNil(FOpciones);
  inherited Destroy;
end;

{ TDriveModuleList }

constructor TDriveModuleList.Create;
begin

  inherited Create(TDriveModuleInfo);
end;

destructor TDriveModuleList.Destroy;
begin
  inherited Destroy;
end;

procedure TDriveModuleList.SetItems(Index: integer; AValue: TDriveModuleInfo);
begin
  items[Index].Assign(AValue);
end;

function TDriveModuleList.GetItems(Index: integer): TDriveModuleInfo;
begin
  Result := TDriveModuleInfo(inherited Items[Index]);
end;

function TDriveModuleList.Add: TDriveModuleInfo;
begin
  Result := inherited Add as TDriveModuleInfo;
end;

{ TElog }

function TElog.GetListCategoria: TStringList;
var
  I: integer;
begin
  Result := TStringList.Create;
  Result.Sorted := True;
  Result.Duplicates := dupIgnore;
  for  I := 0 to FElog.Count - 1 do
  begin
    Result.Add(FElog.Items[I].Categoria);
  end;
end;

procedure TElog.ReadElogFile(aFileName: TFileName);
var
  lsFichero: TStringList;
  I: integer;
  Palabra, Cadena, Parte, Fecha, Hora: string;
  ControlerTerminado, fin: boolean;
  drv: TDriveModuleInfo;
  Valor: longint;
  DatoActual: TElogItem;
begin
  lsFichero := TStringList.Create;
  try
    lsFichero.LoadFromFile(aFileName);

    I := 0;
    ControlerTerminado := False;
    while I < lsFichero.Count - 1 do
    begin
      Cadena := Trim(lsFichero[I]);
      //N := WordCount(Cadena, [':']);
      if (WordCount(Cadena, [':']) > 1) and (ControlerTerminado = False) then
      begin
        Palabra := ExtractWord(1, Cadena, [':']);
        case Palabra of
          'Fecha':
          begin
            //Cambiamos los ajustes del sistema, para se adapten al sistema
            //inglés del archivo
            Cadena := trim(ExtractDelimited(2, Cadena, [#09]));
            Self.FDate := FechaToDateTime(Cadena);
          end;
          'Nombre de sistema':
          begin
            Self.FNombreSistema := trim(ExtractWord(2, Cadena, [':']));
          end;
          'Nombre de controlador':
          begin
            Self.FNombreControlador := trim(ExtractWord(2, Cadena, [':']));
          end;
          'RobotWare':
          begin
            Self.FRobotWare := trim(ExtractWord(2, Cadena, [':']));
          end;
          'Clave':
          begin
            Self.FClaveControlador := trim(ExtractWord(2, Cadena, [':']));
          end;
        end;
      end
      else
      begin
        fin := False;
        if (Cadena = 'ID de controlador') then
        begin
          I := I + 1;
          if I < lsFichero.Count - 1 then
          begin
            Cadena := Trim(lsFichero[I]);
            Self.FIdControlador := Cadena;
          end;
        end;
        if (Cadena = 'Opciones:') then
        begin
          I := I + 1;
          fin := False;
          while (I < lsFichero.Count - 1) and (Fin = False) do
          begin
            Cadena := Trim(lsFichero[I]);
            if (Pos('DriveModule', Cadena) < 1) then
            begin
              if Cadena <> '' then
              begin
                Self.FOpcionesControlador.Add(Cadena);
              end;
              I := I + 1;
            end
            else
            begin
              Fin := True;
            end;
          end;
        end;
        //n := Pos('DriveModule', Cadena);
        if (Pos('DriveModule', Cadena) > 0) then
        begin
          drv := Self.FDriveModuleList.Add;

          I := i + 1;
          fin := False;
          while (I < lsFichero.Count - 1) and (fin = False) do
          begin
            Cadena := trim(lsFichero[I]);
            if WordCount(Cadena, [':']) > 0 then
            begin
              Palabra := ExtractWord(1, Cadena, [':']);
              if Palabra = 'Clave' then
              begin
                drv.FClave := trim(ExtractWord(2, Cadena, [':']));
                I := i + 1;
              end
              else if Palabra = 'Opciones' then
              begin
                I := I + 1;
                fin := False;
                while (I < lsFichero.Count - 1) and (fin = False) do
                begin
                  Cadena := trim(lsFichero[I]);
                  if StartsText('Mensajes ', Cadena) = False then
                  begin
                    drv.FOpciones.Add(Cadena);
                    I := I + 1;
                  end
                  else
                  begin
                    Fin := True;
                  end;
                end;
              end;
            end
            else
            begin
              fin := True;
            end;
          end;
        end;
        if fin = True then
        begin
          I := I + 1;
          while I < lsFichero.Count - 1 do
          begin
            Cadena := trim(lsFichero[I]);
            Parte := trim(ExtractWord(1, Cadena, [#09]));
            if TryStrToInt(Parte, Valor) = True then
            begin
              DatoActual := FElog.Add;
              DatoActual.SeqNo := Valor;
              Parte := trim(ExtractWord(2, Cadena, [#09]));
              DatoActual.Tipo := Parte;

              Parte := trim(ExtractWord(3, Cadena, [#09]));
              DatoActual.Categoria := Parte;

              Parte := trim(ExtractWord(4, Cadena, [#09]));
              if TryStrToInt(Parte, Valor) = True then
              begin
                DatoActual.Codigo := Valor;
              end;
              Parte := trim(ExtractWord(5, Cadena, [#09]));
              DatoActual.Titulo := Parte;

              Parte := trim(ExtractWord(6, Cadena, [#09]));
              DatoActual.FFecha := FechaToDateTime(Parte);

              Parte := trim(ExtractWord(7, Cadena, [#09]));
              DatoActual.Descripcion := Parte;
            end
            else
            begin
              if WordCount(Cadena, [#09]) = 8 then
              begin
                FElog.FCabecera := Cadena;
              end;
            end;
            I := I + 1;
          end;
        end;
      end;
      I := I + 1;
    end;
    FFichero := aFileName;
  finally
    FreeAndNil(lsFichero);
  end;
end;

procedure TElog.Assign(Source: TElog);
begin
  FClaveControlador := Source.ClaveControlador;
  FDate := Source.Date;
  FDriveModuleList.Assign(Source.FDriveModuleList);
  FElog.Assign(Source.Elog);
  FIdControlador := Source.IdControlador;
  FNombreControlador := Source.NombreControlador;
  FNombreSistema := Source.NombreSistema;
  FOpcionesControlador.Assign(Source.OpcionesControlador);
  FRobotWare := Source.RobotWare;
end;

constructor TElog.Create;
begin
  FElog := TElogList.Create(TElogItem);
  FOpcionesControlador := TStringList.Create;
  FDriveModuleList := TDriveModuleList.Create;
end;

destructor TElog.Destroy;
begin
  FreeAndNil(FElog);
  FreeAndNil(FDriveModuleList);
  FreeAndNil(FOpcionesControlador);
  inherited Destroy;
end;

end.
