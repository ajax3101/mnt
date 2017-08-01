unit enterilka_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit,RxRichEd;

type
  Tenterilka = class(TForm)
    fio_edit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    a13: TLabel;
    c13: TEdit;
    c12: TEdit;
    a12: TLabel;
    a11: TLabel;
    c11: TEdit;
    c10: TEdit;
    a10: TLabel;
    a9: TLabel;
    c9: TEdit;
    c8: TEdit;
    a8: TLabel;
    a7: TLabel;
    c7: TEdit;
    c6: TEdit;
    a6: TLabel;
    a5: TLabel;
    c5: TEdit;
    c4: TEdit;
    a4: TLabel;
    c3: TEdit;
    c2: TEdit;
    a1: TLabel;
    cc1: TLabel;
    cc2: TLabel;
    cc3: TLabel;
    cc4: TLabel;
    cc5: TLabel;
    cc6: TLabel;
    cc7: TLabel;
    cc8: TLabel;
    cc9: TLabel;
    cc10: TLabel;
    cc11: TLabel;
    cc12: TLabel;
    cc13: TLabel;
    c1: TEdit;
    GroupBox2: TGroupBox;
    r1: TEdit;
    r2: TEdit;
    r3: TEdit;
    r4: TEdit;
    r5: TEdit;
    r6: TEdit;
    r7: TEdit;
    DateEdit1: TDateEdit;
    Button1: TButton;
    rr1: TLabel;
    rr2: TLabel;
    rr3: TLabel;
    rr4: TLabel;
    rr5: TLabel;
    rr6: TLabel;
    rr7: TLabel;
    aa7: TLabel;
    aa6: TLabel;
    aa5: TLabel;
    aa4: TLabel;
    aa3: TLabel;
    aa2: TLabel;
    aa1: TLabel;
    Label42: TLabel;
    s1: TEdit;
    s2: TEdit;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
        cc:array [1..13] of real;
        cr : array [1..7] of real;
        code,kk,n,iii :integer;
        fmax,fff,fdw,fiw,c,cv,ccv,ct,cct,bb,d,d1,d2,w,cw,y13,y24 :real;
        yy,ww,aa,ccc,dd,ee,ff:array [1..4] of real;
        procedure rp(var x,f,w:real);
        procedure systd4;
    { Public declarations }
  end;

var
  enterilka: Tenterilka;

implementation

uses rez, graphik;

{$R *.DFM}

procedure Tenterilka.rp(var x,f,w:real);
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
  ll:
end;
procedure Tenterilka.systd4;
label l1,l2,l3,l4,le;
var e1,e2,e3,h ,x ,f,w,v1,u1 : real;
d,j :integer;
//a:string;
//aaa:tform1;
aaa:Tgraphik_;
Begin
//  Application.CreateForm(TForm1, aaa);
//     assign (fil,'c:\tp\p1.dat');
//     Rewrite(fil);
     Application.CreateForm(Tgraphik_,aaa);
     n:=2;x:=0;fmax:=0;bb :=cc[11]*0.1;
     e1:=0.00000001; h :=cc[13];kk:=0;
     f := 0.0; w := cc[12];cr[6]:=0.0;iii := 0;
     fff := 0.0;fiw := 0.0;
//     WriteLn;
//     aaa.RichEdit1.Lines.Add('');
//     WriteLn( '        *****   �������� ����� ���������  ');
//     aaa.RichEdit1.Lines.Add('        *****   �������� ����� ���������  ');
//     WriteLn;
//     aaa.RichEdit1.Lines.Add('');
{ Write( '      t         y1         y2         y3');}
{   WriteLn( '        y4          F ');}
//     aaa.RichEdit1.Lines.Add('      t         y1         y2         y3        y4          F ');
//     WriteLn;
//     aaa.RichEdit1.Lines.Add('');
 l1 : {          Writeln(fil,x,fff*c+d1*yy[2],f);}
//     aaa.RichEdit1.Lines.Add('          '+floattostr(fil)+'          '+floattostr(x)+'          '+floattostr(fff*c+d1*yy[2])+'          '+floattostr(f));
     aaa.Series1.AddXy(x,fff);
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
  l2:           IF e2 < e1 / 20 THEN d := d + 1;
  l3:         end;
               IF e3 = 0 THEN goto l4;
        x := x - h; FOR j := 1 TO n  do
         yy[j] := ww[j];
        h := h / 2; GOTO l1;
  l4:           IF d = n THEN h := h + h ;
//        a:='    '+ floattostr(x);
{       Write ('    ', x:2:5 ) ;}
        fff:=yy[1]-yy[3];

        if fff>fmax then fmax:=fff;
        if kk=0 then
        if fff*c >= cc[12] then
          begin
        kk:=1;n:=4;
        cr[6]:=x ; cr[4] := fff;cr[5] := yy[2];
        fmax:=0.0;// WriteLn;
//        WriteLn (' ******* ������ ���� �������');
//     aaa.RichEdit1.Lines.Add(' ******* ������ ���� �������');
        {Write ('    ', x:2:5 );}

//        aaa.Series1.AddXY(0,0);
        aaa.Series1.AddXy(x,fff,'������ ����',clBlue);
//        aaa.Series1.AddXy(7,-3);

          end;
        u1 := (yy[2]-v1)/h;
        fiw := (cr[1]*u1+c*fff+ d1*yy[2]+d*y24);
        FOR j := 1 TO n  do
              begin
{        Write ('   ', yy[j]:2:5,' ');}
        ww[j] := yy[j]
              end;
//        if n = 4 then {WriteLn ('   ',f);}
//      if n = 2 then {WriteLn ('                         ',f);}
        if x < cct then goto l1;
  le: //  close (fil);
        cr[7]:= fmax*c;

        aaa.Series2.AddXy(cr[6],aaa.Series1.yValues.MinValue);
        aaa.Series2.AddXy(cr[6],aaa.Series1.yValues.MaxValue);
        aaa.Caption:='������ �������� '+fio_edit.Text
        end;

procedure Tenterilka.Button1Click(Sender: TObject);
var j:integer;
a:tform1;
begin
     Caption:='�������� ������ �������� '+fio_edit.Text;
     try
     cc[1]:=strtofloat(c1.text);
     cc[2]:=strtofloat(c2.text);
     cc[3]:=strtofloat(c3.text);
     cc[4]:=strtofloat(c4.text);
     cc[5]:=strtofloat(c5.text);
     cc[6]:=strtofloat(c6.text);
     cc[7]:=strtofloat(c7.text);
     cc[8]:=strtofloat(c8.text);
     cc[9]:=strtofloat(c9.text);
     cc[10]:=strtofloat(c10.text);
     cc[11]:=strtofloat(c11.text);
     cc[12]:=strtofloat(c12.text);
     cc[13]:=strtofloat(c13.text);
     ct:=strtofloat(s1.text);
     cct:=strtofloat(s2.text);
     except
        showmessage('������� �������� ������!!');
        exit;
     end;
       d :=cc[12]/cc[11]; d1 := 0.1*cc[12]/cc[11] ; d2 := d1;
         cr[1] := 4.8 * cc[1] * Sqr(cc[2]/ cc[4]) ;
          cr[2] := (cc[5] + 2 * cc[6]) * cc[10]  ;
            c := cc[9] * cc[8]*1000000.0 / (2 * cc[10])  ;
             cr[3] := 3.2 * cc[7] * cc[2] * cc[3] / cc[4];
             w := cc[12];
             fdw := cr[3]/1.6;
if fdw > w*2 then showmessage (' **** ��������� ������� ������');
if fdw < w then
begin
showmessage ( '  ***** ���� �������� ���������');
exit;
end;
if fdw > 1.3*w then cr[3] := (1.3* w + (fdw-1.3*w)*0.5)*1.6;
             cw := w-cc[11]*(d1+d2);
        for j:=1 to 4 do
           begin
                yy[j]:=0;
                ww[j]:=0;
           end;
           systd4;
r1.text:=floattostr(cr[1]);
r2.text:=floattostr(cr[2]);
r3.text:=floattostr(cr[3]);
r4.text:=floattostr(cr[4]);
r5.text:=floattostr(cr[5]);
r6.text:=floattostr(cr[6]);
r7.text:=floattostr(cr[7]);
application.createform(tform1,a);
//a.RichEdit1.Paragraph.settab;
a.caption:='������ �������� '+fio_edit.Text;

//  WriteLn(Lst, '               �������� ���������� :');
a.RichEdit1.Paragraph.Alignment:=paCenter;
a.RichEdit1.Lines.Add('����������� ��������������� ����������� �����������');
a.RichEdit1.Lines.Add('������� "�� � ���"');
a.RichEdit1.Lines.Add('');
a.RichEdit1.Lines.Add('�������� ����� ������� ���������');
a.RichEdit1.Paragraph.Alignment:=paJustify;
a.RichEdit1.Lines.Add('');
a.RichEdit1.Lines.Add(chr(9)+'������ �������� �������(��)    '+fio_edit.Text);
a.RichEdit1.Lines.Add(chr(9)+'������ '+ Edit2.text);
a.RichEdit1.Lines.Add(chr(9)+'����  '+DateEdit1.text);
a.RichEdit1.Lines.Add('');
a.RichEdit1.Paragraph.TabCount:=3;
a.RichEdit1.Paragraph.tab[0]:=40;
a.RichEdit1.Paragraph.tab[1]:=320;
a.RichEdit1.Paragraph.tab[2]:=380;
a.RichEdit1.Lines.Add(chr(9)+'�������� ���������� :');

//  WriteLn(Lst);
a.RichEdit1.Lines.Add('');
//                for j:= 1 to 13 do
//         WriteLn(Lst,'        ',lisd[j], cc[j]:8:5,lird[j]);
a.RichEdit1.Lines.Add(chr(9)+cc1.caption+chr(9)+c1.text+chr(9)+a1.caption);
a.RichEdit1.Lines.Add(chr(9)+cc2.caption+chr(9)+c2.text);
a.RichEdit1.Lines.Add(chr(9)+cc3.caption+chr(9)+c3.text);
a.RichEdit1.Lines.Add(chr(9)+cc4.caption+chr(9)+c4.text+chr(9)+a4.caption);
a.RichEdit1.Lines.Add(chr(9)+cc5.caption+chr(9)+c5.text+chr(9)+a5.caption);
a.RichEdit1.Lines.Add(chr(9)+cc6.caption+chr(9)+c6.text+chr(9)+a6.caption);
a.RichEdit1.Lines.Add(chr(9)+cc7.caption+chr(9)+c7.text+chr(9)+a7.caption);
a.RichEdit1.Lines.Add(chr(9)+cc8.caption+chr(9)+c8.text+chr(9)+a8.caption);
a.RichEdit1.Lines.Add(chr(9)+cc9.caption+chr(9)+c9.text+chr(9)+a9.caption);
a.RichEdit1.Lines.Add(chr(9)+cc10.caption+chr(9)+c10.text+chr(9)+a10.caption);
a.RichEdit1.Lines.Add(chr(9)+cc11.caption+chr(9)+c11.text+chr(9)+a11.caption);
a.RichEdit1.Lines.Add(chr(9)+cc12.caption+chr(9)+c12.text+chr(9)+a12.caption);
a.RichEdit1.Lines.Add(chr(9)+cc13.caption+chr(9)+c13.text+chr(9)+a13.caption);
//   WriteLn(Lst,'  14.����� ������� ��.��������� .........  ',
a.RichEdit1.Lines.Add(chr(9)+'14.����� ������� ��.���������'+chr(9)+floattostr(ct)+chr(9)+Label44.Caption);
//    ct:1:5,' c');
//   WriteLn(Lst,'  15.����� ����� ........................  ',
a.RichEdit1.Lines.Add(chr(9)+'15.����� �����'+chr(9)+floattostr(cct)+chr(9)+Label45.Caption);
//    cct:2:4,' m/c');
{       ��������� ������  ��������� ������ �� �������.   }
//         WriteLn(Lst);
a.RichEdit1.Lines.Add('');
//         WriteLn(Lst,'        ***** ��������� �������� -' ) ;
a.RichEdit1.Lines.Add(chr(9)+'��������� ��������');
//         WriteLn(Lst);
a.RichEdit1.Lines.Add('');
//                WriteLn(Lst,'       ', lwyd[1],cr[1]:8:3,lwrd[1] );
//                WriteLn(Lst,'       ', lwyd[2],cr[2]:8:3,lwrd[2] );
//                WriteLn(Lst,'       ', lwyd[3],cr[3]:8:3,lwrd[3] );
//                WriteLn(Lst,'       ', lwyd[4],cr[4]:8,lwrd[4] );
//                WriteLn(Lst,'       ', lwyd[5],cr[5]:8,lwrd[5] );
//                WriteLn(Lst,'       ', lwyd[6],cr[6]:8,lwrd[6] );
//                WriteLn(Lst,'       ', lwyd[7],cr[7]:8:3,lwrd[7] );
//         WriteLn(Lst);
a.RichEdit1.Lines.Add(chr(9)+rr1.caption+chr(9)+copy(r1.text,1,8)+chr(9)+aa1.caption);
a.RichEdit1.Lines.Add(chr(9)+rr2.caption+chr(9)+copy(r2.text,1,8)+chr(9)+aa2.caption);
a.RichEdit1.Lines.Add(chr(9)+rr3.caption+chr(9)+copy(r3.text,1,8)+chr(9)+aa3.caption);
a.RichEdit1.Lines.Add(chr(9)+rr4.caption+chr(9)+copy(r4.text,1,8)+chr(9)+aa4.caption);
a.RichEdit1.Lines.Add(chr(9)+rr5.caption+chr(9)+copy(r5.text,1,8)+chr(9)+aa5.caption);
a.RichEdit1.Lines.Add(chr(9)+rr6.caption+chr(9)+copy(r6.text,1,8)+chr(9)+aa6.caption);
a.RichEdit1.Lines.Add(chr(9)+rr7.caption+chr(9)+copy(r7.text,1,8)+chr(9)+aa7.caption);
a.RichEdit1.Lines.Add('');
a.RichEdit1.Lines.Add('������ ��������');
end;

procedure Tenterilka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     action:=cafree;
end;

procedure Tenterilka.Button2Click(Sender: TObject);
begin
close;
end;

end.
