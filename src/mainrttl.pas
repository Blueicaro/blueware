unit mainrttl;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TPrueba }

  TPrueba = class(TCollectionItem)
  private
    FApellido: string;
    Fnombre: string;
    FVerdad: boolean;
  published
    property nombre: string read Fnombre write Fnombre;
    property Apellido: string read FApellido write FApellido;
    property Verdad: boolean read FVerdad write FVerdad;
  end;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;


implementation

uses StrUtils, iosystem, parmacomun, TypInfo;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  E: TCrossConexionList;
  Lista, Valores, Datos: TStringList;
  I, X: integer;
  Cadena, stemp: string;
  //Lista, Datos, Valores: TStringList;
  //I, X: Integer;
  //Cadena, stemp: String;
begin
  Lista := TStringList.Create;
  Valores := TStringList.Create;
  Valores.NameValueSeparator := #32;
  Lista.AddStrings(Memo1.Lines);
  Datos := SeccionACadenas('EIO_CROSS:', Lista);
  Memo1.Lines.Clear;
  Memo1.Lines.AddStrings(Datos);
  for I := 0 to Datos.Count - 1 do
  begin
    Cadena := trim(Datos[I]);
    cadena := StringReplace(cadena, '"', '', [rfReplaceAll]);
    for X := 1 to WordCount(Cadena, ['-']) do
    begin
      stemp := trim(ExtractWord(X, Cadena, ['-']));
      if WordCount(sTemp, [#32]) < 2 then
      begin
        stemp := stemp + #32;
      end
      else
      begin

      end;
      Valores.Add(stemp);
    end;

  end;
  for I := 0 to Valores.Count - 1 do
  begin
    Memo1.Lines.Add(Valores.Names[I] + '=' + Valores.ValueFromIndex[I]);
    Memo1.Lines.Add('------------------------------------');
  end;
  FreeAndNil(Valores);
  FreeAndNil(Lista);
  FreeAndNil(Datos);

  //  E := TCrossConexionList.Create;
  //  E.LoadFromStrings(Lista);
  //  Memo1.Lines.Clear;
  //  Memo1.Lines.Add(E[0].Name);
  //  FreeAndNil(Lista);
  //  FreeAndNil(E);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  E: TCrossConexionList;
  Lista, L: TStringList;
  I: integer;
begin
  if OpenDialog1.Execute then
  begin
    Lista := TStringList.Create;
    Lista.LoadFromFile(OpenDialog1.FileName);
    E := TCrossConexionList.Create;
    E.LoadFromStrings(Lista);
    Memo1.Lines.Clear;
    L := E.Text;
    Memo1.Lines.AddStrings(L);
    FreeAndNil(L

    );
    FreeAndNil(Lista);
    FreeAndNil(E);
  end;
end;

procedure Probando(var aObjeto: TCollectionItem);
var
  info: PPropInfo;
  Cadena: string;
  Lista: PPropList;
  Size, I, J: integer;
  PI: TPropInfo;
  PT: PTypeData;
  PP: PPropList;
  f: TTypeKind;
begin

  info := GetPropInfo(aObjeto, 'nombre');
  SetPropValue(aObjeto, info, 'Jorge');


  PT := GetTypeData(aObjeto.ClassInfo);
  Size := PT^.PropCount;
  GetMem(PP, PT^.PropCount * SizeOf(Pointer));
  J := GetPropList((aObjeto.ClassInfo), PP);
  for I := 0 to j - 1 do
  begin
    with  PP^[I]^ do
      Cadena := Name;
    f := PropType(aObjeto, Cadena);
    case f of
      tkAString:
        Cadena := 'Cadena';

      tkBool:
        Cadena := 'booleano';
    end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);

var
  PP: TPrueba;
  Cadena: string;
begin
  PP := TPrueba.Create(nil);

  Probando(TCollectionItem(pp));
  Cadena := PP.nombre;
  FreeAndNil(PP);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  P: Pointer;
begin
  Getmem(P, 1024);
  Freemem(P);
end;

end.
