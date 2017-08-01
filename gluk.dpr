program gluk;

uses
  Forms,
  mainform in 'mainform.pas' {main_form},
  enterilka_ in 'enterilka_.pas' {enterilka},
  rez in 'rez.pas' {Form1},
  graphik in 'graphik.pas' {graphik_},
  polzovat in 'polzovat.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Расчет динамики конвейера';
  Application.CreateForm(Tmain_form, main_form);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
