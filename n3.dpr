{Cubes}
program n3;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

const
  n=3; {Cubes count}

type
  TTemp = array[1..n] of boolean;
  TColor = (Red, Blue, Green, White);
  TMater = (Metal, Wood, Plastic);
  TCube = record
    Color: TColor;
    Mater: TMater;
    Lengt: real;
  end;

var
  Temp: TTemp;
  Cubes: array[1..n] of TCube;
  V: real;
  i,k: integer;

procedure ReadNum(var Num: real);
  begin
    readln(Num);
    while Num<=0 do
      begin
        writeln('Error. Enter number>=0');
        readln(Num);
      end; {while Num}
  end; {ReadV}

procedure ReadRec(var Cube: TCube);
  var
    i: integer;
    L: real;
  begin
    writeln('Enter color');
    writeln('1-Red');
    writeln('2-Blue');
    writeln('3-Green');
    writeln('4-White');
    readln(i);
    with Cube do
      case i of
        1: Color:=Red;
        2: Color:=Blue;
        3: Color:=Green;
        4: Color:=White;
      end; {case i}
    writeln('Enter material');
    writeln('1-Metal');
    writeln('2-Wood');
    writeln('3-Plastic');
    readln(i);
    with Cube do
      case i of
        1: Mater:=Metal;
        2: Mater:=Wood;
        3: Mater:=Plastic;
      end; {case i}
    writeln('Enter length');
    ReadNum(L);
    with Cube do
      Lengt:=L;
  end; {ReadRec}

procedure WriteRec(var Cube: TCube);
  begin
    with Cube do
      begin
        case Color of
          Red: writeln('Color: Red');
          Blue: writeln('Color: Blue');
          Green: writeln('Color: Green');
          White: writeln('Color: White');
        end; {case Color}
        case Mater of
          Metal: writeln('Material: Metal');
          Wood: writeln('Material: Wood');
          Plastic: writeln('Material: Plastic');
        end; {case Mater}
        writeln('Lenght: ',Lengt:0:2);
      end; {with Cube}
    writeln;
  end; {WriteRec}
  
begin {main}
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  writeln('Enter volume V:');
  ReadNum(V);
  for i:= 1 to n do
    begin
      writeln('Enter record ¹',i);
      ReadRec(Cubes[i]);
    end; {for i}

  k:=0;
  for i:=1 to n do
    with Cubes[i] do
      begin
        if (Color=Blue) and (Mater=Metal)
          then inc(k);
        Temp[i]:=sqr(Lengt)*Lengt<=V;
      end; {with Cubes}

  writeln;
  writeln('---');
  writeln;
  writeln('Answer:');
  writeln(k,' metal cubes are blue');
  writeln;
  for i:=1 to n do
    if Temp[i]
      then
        begin
          writeln('Cube ¹',i,':');
          WriteRec(Cubes[i]);
        end; {if Temp}
  readln;
end.

 
