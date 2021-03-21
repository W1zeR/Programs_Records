{Passengers}
program n2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

const
  n=3; {Passengers count}

type
  TTemp = array[1..n] of boolean;
  TPas = record
    FIO: string[40];
    RaceNum: integer;
    Weight: real;
    Count: integer;
    Exist: boolean;
  end;

var
  Temp: TTemp;
  Pas: array[1..n] of TPas;
  OKWeight: real;
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

procedure ReadRec(var P: TPas);
  var
    i: byte;
  begin
    with P do
      begin
        writeln('Enter FIO:');
        readln(FIO);
        writeln('Enter race number:');
        readln(RaceNum);
        writeln('Enter baggage weight:');
        readln(Weight);
        writeln('Enter the amount of baggage');
        readln(Count);
        writeln('Enter existance of hand luggage ("1" if "Yes", "0" if "No")');
        readln(i);
        if i=0
          then Exist:=false
          else Exist:=true;
      end; {with P}
  end; {ReadRec}

procedure WriteRec(var P: TPas);
  begin
    with P do
      begin
        writeln('FIO: ',FIO);
        writeln('Race number: ',RaceNum);
        writeln('Baggage weight: ',Weight:0:2);
        writeln('Amount of baggage: ',Count);
        writeln('Existance of hand luggage: ',Exist);
      end; {with P}
    writeln;
  end; {WriteRec}
  
begin {main}
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  writeln('Enter allowed weight:');
  ReadNum(OKWeight);
  for i:= 1 to n do
    begin
      writeln('Enter record ¹',i);
      ReadRec(Pas[i]);
    end; {for i}

  k:=0;
  for i:=1 to n do
    with Pas[i] do
      begin
        if Weight>OKWeight
          then inc(k);
        Temp[i]:=Exist;
      end; {with Pas}

  writeln;
  writeln('---');
  writeln;
  writeln('Answer:');
  writeln(k,' passengers exceeded the allowed weight');
  writeln;
  for i:=1 to n do
    if not Temp[i]
      then
        begin
          writeln('Passenger ¹',i,':');
          WriteRec(Pas[i]);
        end; {if Temp}
  readln;
end.

 