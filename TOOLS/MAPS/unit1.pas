unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function IntToOct(Value: Longint; digits: Integer): string;
var
  rest: Longint;
  oct: string;
  i: Integer;
begin
  oct := '';
  while Value <> 0 do
  begin
    rest  := Value mod 8;
    Value := Value div 8;
    oct := IntToStr(rest) + oct;
  end;
  for i := Length(oct) + 1 to digits do
    oct := '0' + oct;
  Result := oct;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  fs: TFileStream;
  i, j: Integer;
  a: Array[1..8] Of Byte;
  s: String;
begin
  if OpenDialog1.Execute then
  begin
    fs := TFileStream.Create(OpenDialog1.FileName, fmOpenRead);
    Memo1.Lines.Clear;
    j := 1;
    for i := 1 to fs.Size do
    begin
      a[j] := fs.ReadByte;
      inc(j);
      if j = 9 then
      begin
        s := #9+'.BYTE ';
        for j := 1 to 8 do
        begin
          s := s + IntToOct(a[j],3);
          if j < 8 then s := s + ',';
        end;
        Memo1.Lines.Add(s);
        j := 1;
      end;
    end;
    if j < 9 then
    begin
      s := #9+'.BYTE ';
      for i := 1 to j-1 do
      begin
        s := s + IntToOct(a[i],3);
        if i < j-1 then s := s + ',';
      end;
      Memo1.Lines.Add(s);
    end;
    fs.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  a: Array[0..256-1] of Byte;
  b1, b2: Byte;
  s: String;
  i, j: Integer;
  fs: TFileStream;
begin
  if Memo1.Lines.Count <> 16 then exit;
  for i := 0 to 15 do
  begin
    s := Memo1.Lines[i];
    if Length(s) <> 32 then exit;
    for j := 0 to 15 do
    begin
      if s[j * 2 + 1] = '.' then
      begin
        b1 := 0;
        b2 := 0;
      end else
      begin
        b1 := Ord(s[j * 2 + 1]) - Ord('@');
        b2 := Ord(s[j * 2 + 2]) - Ord('1');
      end;
      b1 := b1 shl 4;
      b2 := b2 shl 1;
      a[j + i * 16] := b1 or b2;
    end;
  end;
  Memo1.Lines.Clear;
  for i := 0 to 15 do
  begin
    s := #9 + '.BYTE ';
    for j := 0 to 14 do
      s := s + IntToOct(a[j + i * 16], 3) + ',';
    s := s + IntToOct(a[15 + i * 16], 3);
    Memo1.Lines.Add(s);
  end;
  if SaveDialog1.Execute then
  begin
    fs := TFileStream.Create(SaveDialog1.FileName, fmCreate);
    for i := 0 to 15 do
    begin
      for j := 0 to 15 do
      begin
        fs.WriteByte(a[j + i * 16]);
      end;
    end;
    fs.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

