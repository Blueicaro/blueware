unit nombreimportareio;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls;

type

  { Tnombreimportareiofrm }

  Tnombreimportareiofrm = class(TForm)
    ButtonPanel1: TButtonPanel;
    cbNombre: TComboBox;
    Label1: TLabel;
    procedure cbNombreChange(Sender: TObject);
  private

  public

  end;

var
  nombreimportareiofrm: Tnombreimportareiofrm;

implementation

{$R *.lfm}

{ Tnombreimportareiofrm }

procedure Tnombreimportareiofrm.cbNombreChange(Sender: TObject);
begin
  ButtonPanel1.OKButton.Enabled:= cbNombre.Text <> '';
end;

end.

