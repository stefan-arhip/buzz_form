unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LResources, MMSystem, Windows;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure BuzzForm(f: TForm);
var
  rS: TResourceStream;
  i, j, x, y: integer;
  dx, dy: integer;
begin
  // Project - Project Options... - Resources - Add...
  if Form1.CheckBox1.Checked then
  begin
    rS := TResourceStream.Create(HINSTANCE, 'Buzz', RT_RCDATA);
    try
      PlaySound(PChar(rS.Memory), 0, SND_MEMORY or SND_ASYNC);
    finally
      rS.Free;
    end;
  end
  else
    PlaySound('Buzz.wav', 0, SND_ASYNC);
  Randomize;
  dx := 10;
  dy := 10;
  x := f.Left;
  y := f.Top;
  for i := 1 to 10 do
    for j := 1 to 10 do
    begin
      f.Left := x + Round(dx - Random * dx);
      f.Top := y + round(dy - random * dy);
    end;
  f.Left := x;
  f.Top := y;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  BuzzForm(Form1);
end;

end.
