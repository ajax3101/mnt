object main_form: Tmain_form
  Left = 193
  Top = 106
  Width = 769
  Height = 522
  Caption = '������� ����'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 457
    Width = 761
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 200
    Top = 48
    object N1: TMenuItem
      Caption = '����'
      OnClick = N1Click
      object ssss1: TMenuItem
        Caption = '������'
        OnClick = ssss1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = '������'
        OnClick = N7Click
      end
      object prnsetup1: TMenuItem
        Caption = '��������� �������'
        OnClick = prnsetup1Click
      end
      object fontsetup1: TMenuItem
        Caption = '��������� �������'
        OnClick = fontsetup1Click
      end
      object N10: TMenuItem
        Caption = '��������� ���'
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = '�����'
        OnClick = N9Click
      end
    end
    object _windows_: TMenuItem
      Caption = '����'
      OnClick = _windows_Click
      object a4: TMenuItem
        Tag = 1
        Caption = '���� ��������'
        OnClick = a4Click
      end
      object a3: TMenuItem
        Tag = 1
        Caption = '���� �����������'
        OnClick = a3Click
      end
      object a2: TMenuItem
        Tag = 1
        Caption = '�������� ��� ����'
        OnClick = a2Click
      end
      object a1: TMenuItem
        Tag = 1
        Caption = '������������ ��� ����'
        OnClick = a1Click
      end
      object N2: TMenuItem
        Tag = 1
        Caption = '-'
      end
      object test: TMenuItem
        Caption = 'test'
        OnClick = testClick
      end
    end
    object N3: TMenuItem
      Caption = '������'
      object N4: TMenuItem
        Caption = '����������� ������������'
        OnClick = N4Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N5: TMenuItem
        Caption = '� ���������'
        OnClick = N5Click
      end
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 200
    Top = 8
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 200
    Top = 88
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'rtf'
    Filter = '����� RTF|*.rtf'
    FilterIndex = 0
    Left = 160
    Top = 88
  end
end
