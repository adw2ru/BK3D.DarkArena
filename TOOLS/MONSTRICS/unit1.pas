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
    Memo2: TMemo;
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
  sl: TStringList;
  i, j: Integer;
  s: String;
  f: Boolean;
  c: Char;
  x: Word;
begin
  Memo2.Lines.Clear;
  sl := TStringList.Create;
  f := True;
  for i := 0 to Memo1.Lines.Count-1 do
  begin
    s := Memo1.Lines.Strings[i];
    if Length(s) <> 16 then f := False;
    if f then
      for j := 1 to Length(s) do
        if not (s[j] in ['1','0','.']) then
        begin
          f := False;
          break;
        end;
    sl.Add(s);
  end;
  if sl.Count <> 16 then f := False;
  if not f then
  begin
    Memo2.Lines.Add('NOK');
  end else
  begin
    for i := 0 to 15 do
    begin
      x := 0;
      for j := 0 to 15 do
      begin
        c := sl.Strings[15-j][i+1];
        x := x shl 1;
        if c = '1' then x := x or 1;
      end;
      Memo2.Lines.Add(IntToStr(SmallInt(x)));
    end;
  end;
  sl.Free;
end;

end.

