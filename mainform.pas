unit mainform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, RXDBCtrl, ExtCtrls,
  RXClock, shellapi, rxverinf;

type
  Tmain_form = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    N1: TMenuItem;
    _windows_: TMenuItem;
    test: TMenuItem;
    a4: TMenuItem;
    N2: TMenuItem;
    a3: TMenuItem;
    a2: TMenuItem;
    a1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ssss1: TMenuItem;
    prnsetup1: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    FontDialog1: TFontDialog;
    fontsetup1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure _windows_Click(Sender: TObject);
    procedure testClick(Sender: TObject);
    procedure a3Click(Sender: TObject);
    procedure a4Click(Sender: TObject);
    procedure a2Click(Sender: TObject);
    procedure a1Click(Sender: TObject);
    procedure ssss1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure prnsetup1Click(Sender: TObject);
    procedure fontsetup1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main_form: Tmain_form;

implementation

uses enterilka_, graphik, rez, polzovat;

{$R *.DFM}


procedure Tmain_form._windows_Click(Sender: TObject);
var
a:boolean;
my_menu_item:tmenuitem;
j:integer;
label 1;
begin
1:   a:=false;
     for j := 0 to _windows_.Count-1 do
        if _windows_.Items[j].tag=0 then
        begin
         _windows_.Items[j].free;
         a:=true;
         break;
        end;
     if a then goto 1;
     a:=false;
     for j:= 0 to application.ComponentCount -1 do
      if application.Components[j] is tform then
         if tform(application.Components[j]).Formstyle=fsmdichild then
     begin
          a:=true;
          my_menu_item:=tmenuitem.Create(self);
          my_menu_item.Name:='_'+tform(application.Components[j]).name;
          my_menu_item.caption:=tform(application.Components[j]).caption;
          my_menu_item.OnClick:=testClick;
          _windows_.Add(my_menu_item);
     end;
     a1.Enabled:=a;
     a2.Enabled:=a;
     a3.Enabled:=a;
     a4.Enabled:=a;
end;

procedure Tmain_form.testClick(Sender: TObject);
var i: integer;
a:string;
begin
     a:=copy(tmenuitem(sender).name,2,length(tmenuitem(sender).name));
     for i:=0 to MDIChildCount -1 do
          if a=MDIChildren[i].name then
               MDIChildren[i].show;
end;

procedure Tmain_form.a3Click(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure Tmain_form.a4Click(Sender: TObject);
begin
     Cascade;
end;

procedure Tmain_form.a2Click(Sender: TObject);
var i: integer;
begin
     for I := MDIChildCount-1 downto 0 do
     begin
         sendmessage(MDIChildren[I].Handle,WM_SYSCOMMAND,sc_minimize,0);
         Application.ProcessMessages;
     end;
//         MDIChildren[I].windowstate:=wsMinimized;
     ArrangeIcons;
end;

procedure Tmain_form.a1Click(Sender: TObject);
var i: integer;
begin
//     showmessage(inttostr(MDIChildCount));
     for I := MDIChildCount-1 downto 0 do
     begin
         sendmessage(MDIChildren[I].Handle,WM_SYSCOMMAND,sc_restore,0);
         Application.ProcessMessages;
     end;
//         MDIChildren[i].WindowState:=wsnormal;
end;

procedure Tmain_form.ssss1Click(Sender: TObject);
var a1:Tenterilka;
begin
  Application.CreateForm(Tenterilka, a1);
end;

procedure Tmain_form.N7Click(Sender: TObject);
begin
     if ActiveMDIChild is  Tgraphik_ then
     begin
//          Tgraphik_(ActiveMDIChild).Chart1.;
          Tgraphik_(ActiveMDIChild).Chart1.PrintMargins.Left:=3;
          Tgraphik_(ActiveMDIChild).Chart1.PrintMargins.Top:=3;
          Tgraphik_(ActiveMDIChild).Chart1.PrintMargins.Right:=3;
          Tgraphik_(ActiveMDIChild).Chart1.PrintMargins.Bottom:=3;
          Tgraphik_(ActiveMDIChild).Chart1.PrintResolution := -100;
          Tgraphik_(ActiveMDIChild).Chart1.PrintLandscape;
     end;
     if ActiveMDIChild is  TForm1 then
     begin
          TForm1(ActiveMDIChild).RichEdit1.Print('');
     end;
end;

procedure Tmain_form.prnsetup1Click(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

procedure Tmain_form.fontsetup1Click(Sender: TObject);
begin
     if ActiveMDIChild is  TForm1 then
     begin
          if FontDialog1.Execute then
          TForm1(ActiveMDIChild).RichEdit1.Font:=FontDialog1.font;
     end;
end;

procedure Tmain_form.N5Click(Sender: TObject);
    var
ver:TVersionInfo;
s:string;
begin
ver:=TVersionInfo.Create(application.ExeName);
s:='(с) ЗГТУ, версия - '+ver.FileVersion+' '#13#10'Зав. каф. "ДМ и ПТМ" Мартовицкий Л.М.';
ShellAbout(Main_Form.Handle, 'Расчет динамики конвейера',
pchar(s),
Application.Icon.Handle);
end;

procedure Tmain_form.N9Click(Sender: TObject);
begin
  close;
end;

procedure Tmain_form.N10Click(Sender: TObject);
begin
     if ActiveMDIChild is  TForm1 then
     begin
      SaveDialog1.Title := 'Сохранение результатов расчета в файл: ';
      if SaveDialog1.Execute then
        TForm1(ActiveMDIChild).RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
     end;
end;

procedure Tmain_form.N4Click(Sender: TObject);
begin
     Form2.RxRichEdit1.Lines.LoadFromFile('r.rtf');
     form2.showmodal;
end;

procedure Tmain_form.N1Click(Sender: TObject);
begin
     n7.Enabled:=(ActiveMDIChild is tform1) or (ActiveMDIChild is Tgraphik_);
     fontsetup1.Enabled:=(ActiveMDIChild is tform1);
     n10.Enabled:=(ActiveMDIChild is tform1);
end;

end.
