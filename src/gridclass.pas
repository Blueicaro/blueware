unit gridclass;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, TypInfo,
  fpjsonrtti,
  fpjson;

type

  { TGridClassItem }

  TGridClassItem = class(TCollectionItem)
  private
    FNombreColumna: string;
    FNombrePropiedad: string;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property NombreColumna: string read FNombreColumna write FNombreColumna;
    property NombrePropiedad: string read FNombrePropiedad write FNombrePropiedad;
  end;

type

  { TListaPropiedades }

  TListaPropiedades = class(TCollection)
  private
    function GetItem(Index: integer): TGridClassItem;
  public
    function Add: TGridClassItem;
    property Items[Index: integer]: TGridClassItem read GetItem; default;
  end;

type
  TGridClass = class(TPersistent)


  private
    FListaPropiedades: TListaPropiedades;
  protected
    procedure OnRestoreProperty(Sender: TObject; AObject: TObject;
      Info: PPropInfo; AValue: TJSONData; var Handled: boolean);
    procedure OnStreamProperty(Sender: TObject; AObject: TObject;
      Info: PPropInfo; var Res: TJSONData);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Load(FileName: TFileName);
    procedure Save(FileName: TFileName);
  published
    property ListaPropiedades: TListaPropiedades read FListaPropiedades;
  end;

implementation

uses StrUtils;

  { TGridClassItem }

procedure TGridClassItem.Assign(Source: TPersistent);
begin
  if Source is TGridClassItem then
  begin
    FNombreColumna := TGridClassItem(Source).FNombreColumna;
    FNombrePropiedad := TGridClassItem(Source).FNombrePropiedad;
  end
  else
  begin
    inherited;
  end;

end;

{ TListaPropiedades }

function TListaPropiedades.GetItem(Index: integer): TGridClassItem;
begin
  Result := inherited Items[Index] as TGridClassItem;
end;

function TListaPropiedades.Add: TGridClassItem;
begin
  Result := inherited Add as TGridClassItem;
end;

{ TGridClass }

procedure TGridClass.OnRestoreProperty(Sender: TObject; AObject: TObject;
  Info: PPropInfo; AValue: TJSONData; var Handled: boolean);
var
  I: integer;
  Cadena: TJSONStringType;
  Elemento: TGridClassItem;
begin
  Handled := False;
  if (Info^.PropType^.Name = 'TListaPropiedades') then
  begin
    for I := 0 to AValue.Count - 1 do
    begin
      Cadena := AValue.Items[I].AsString;
      Elemento := FListaPropiedades.Add;
      Elemento.FNombreColumna := ExtractDelimited(1, Cadena, [',']);
      Elemento.FNombrePropiedad := ExtractDelimited(2, Cadena, [',']);
    end;
    Handled := True;
  end;
end;

procedure TGridClass.OnStreamProperty(Sender: TObject; AObject: TObject;
  Info: PPropInfo; var Res: TJSONData);
var
  Cadena: string;
  Datos: TJSONArray;
  I: integer;
begin
  if Info^.PropType^.Name = 'TListaPropiedades' then
  begin
    Cadena := '';
    Datos := TJSONArray.Create();
    for I := 0 to FListaPropiedades.Count - 1 do
    begin
      Cadena := Format('%s,%s', [FListaPropiedades[I].FNombreColumna,
        FListaPropiedades[I].NombrePropiedad]);
      Datos.Add(Cadena);
    end;
    Res.Free;
    Res := Datos;
  end;
end;

constructor TGridClass.Create;
begin
  FListaPropiedades := TListaPropiedades.Create(TGridClassItem);
end;

destructor TGridClass.Destroy;
begin
  FreeAndNil(FListaPropiedades);
  inherited Destroy;
end;

procedure TGridClass.Load(FileName: TFileName);
var
  DeStreamer: TJSONDeStreamer;
  N: integer;
  stFile: TFileStream;
  Datos: string;
begin
  FListaPropiedades.Clear;
  DeStreamer := TJSONDeStreamer.Create(nil);

  stFile := TFileStream.Create(FileName, fmOpenRead);
  try
    n := stFile.Size;
    Datos := '';
    SetLength(Datos, n);
    stFile.Read(Datos[1], n);
    DeStreamer.OnRestoreProperty := @OnRestoreProperty;
    DeStreamer.JSONToObject(Datos, Self);
  finally
    if Assigned(stFile) then
    begin
      FreeAndNil(stFile);
    end;
    FreeAndNil(DeStreamer);
  end;
end;

procedure TGridClass.Save(FileName: TFileName);
var
  Streamer: TJSONStreamer;
  JsonString: TJSONStringType;
  datos: TStringStream;
  I: integer;
  jArray: TJSONArray;
  stFile: TFileStream;
begin
  Streamer := TJSONStreamer.Create(nil);
  try
    Streamer.OnStreamProperty := @OnStreamProperty;
    JsonString := Streamer.ObjectToJSONString(Self);
    try
      stFile := TFileStream.Create(FileName, fmCreate);
      stFile.Position := 0;
      stFile.Write(JsonString[1], Length(JsonString));
    finally
      FreeAndNil(stFile);
    end;
  finally

    FreeAndNil(Streamer);
  end;
end;

end.
