unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  x, y, s: extended;
  i, N: integer;

begin
  Memo1.Lines.Clear;
  N := 10;
  s := pi/N;
  x := 0;
  for i:=1 to N do
  begin
    x := x + s;
    y := (sin(x-pi/2)+1)/2;
    Memo1.Lines.Add({FloatToStr(y)}IntToStr(trunc(y*256)));
  end;
end;

end.

