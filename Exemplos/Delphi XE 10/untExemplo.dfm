object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'TADVDelphi'
  ClientHeight = 460
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label18: TLabel
    Left = 477
    Top = 219
    Width = 27
    Height = 13
    Caption = 'PADC'
  end
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 723
    Height = 460
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'TADVString'
      object Label23: TLabel
        Left = 626
        Top = 283
        Width = 39
        Height = 13
        Caption = 'PosFinal'
      end
      object Label22: TLabel
        Left = 555
        Top = 283
        Width = 44
        Height = 13
        Caption = 'PosInicial'
      end
      object Label21: TLabel
        Left = 479
        Top = 306
        Width = 45
        Height = 13
        Caption = 'Substring'
      end
      object Label20: TLabel
        Left = 477
        Top = 219
        Width = 27
        Height = 13
        Caption = 'PADR'
      end
      object Label19: TLabel
        Left = 479
        Top = 251
        Width = 25
        Height = 13
        Caption = 'PADL'
      end
      object Label16: TLabel
        Left = 477
        Top = 192
        Width = 27
        Height = 13
        Caption = 'PADC'
      end
      object Label17: TLabel
        Left = 477
        Top = 160
        Width = 53
        Height = 13
        Caption = 'Wordcount'
      end
      object lblUpper: TLabel
        Left = 477
        Top = 128
        Width = 29
        Height = 13
        Caption = 'Upper'
      end
      object Label15: TLabel
        Left = 477
        Top = 96
        Width = 26
        Height = 13
        Caption = 'ToInt'
      end
      object Label4: TLabel
        Left = 16
        Top = 315
        Width = 73
        Height = 13
        Caption = 'RemoveAcento'
      end
      object Label5: TLabel
        Left = 16
        Top = 283
        Width = 29
        Height = 13
        Caption = 'Lower'
      end
      object Label6: TLabel
        Left = 16
        Top = 251
        Width = 77
        Height = 13
        Caption = 'ExtractNumbers'
      end
      object lblToCurrency: TLabel
        Left = 254
        Top = 219
        Width = 56
        Height = 13
        Caption = 'ToCurrency'
      end
      object Label14: TLabel
        Left = 254
        Top = 251
        Width = 57
        Height = 13
        Caption = 'ToDateTime'
      end
      object Label13: TLabel
        Left = 254
        Top = 283
        Width = 35
        Height = 13
        Caption = 'ToDate'
      end
      object Label12: TLabel
        Left = 254
        Top = 315
        Width = 36
        Height = 13
        Caption = 'ToFloat'
      end
      object Label11: TLabel
        Left = 254
        Top = 96
        Width = 55
        Height = 13
        Caption = 'RemoveExt'
      end
      object Label10: TLabel
        Left = 254
        Top = 128
        Width = 54
        Height = 13
        Caption = 'ReverseStr'
      end
      object Label9: TLabel
        Left = 254
        Top = 160
        Width = 54
        Height = 13
        Caption = 'ToCNPJCpf'
      end
      object Label8: TLabel
        Left = 254
        Top = 192
        Width = 47
        Height = 13
        Caption = 'ToComma'
      end
      object Label7: TLabel
        Left = 16
        Top = 219
        Width = 61
        Height = 13
        Caption = 'StringLength'
      end
      object Label3: TLabel
        Left = 16
        Top = 192
        Width = 52
        Height = 13
        Caption = 'CaixaMista'
      end
      object Label2: TLabel
        Left = 16
        Top = 160
        Width = 25
        Height = 13
        Caption = 'Rtrim'
      end
      object Label1: TLabel
        Left = 16
        Top = 128
        Width = 23
        Height = 13
        Caption = 'Ltrim'
      end
      object lbl2: TLabel
        Left = 16
        Top = 96
        Width = 29
        Height = 13
        Caption = 'Alltrim'
      end
      object lbl1: TLabel
        Left = 16
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Digite:'
      end
      object edtADVSTamPADR: TEdit
        Left = 510
        Top = 219
        Width = 33
        Height = 21
        TabOrder = 0
        Text = '30'
      end
      object edtADVSPADR: TEdit
        Left = 554
        Top = 219
        Width = 158
        Height = 21
        TabOrder = 1
      end
      object edtADVSPosFinal: TEdit
        Left = 626
        Top = 298
        Width = 33
        Height = 21
        TabOrder = 2
        Text = '5'
      end
      object edtADVSPosInicial: TEdit
        Left = 554
        Top = 298
        Width = 33
        Height = 21
        TabOrder = 3
        Text = '3'
      end
      object edtADVSSubstring: TEdit
        Left = 479
        Top = 325
        Width = 198
        Height = 21
        TabOrder = 4
      end
      object edtADVSPADL: TEdit
        Left = 556
        Top = 251
        Width = 156
        Height = 21
        TabOrder = 5
      end
      object edtADVSTAMPADL: TEdit
        Left = 512
        Top = 251
        Width = 33
        Height = 21
        TabOrder = 6
        Text = '30'
      end
      object edtADVSTamPADC: TEdit
        Left = 510
        Top = 192
        Width = 33
        Height = 21
        TabOrder = 7
        Text = '30'
      end
      object edtADVSPADC: TEdit
        Left = 554
        Top = 192
        Width = 158
        Height = 21
        TabOrder = 8
      end
      object chkADVSisCPF: TCheckBox
        Left = 437
        Top = 355
        Width = 48
        Height = 17
        Caption = 'isCPF'
        TabOrder = 9
      end
      object chkADVSisCNPJ: TCheckBox
        Left = 365
        Top = 355
        Width = 52
        Height = 17
        Caption = 'isCNPJ'
        TabOrder = 10
      end
      object edtADVSWordcount: TEdit
        Left = 554
        Top = 165
        Width = 121
        Height = 21
        TabOrder = 11
      end
      object edtADVSUpper: TEdit
        Left = 554
        Top = 128
        Width = 121
        Height = 21
        TabOrder = 12
      end
      object edtADVSToInt: TEdit
        Left = 554
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 13
      end
      object btnADVSSearchRight: TBitBtn
        Left = 632
        Top = 392
        Width = 76
        Height = 25
        Caption = 'SearchRigth'
        TabOrder = 14
        OnClick = btnADVSSearchRightClick
      end
      object btnADVSSearchLeft: TBitBtn
        Left = 536
        Top = 392
        Width = 90
        Height = 25
        Caption = 'SearchLeft'
        TabOrder = 15
        OnClick = btnADVSSearchLeftClick
      end
      object btnADVSReplaceString: TBitBtn
        Left = 453
        Top = 392
        Width = 77
        Height = 25
        Caption = 'ReplaceString'
        TabOrder = 16
        OnClick = btnADVSReplaceStringClick
      end
      object btnADVSRemoveCaracteres: TBitBtn
        Left = 342
        Top = 392
        Width = 105
        Height = 25
        Caption = 'RemoveCaracteres'
        TabOrder = 17
        OnClick = btnADVSRemoveCaracteresClick
      end
      object chkADVSIsInteger: TCheckBox
        Left = 293
        Top = 355
        Width = 66
        Height = 17
        Caption = 'IsInteger'
        TabOrder = 18
      end
      object chkADVSIsFloat: TCheckBox
        Left = 229
        Top = 355
        Width = 58
        Height = 17
        Caption = 'IsFloat'
        TabOrder = 19
      end
      object chkADVSIsEmpty: TCheckBox
        Left = 159
        Top = 355
        Width = 64
        Height = 17
        Caption = 'IsEmpty'
        TabOrder = 20
      end
      object btnADVSHasString: TBitBtn
        Left = 261
        Top = 392
        Width = 75
        Height = 25
        Caption = 'HasString'
        TabOrder = 21
        OnClick = btnADVSHasStringClick
      end
      object chkADVSIsDateTime: TCheckBox
        Left = 74
        Top = 355
        Width = 79
        Height = 17
        Caption = 'IsDateTime'
        TabOrder = 22
      end
      object chkADVSisEmail: TCheckBox
        Left = 16
        Top = 355
        Width = 52
        Height = 17
        Caption = 'isEmail'
        TabOrder = 23
      end
      object btnADVSExplode: TBitBtn
        Left = 180
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Explode'
        TabOrder = 24
        OnClick = btnADVSExplodeClick
      end
      object btnADVSClear: TBitBtn
        Left = 99
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Clear'
        TabOrder = 25
        OnClick = btnADVSClearClick
      end
      object edtADVSRemoveAcento: TEdit
        Left = 106
        Top = 312
        Width = 121
        Height = 21
        TabOrder = 26
      end
      object edtADVSLower: TEdit
        Left = 106
        Top = 280
        Width = 121
        Height = 21
        TabOrder = 27
      end
      object edtADVSExtractNumbers: TEdit
        Left = 106
        Top = 248
        Width = 121
        Height = 21
        TabOrder = 28
      end
      object btnADVSConcatenar: TBitBtn
        Left = 18
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Concatenar'
        TabOrder = 29
        OnClick = btnADVSConcatenarClick
      end
      object edtADVSToCurrency: TEdit
        Left = 331
        Top = 219
        Width = 121
        Height = 21
        TabOrder = 30
      end
      object edtADVSToDateTime: TEdit
        Left = 331
        Top = 251
        Width = 121
        Height = 21
        TabOrder = 31
      end
      object edtADVSToDate: TEdit
        Left = 331
        Top = 283
        Width = 121
        Height = 21
        TabOrder = 32
      end
      object edtADVSToFloat: TEdit
        Left = 331
        Top = 310
        Width = 121
        Height = 21
        TabOrder = 33
      end
      object edtADVSRemoveExt: TEdit
        Left = 331
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 34
      end
      object edtADVSReverseStr: TEdit
        Left = 331
        Top = 128
        Width = 121
        Height = 21
        TabOrder = 35
      end
      object edtADVSToCNPJCpf: TEdit
        Left = 331
        Top = 165
        Width = 121
        Height = 21
        TabOrder = 36
      end
      object edtADVSToComma: TEdit
        Left = 331
        Top = 192
        Width = 121
        Height = 21
        TabOrder = 37
      end
      object edtADVSStringLength: TEdit
        Left = 106
        Top = 216
        Width = 121
        Height = 21
        TabOrder = 38
      end
      object edtADVSCaixaMista: TEdit
        Left = 106
        Top = 189
        Width = 121
        Height = 21
        TabOrder = 39
      end
      object edtADVSRtrim: TEdit
        Left = 106
        Top = 157
        Width = 121
        Height = 21
        TabOrder = 40
      end
      object edtADVSLtrim: TEdit
        Left = 106
        Top = 125
        Width = 121
        Height = 21
        TabOrder = 41
      end
      object edtADVSAlltrim: TEdit
        Left = 106
        Top = 93
        Width = 121
        Height = 21
        TabOrder = 42
      end
      object btnProcessarTADVString: TBitBtn
        Left = 600
        Top = 33
        Width = 75
        Height = 25
        Caption = 'Processar'
        TabOrder = 43
        OnClick = btnProcessarTADVStringClick
      end
      object edtADVSValor: TEdit
        Left = 16
        Top = 35
        Width = 578
        Height = 21
        TabOrder = 44
        Text = '  Lor'#233'm conse'#231'a 1986, s   '
      end
    end
    object tsTADVDouble: TTabSheet
      Caption = 'TADVDouble'
      ImageIndex = 1
      object Label24: TLabel
        Left = 16
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Digite:'
      end
      object Label25: TLabel
        Left = 16
        Top = 72
        Width = 43
        Height = 13
        Caption = 'RoundTo'
      end
      object Label26: TLabel
        Left = 16
        Top = 112
        Width = 27
        Height = 13
        Caption = 'Trunc'
      end
      object Label27: TLabel
        Left = 16
        Top = 152
        Width = 66
        Height = 13
        Caption = 'CalPercentual'
      end
      object Label29: TLabel
        Left = 16
        Top = 195
        Width = 69
        Height = 13
        Caption = 'CalcProporcao'
      end
      object Label30: TLabel
        Left = 13
        Top = 235
        Width = 92
        Height = 13
        Caption = 'ToSqlServerFormat'
      end
      object Label31: TLabel
        Left = 16
        Top = 312
        Width = 51
        Height = 13
        Caption = 'ToExtenco'
      end
      object Label28: TLabel
        Left = 13
        Top = 352
        Width = 77
        Height = 13
        Caption = 'ToExtencoReais'
      end
      object Label32: TLabel
        Left = 363
        Top = 67
        Width = 38
        Height = 13
        Caption = 'ToReias'
      end
      object Label33: TLabel
        Left = 13
        Top = 275
        Width = 64
        Height = 13
        Caption = 'ToReaisPlano'
      end
      object Label34: TLabel
        Left = 120
        Top = 55
        Width = 29
        Height = 13
        Caption = 'Casas'
      end
      object Label35: TLabel
        Left = 122
        Top = 94
        Width = 29
        Height = 13
        Caption = 'Casas'
      end
      object Label36: TLabel
        Left = 121
        Top = 136
        Width = 11
        Height = 13
        Caption = '%'
      end
      object edtADVDValor: TEdit
        Left = 15
        Top = 35
        Width = 466
        Height = 21
        TabOrder = 0
        Text = '55,32655'
      end
      object BitBtn1: TBitBtn
        Left = 492
        Top = 33
        Width = 75
        Height = 25
        Caption = 'Processar'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object edtADVDRoundTo: TEdit
        Left = 159
        Top = 69
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edtADVDTrunc: TEdit
        Left = 159
        Top = 109
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtADVDCalPercentual: TEdit
        Left = 159
        Top = 149
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtADVDCalcProporcao: TEdit
        Left = 159
        Top = 192
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object edtADVDToSqlServerFormat: TEdit
        Left = 120
        Top = 232
        Width = 160
        Height = 21
        TabOrder = 6
      end
      object edtADVDToExtenco: TEdit
        Left = 120
        Top = 309
        Width = 472
        Height = 21
        TabOrder = 7
      end
      object edtADVDTamRoundTo: TEdit
        Left = 120
        Top = 69
        Width = 33
        Height = 21
        TabOrder = 8
        Text = '2'
      end
      object edtADVDTamTrunc: TEdit
        Left = 120
        Top = 109
        Width = 33
        Height = 21
        TabOrder = 9
        Text = '2'
      end
      object edtADVDTamCalPercentual: TEdit
        Left = 120
        Top = 149
        Width = 33
        Height = 21
        TabOrder = 10
        Text = '10'
      end
      object edtADVDTamCalcProporcao: TEdit
        Left = 120
        Top = 192
        Width = 33
        Height = 21
        Hint = 'Cal quantos por cento o valor '#233' em rela'#231#227'o ao numero passado'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        Text = '25'
      end
      object edtADVDToExtencoReais: TEdit
        Left = 120
        Top = 344
        Width = 472
        Height = 21
        TabOrder = 12
      end
      object edtADVToReias: TEdit
        Left = 407
        Top = 64
        Width = 160
        Height = 21
        TabOrder = 13
      end
      object edtADVToReaisPlano: TEdit
        Left = 120
        Top = 272
        Width = 160
        Height = 21
        TabOrder = 14
      end
      object btnADVDADD: TBitBtn
        Left = 15
        Top = 392
        Width = 75
        Height = 25
        Caption = 'ADD'
        TabOrder = 15
        OnClick = btnADVDADDClick
      end
      object btnADVDSub: TBitBtn
        Left = 99
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Sub'
        TabOrder = 16
        OnClick = btnADVDSubClick
      end
      object btnADVDADDAsString: TBitBtn
        Left = 183
        Top = 392
        Width = 75
        Height = 25
        Caption = 'ADDAsString'
        TabOrder = 17
        OnClick = btnADVDADDAsStringClick
      end
      object btnADVDInc: TBitBtn
        Left = 268
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Inc'
        TabOrder = 18
        OnClick = btnADVDIncClick
      end
      object btnADVDDec: TBitBtn
        Left = 352
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Dec'
        TabOrder = 19
        OnClick = btnADVDDecClick
      end
      object btnADVDClear: TBitBtn
        Left = 437
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Clear'
        TabOrder = 20
        OnClick = btnADVDClearClick
      end
      object btnADVDEval: TBitBtn
        Left = 521
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Eval'
        TabOrder = 21
        OnClick = btnADVDEvalClick
      end
      object btnSubtrairPercentual: TBitBtn
        Left = 606
        Top = 392
        Width = 106
        Height = 25
        Caption = 'SubtrairPercentual'
        TabOrder = 22
        OnClick = btnSubtrairPercentualClick
      end
    end
    object tsTADVInteger: TTabSheet
      Caption = 'TADVInteger'
      ImageIndex = 2
      object Label37: TLabel
        Left = 17
        Top = 171
        Width = 51
        Height = 13
        Caption = 'ToExtenco'
      end
      object Label38: TLabel
        Left = 16
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Digite:'
      end
      object Label39: TLabel
        Left = 16
        Top = 88
        Width = 66
        Height = 13
        Caption = 'CalPercentual'
      end
      object Label40: TLabel
        Left = 121
        Top = 72
        Width = 11
        Height = 13
        Caption = '%'
      end
      object Label41: TLabel
        Left = 16
        Top = 131
        Width = 69
        Height = 13
        Caption = 'CalcProporcao'
      end
      object edtTADIToExtenco: TEdit
        Left = 121
        Top = 168
        Width = 472
        Height = 21
        TabOrder = 0
      end
      object edtTADIValor: TEdit
        Left = 15
        Top = 35
        Width = 466
        Height = 21
        TabOrder = 1
        Text = '25'
      end
      object BitBtn2: TBitBtn
        Left = 492
        Top = 33
        Width = 75
        Height = 25
        Caption = 'Processar'
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object edtTADITAMCalcPercentual: TEdit
        Left = 120
        Top = 85
        Width = 33
        Height = 21
        TabOrder = 3
        Text = '10'
      end
      object edtTADICalcPercentual: TEdit
        Left = 159
        Top = 85
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtTADICalcProporcao: TEdit
        Left = 159
        Top = 128
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object edtTADITamCalcProporcao: TEdit
        Left = 120
        Top = 128
        Width = 33
        Height = 21
        Hint = 'Cal quantos por cento o valor '#233' em rela'#231#227'o ao numero passado'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = '25'
      end
      object btnTADIAdd: TBitBtn
        Left = 15
        Top = 392
        Width = 75
        Height = 25
        Caption = 'ADD'
        TabOrder = 7
        OnClick = btnTADIAddClick
      end
      object btnTADISub: TBitBtn
        Left = 104
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Sub'
        TabOrder = 8
        OnClick = btnADVDSubClick
      end
      object btnTADIInc: TBitBtn
        Left = 193
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Inc'
        TabOrder = 9
        OnClick = btnTADIIncClick
      end
      object btnTADIDEc: TBitBtn
        Left = 282
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Dec'
        TabOrder = 10
        OnClick = btnTADIDEcClick
      end
      object btnTADINextValue: TBitBtn
        Left = 371
        Top = 392
        Width = 75
        Height = 25
        Caption = 'NextValue'
        TabOrder = 11
        OnClick = btnTADINextValueClick
      end
      object btnTADIPriorValue: TBitBtn
        Left = 460
        Top = 392
        Width = 75
        Height = 25
        Caption = 'PriorValue'
        TabOrder = 12
        OnClick = btnTADIPriorValueClick
      end
      object btnTADIClear: TBitBtn
        Left = 549
        Top = 392
        Width = 75
        Height = 25
        Caption = 'Clear'
        TabOrder = 13
        OnClick = btnTADIClearClick
      end
    end
    object tsTADVDate: TTabSheet
      Caption = 'TADVDate'
      ImageIndex = 3
      object Label42: TLabel
        Left = 302
        Top = 241
        Width = 92
        Height = 13
        Caption = 'ToSqlServerFormat'
      end
      object Label43: TLabel
        Left = 9
        Top = 349
        Width = 51
        Height = 13
        Caption = 'ToExtenco'
      end
      object Label44: TLabel
        Left = 10
        Top = 96
        Width = 99
        Height = 13
        Caption = 'GetUltimoDiaSemana'
      end
      object Label45: TLabel
        Left = 11
        Top = 205
        Width = 36
        Height = 13
        Caption = 'GetMes'
      end
      object Label46: TLabel
        Left = 8
        Top = 168
        Width = 36
        Height = 13
        Caption = 'GetAno'
      end
      object lblGetDiaSemana: TLabel
        Left = 9
        Top = 132
        Width = 70
        Height = 13
        Caption = 'GetDiaSemana'
      end
      object Label48: TLabel
        Left = 12
        Top = 314
        Width = 70
        Height = 13
        Caption = 'MesToExtenco'
      end
      object Label49: TLabel
        Left = 10
        Top = 278
        Width = 105
        Height = 13
        Caption = 'DiaDaSemanaExtenco'
      end
      object Label50: TLabel
        Left = 8
        Top = 241
        Width = 32
        Height = 13
        Caption = 'GetDia'
      end
      object lblGetAnoMesesDias: TLabel
        Left = 308
        Top = 205
        Width = 86
        Height = 13
        Caption = 'GetAnoMesesDias'
      end
      object Label55: TLabel
        Left = 303
        Top = 168
        Width = 67
        Height = 13
        Caption = 'GetMesesDias'
      end
      object Label56: TLabel
        Left = 304
        Top = 132
        Width = 80
        Height = 13
        Caption = 'GetUltimoDiaMes'
      end
      object Label57: TLabel
        Left = 307
        Top = 96
        Width = 112
        Height = 13
        Caption = 'GetPrimeiroDiaAnoData'
      end
      object Label58: TLabel
        Left = 305
        Top = 314
        Width = 89
        Height = 13
        Caption = 'GetPrimeiroDiaAno'
      end
      object Label59: TLabel
        Left = 306
        Top = 277
        Width = 89
        Height = 13
        Caption = 'GetPrimeiroDiaMes'
      end
      object Label47: TLabel
        Left = 16
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Digite:'
      end
      object edtADVDTToSqlServerFormat: TEdit
        Left = 434
        Top = 237
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edtADVDTToExtenco: TEdit
        Left = 119
        Top = 348
        Width = 436
        Height = 21
        TabOrder = 1
      end
      object edtADVDTGetUltimoDiaSemana: TEdit
        Left = 119
        Top = 93
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edtADVDTGetMes: TEdit
        Left = 119
        Top = 202
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtADVDTGEtAno: TEdit
        Left = 119
        Top = 165
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtGetDiaSemana: TEdit
        Left = 119
        Top = 133
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object edtADVDTMesToExtenco: TEdit
        Left = 119
        Top = 311
        Width = 162
        Height = 21
        TabOrder = 6
      end
      object edtADVDTDiaDaSemanaExtenco: TEdit
        Left = 119
        Top = 275
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object edtADVDTGetDia: TEdit
        Left = 119
        Top = 238
        Width = 121
        Height = 21
        TabOrder = 8
      end
      object edtADVDTGetAnoMesesDias: TEdit
        Left = 434
        Top = 201
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object edtADVDTGetMesesDias: TEdit
        Left = 434
        Top = 165
        Width = 121
        Height = 21
        TabOrder = 10
      end
      object edtADVDTGetUltimoDiaMes: TEdit
        Left = 434
        Top = 129
        Width = 121
        Height = 21
        TabOrder = 11
      end
      object edtADVDTGetPrimeiroDiaAnoData: TEdit
        Left = 434
        Top = 93
        Width = 121
        Height = 21
        TabOrder = 12
      end
      object edtADVDTGetPrimeiroDiaAno: TEdit
        Left = 434
        Top = 309
        Width = 121
        Height = 21
        TabOrder = 13
      end
      object edtADVDTGetPrimeiroDiaMes: TEdit
        Left = 434
        Top = 273
        Width = 121
        Height = 21
        TabOrder = 14
      end
      object edtTAVDTValor: TEdit
        Left = 15
        Top = 35
        Width = 466
        Height = 21
        TabOrder = 15
        Text = '25'
      end
      object BitBtn3: TBitBtn
        Left = 492
        Top = 33
        Width = 75
        Height = 25
        Caption = 'Processar'
        TabOrder = 16
        OnClick = BitBtn3Click
      end
      object btnAddDias: TBitBtn
        Left = 12
        Top = 404
        Width = 75
        Height = 25
        Caption = 'AddDias'
        TabOrder = 17
        OnClick = btnAddDiasClick
      end
      object chkADVDTisAnoBiSexto: TCheckBox
        Left = 18
        Top = 380
        Width = 93
        Height = 17
        Caption = 'isAnoBiSexto'
        TabOrder = 18
      end
      object chkisADVDTFimDeSemana: TCheckBox
        Left = 117
        Top = 380
        Width = 93
        Height = 17
        Caption = 'isFimDeSemana'
        TabOrder = 19
      end
      object btnSubDias: TBitBtn
        Left = 93
        Top = 403
        Width = 75
        Height = 25
        Caption = 'SubDias'
        TabOrder = 20
        OnClick = btnSubDiasClick
      end
      object btnEncode: TBitBtn
        Left = 174
        Top = 403
        Width = 75
        Height = 25
        Caption = 'Encode'
        TabOrder = 21
        OnClick = btnEncodeClick
      end
      object btnEncodeFromString: TBitBtn
        Left = 258
        Top = 404
        Width = 113
        Height = 25
        Caption = 'btnEncodeFromString'
        TabOrder = 22
        OnClick = btnEncodeFromStringClick
      end
      object BitBtn4: TBitBtn
        Left = 387
        Top = 404
        Width = 113
        Height = 25
        Caption = 'ReplaceTimer'
        TabOrder = 23
        OnClick = BitBtn4Click
      end
      object btnSetDateNow: TBitBtn
        Left = 506
        Top = 404
        Width = 87
        Height = 25
        Caption = 'SetDateNow'
        TabOrder = 24
        OnClick = btnSetDateNowClick
      end
    end
  end
end
