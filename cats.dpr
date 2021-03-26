{Cats}
program cats;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

const
  n=2; {Cats count}
  Maine: string[10] = ('Maine Coon');

type
  TCat = record
    Porod: string[30];
    Vozr: byte;
    Klich: string[20];
    FIO: string[40];
  end;
  TTemp=array[1..n] of boolean;

var
  TempF,TempV: TTemp;
  Catss: array[1..n] of TCat;
  i: integer;
  mc: byte; {Maine Coon}
  Custom: string[30];

procedure ReadRec(var Cat: TCat);
  begin
    with Cat do
      begin
        writeln('Enter porody:');
        readln(Porod);
        writeln('Enter vozrast:');
        readln(Vozr);
        writeln('Enter klitchky:');
        readln(Klich);
        writeln('Enter FIO:');
        readln(FIO);
      end; {with Cat}
  end; {ReadRec}

procedure WriteRec(var Cat: TCat);
  begin
    with Cat do
      begin
        writeln('Poroda: ',Porod);
        writeln('Vozrast: ',Vozr);
        writeln('Klitchka: ',Klich);
        writeln('FIO: ',FIO);
      end; {with Cat}
    writeln;
  end; {WriteRec}
  
begin {main}
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  writeln('Enter custom porody:');
  readln(Custom);
  for i:= 1 to n do
    begin
      writeln('Enter record ¹',i);
      ReadRec(Catss[i]);
    end; {for i}

  mc:=0;
  for i:=1 to n do
    with Catss[i] do
      begin
        if (Pos(Maine,Porod)>0) and (Vozr<=5)
          then inc(mc);
        TempF[i]:=Pos(Custom,Porod)>0;
        TempV[i]:=Vozr>5;
      end; {with Cubes}

  writeln;
  writeln('---');
  writeln;
  writeln('Answer:');
  writeln(mc,' Maine Coons not over 5 years old');
  writeln;
  for i:=1 to n do
    begin
      if TempF[i]
        then
          begin
            writeln('FIO of custom porod owner: ',Catss[i].FIO);
            writeln;
          end; {if Temp}
      if TempV[i]
        then
          begin
            writeln('Cat ¹',i,' is over 5 years old:'); 
            WriteRec(Catss[i]);
          end; {if Temp}
    end; {for i}
  readln;
end.

 