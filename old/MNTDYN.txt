


program MNTDYN;
{
*************************************************************
*************************************************************
*****  MNTDYN- программа численного решения задачи    *******
*****        по определению динамических усилий в     *******
*****        тяговом органе цепного конвейера при     *******
*****        движении  во время пуска.                *******
*************************************************************
*                                                           *
*     Программа решает систему линейных диффер. уравнений   *
*     второго порядка  методом Рунге-Кутта с автоматичес-   *
*     ким выбором шага по времени.                          *
*                                                           *
*************************************************************
}
{$M 2048, 0, 3000}
uses DOS, Crt, Forms, Sliders, Printer;

        label l0,prnt,prend;
type

        isd = array[1..13] of String[42];
	wyd = array[1..7 ] of String[42];
	ird = array[1..13] of String[ 7];
	wrd = array[1..7 ] of String[ 4];

  Person = record
    Firstname: string[30];
    Address: string[18];
    Time: string[22];
    Counter: array[1..13] of String[10];
    Slider: array[1..2] of Integer;
  end;

const

{     Исходные данные - массив cc[1..13]                    }
  lisd: isd = (  ' 1. Момент инерции ротора эл-двигателя   ',
		 ' 2.Передаточное число редуктора........  ',
		 ' 3.К П Д редуктора ....................  ',
		 ' 4.Диаметр делительн. окружн. звездочки  ',
		 ' 5.Погонная масса груза ...............  ',
		 ' 6.Погонная масса движ.частей конвейера  ',
		 ' 7.Номинальный момент на валу эл.двиг.   ',
		 ' 8.Площадь сечения цепи конвейера .....  ',
		 ' 9.Модуль упругости цепи ..............  ',
		 '10.Длина конвейера ....................  ',
		 '11.Скорость движения конвейера ........  ',
		 '12.Суммарное сопротивление движен. цепи  ',
	 '13.Шаг по времени динамического расчета  ');

 lird:ird=(' кг*м*м','       ','       ',' m     ',' кг/m  ',
	   ' кг/m  ',' Н*м   ',' m*m   ',' Mпа   ',' m     ',
	   ' m/c   ',' H     ',' c     ');

lwrd:wrd=( ' кг ',' кг ',' H  ',' m  ',' m/c',' c  ',' H  ');


{    Расчетные величины - массив cr[1..7]                   }

 lwyd: wyd =  ('  1.Ведущая масса ...................... ',
	       '  2.Ведомая масса ...................... ',
	       '  3.Сила тяги .......................... ',
               '  4.Растяжение цепи в конце 1-го этапа   ',
	       '  5.Скорость в конце первого этапа ..... ',
	       '  6.Время первого этапа пуска .......... ',
               '  7.Максимальное усилие в цепи ......... ' );

  Frank: Person = (
    Firstname: '  Яценко А.   ';
    Address: '   M-311 ';
    Time: '  22 янв 1996 г.';
    Counter: (' 0.029',' 238',' 0.85',' 0.5','172','30',
		 ' 17', ' 0.0051', ' 1.8e+5', '18.9',
                  ' 0.16', '10030', ' 0.2');
    Slider: (40 , 60));

var
  F: Form;
  P: Person;
	cc:array [1..13] of real;
        yy,ww,aa,ccc,dd,ee,ff:array [1..4] of real;
        cr : array [1..7] of real;
      fmax,fff,fdw,fiw,c,cv,ccv,ct,
      cct,bb,d,d1,d2,w,cw,y13,y24 : real;
  	code,j,kk,n,iii :integer;
        cch :char;
        fil : text;
        path,execfile:string;
{          Процедура вывода на экран начального окна   }
        procedure pr1;
        begin
  Color(BackColor);
  ClrScr;
  Color(ForeColor);
  GotoXY(1, 1); ClrEol;
  Write(' Turbo Pascal 5.5   ');
  Write('  Динамика передви');
  GotoXY(1, 25); ClrEol;
  Write(' F2-Счет,Продолж.счет      ');
  Write('  Home- Печать результатов         Esc-Quit');
        end;

{             Процедура вывода на экран исх.данных и
               возможность их изменения.                  }
        procedure pr2;
        begin

  F.Init(10, 3, 72, 23);
  F.Add(New(FStrPtr, Init(3, 2, ' Расчет выполняет ', 30)));
  F.Add(New(FStrPtr, Init(3, 4, ' Ст-т гр.  ', 18)));
  F.Add(New(FStrPtr, Init(32, 4,' Time ', 22)));
  for j:=1 to 13 do
                    begin
  F.Add(New(FStrPtr,
   Init(2, 5+j, lisd [j]+','+lird[j]+' ',10)));
                    end;
  F.Add(New(FSliderPtr,
   Init(5, 20, ' Slider One ', 0, 100, 4)));
  F.Add(New(FSliderPtr,
   Init(5, 21, ' Slider Two ', 0, 100, 4)));
  P := Frank;
  F.Put(P);
  F.Show(True);
  if F.Edit = CSave then F.Get(P);
  F.Done;
  NormVideo;
        end;
{             Процедура вывода на экран исх.данных    }

        procedure pr3;
        begin
            Color(BackColor);
  ClrScr;
  Color(ForeColor);
  WriteLn('Исходная информация :');
  WriteLn;
  with P do
  begin
    WriteLn('  Ф И О  : ', Firstname);
    WriteLn(' Ст-т гр.: ', Address);
    WriteLn('     Дата: ', Time);
		for j:= 1 to 13 do
			begin
	       	val(Counter[j],cc[j],code);
           WriteLn(lisd[j], cc[j]:8:5,lird[j])
			end;
          ct := Slider[1]*0.005;
         cct := Slider[2]*0.1;
    WriteLn('   Время разгона эл.двигателя .........  ',
    ct:1:5,' c');
    WriteLn('   Время счета ........................  ',
    cct:2:4,' c');
           end;
  end;
{       Процедура вывода  исх.данных на принтер.   }
          procedure pr4;
        begin
  WriteLn(Lst, '               Исходная информация :');
  WriteLn(Lst);
		for j:= 1 to 13 do
         WriteLn(Lst,'        ',lisd[j], cc[j]:8:5,lird[j]);
   WriteLn(Lst,'  14.Время разгона эл.двигателя .........  ',
    ct:1:5,' c');
   WriteLn(Lst,'  15.Время счета ........................  ',
    cct:2:4,' m/c');
  end;

{       Процедура вывода  расчетных данных на принтер.   }
         procedure pr5;
         begin
         WriteLn(Lst);
         WriteLn(Lst,'        ***** Расчетные величины -' ) ;
         WriteLn(Lst);
                WriteLn(Lst,'       ', lwyd[1],cr[1]:8:3,lwrd[1] );
                WriteLn(Lst,'       ', lwyd[2],cr[2]:8:3,lwrd[2] );
                WriteLn(Lst,'       ', lwyd[3],cr[3]:8:3,lwrd[3] );
                WriteLn(Lst,'       ', lwyd[4],cr[4]:8,lwrd[4] );
                WriteLn(Lst,'       ', lwyd[5],cr[5]:8,lwrd[5] );
                WriteLn(Lst,'       ', lwyd[6],cr[6]:8,lwrd[6] );
                WriteLn(Lst,'       ', lwyd[7],cr[7]:8:3,lwrd[7] );
         WriteLn(Lst);
         end;

{       Процедура счета производных.       }
         procedure rp(var x,f,w:real);
         label ll;
        begin
        f := cr[3];
        if x < ct then if ct > 0 then f := cr[3]*x/ct;
        if f < fiw then f := fiw;
        if yy[4] >0.9*cc[11] then  f := f*(cc[11]-yy[4])/bb;
        if f > 2*w then f := 2*w;
        if x > ct then if f < w then f := w;
        y24 := yy[2]-yy[4];
	ff[1] := yy[2];
	ff[2] := (f-c*yy[1]-d1*yy[2]-d*y24 )/cr[1];
        if n=2 then goto ll;
        y13 := yy[1]-yy[3];
        ff[2] := ff[2]+ (c*yy[3])/cr[1];
	ff[3] := yy[4];
	ff[4] := (c * y13-d2*yy[4]+d*y24-cw ) / cr[2];
  ll:	end;

{   Процедура решения системы лин. дифф. уравнений пер-
    вого порядка методом Рунге-Кутта.
    h-шаг по времени,x-текущее время,cct-конечное время
    счета,f-движущая сила,w-сила сопртивления,
    v1,u1-скорость и ускорение приведенной массы ротора
    двигателя,fmax-макс.усилие цепи,c-жесткость цепи.   }
    procedure systd4;
     label l1,l2,l3,l4,le;
     var e1,e2,e3,h ,x ,f,w,v1,u1 : real;
     var d :integer;
     Begin
     assign (fil,'c:\tp\p1.dat');
     Rewrite(fil);
        n:=2;x:=0;fmax:=0;bb :=cc[11]*0.1;
	e1:=0.00000001; h :=cc[13];kk:=0;
        f := 0.0; w := cc[12];cr[6]:=0.0;iii := 0;
        fff := 0.0;fiw := 0.0;
        WriteLn;

   WriteLn( '        *****   Динамика пуска конвейера  ');
	WriteLn;
{   Write( '      t         y1         y2         y3');}
{   WriteLn( '        y4          F ');}
	WriteLn;
 l1 : {          Writeln(fil,x,fff*c+d1*yy[2],f);}
 	e3 := 0; v1 := yy[2]; rp(x,f,w); d := 0;
                  FOR j := 1 TO n do
           begin
	aa[j]:= ff[j] * h; yy[j] := ww[j] + aa[j] / 3
        end;
	x := x + h / 3; rp(x,f,w);FOR j := 1 TO n do
	yy[j] := ww[j] + (aa[j] + ff[j] * h) / 6;
	rp(x,f,w); FOR j := 1 TO n do
            begin
         ccc[j] := ff[j] * h ;
	yy[j] := ww[j] + aa[j] / 8 +0.375 * ccc[j]
        end;
	x := x + h / 6; rp(x,f,w); FOR j := 1 TO n do
             begin
        dd[j] := ff[j] * h;
        yy[j] := ww[j] + aa[j] / 2 - 1.5 * ccc[j] + 2 * dd[j]
	end; x := x + h / 2; rp(x,f,w);
	FOR j := 1 TO n  do
              begin
         ee[j] := ff[j] * h;
	yy[j] := ww[j] + (aa[j] + 4 * dd[j] + ee[j]) / 6;
 e2 := ABS(-2 * aa[j] + 9 * ccc[j] - 8 * dd[j] + ee[j]) / 30;
			IF e2 <= e1 THEN goto l2;
                        	e3 := 1; GOTO l3;
  l2: 		IF e2 < e1 / 20 THEN d := d + 1;
  l3:	      end;
               IF e3 = 0 THEN goto l4;
	x := x - h; FOR j := 1 TO n  do
         yy[j] := ww[j];
	h := h / 2; GOTO l1;
  l4:		IF d = n THEN h := h + h ;
{	Write ('    ', x:2:5 ) ;}
        fff:=yy[1]-yy[3];



        if fff>fmax then fmax:=fff;
        if kk=0 then
        if fff*c >= cc[12] then
          begin
        kk:=1;n:=4;
        cr[6]:=x ; cr[4] := fff;cr[5] := yy[2];
        fmax:=0.0; WriteLn;
        WriteLn (' ******* Второй этап расчета');
        {Write ('    ', x:2:5 );}
          end;
        u1 := (yy[2]-v1)/h;
        fiw := (cr[1]*u1+c*fff+ d1*yy[2]+d*y24);
	FOR j := 1 TO n  do
              begin
{        Write ('   ', yy[j]:2:5,' ');}
	ww[j] := yy[j]
              end;
        if n = 4 then {WriteLn ('   ',f);}
      if n = 2 then {WriteLn ('                         ',f);}
        if x < cct then goto l1;
  le:   close (fil);
        cr[7]:= fmax*c
        end;
      { ****************************************
       Основная программа }
begin

   l0:  pr1;
        pr2;
        pr3;
       d :=cc[12]/cc[11]; d1 := 0.1*cc[12]/cc[11] ; d2 := d1;
         cr[1] := 4.8 * cc[1] * Sqr(cc[2]/ cc[4]) ;
          cr[2] := (cc[5] + 2 * cc[6]) * cc[10]  ;
            c := cc[9] * cc[8]*1000000.0 / (2 * cc[10])  ;
             cr[3] := 3.2 * cc[7] * cc[2] * cc[3] / cc[4];
             w := cc[12];
             fdw := cr[3]/1.6;
if fdw > w*2 then WriteLn (' **** Двигатель слишком мощный');
if fdw < w then WriteLn ( '  ***** Мала мощность двигателя');
             cch := Readchar;
             if fdw < w then goto l0;
if fdw > 1.3*w then cr[3] := (1.3* w + (fdw-1.3*w)*0.5)*1.6;
             cw := w-cc[11]*(d1+d2);
        for j:=1 to 4 do
           begin
                yy[j]:=0;
                ww[j]:=0;
           end;
                systd4;
                WriteLn( lwyd[1],cr[1]:8:3,lwrd[1] );
                WriteLn( lwyd[2],cr[2]:8:3,lwrd[2] );
                WriteLn( lwyd[3],cr[3]:8:3,lwrd[3] );
                WriteLn( lwyd[4],cr[4]:8,lwrd[4] );
                WriteLn( lwyd[5],cr[5]:8,lwrd[5] );
                WriteLn( lwyd[6],cr[6]:8,lwrd[6] );
                WriteLn( lwyd[7],cr[7]:8:3,lwrd[7] );
                NormVideo;
                Color (ForeColor);
      WriteLn;
      Write (' ****** Для печати результатов расчета ');
      WriteLn ('включите принтер и');
      Write ('   нажмите клавишу - Home,');
      WriteLn ('для просмотра графиков -Enter,');
      Write ('для выхода из программы ');
      WriteLn('нажмите клавишу Esc');
          cch := ReadChar;if cch = CEsc then goto prend;
          if cch = CHome then goto prnt;

 path:='c:\gw\gwbasic.exe';
 execfile:='stgraf2.lst';

 SwapVectors;  {    Вызов пп. на бейсике для вывода графиков.  }
Exec (path,execfile);
SwapVectors;
      WriteLn;
      WriteLn (' ****** Для печати результатов',
      ' расчета включите принтер и');
      WriteLn ('   нажмите клавишу - Home,',
      'иначе нажмите - Esc');

          cch := ReadChar;if cch = CEsc then goto prend;
          if cch = CHome then goto prnt;
          goto prend;
 prnt:
WriteLn (Lst,'                   C  А  П  Р ');
WriteLn (Lst,'           ','каф. Деталей машин и под"емно-',
'транспорт- ');
WriteLn (Lst,'                   ','ных машин');
WriteLn (Lst,'           ','Запорожский государственный технический',
' университет');
     WriteLn (Lst );
WriteLn (Lst,'              ','Исследование динамики пуска');
WriteLn (Lst,'                 	  ','цепного конвейера.');
     WriteLn (Lst );
Write (Lst,'          Расчет выполнил студент ');

           Write(Lst,P.Firstname);
            Write(Lst,' ,гр.',P.Address,'.');
             WriteLn (Lst );
             pr4;
             pr5;

             WriteLn( '   ****** end of the probl.');
prend:    end.
