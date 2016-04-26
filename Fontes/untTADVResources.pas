
{*******************************************************************************}
{                                                                               }
{  untTADVString.pas                                                            }
{                                                                               }
{  Copyright (C) 2016 TADVDelphi                                                }
{                                                                               }
{  Autor: Evaldo  5/3/2016                                                      }
{                                                                               }
{  Descri��o:  Unit com resources strings usados no FrameWork                   }
{                                                                               }
{*******************************************************************************}

unit untTADVResources;

interface

resourcestring

  //==============================================================================
  // resources para Data Hora
  //==============================================================================

  strFormatoDataCB_DDMMAA = 'dd/mm/yyyy';
  strFormatoDataMD_MMDDYYYY = 'mm/dd/yyyy';
  strFormatoDataSB_DDMMAAAA = 'ddmmyyyy';
  strFormatoDataSB_DDMMAA = 'ddmmyy';
  strFormatoDataCB_DDMMAAB = 'dd/mm/yy';
  strFormatoDataSB_AAAAMMDD = 'YYYYMMDD';
  strFormatoDataSB_AAAAMMDDB = 'YYYY/MM/DD';
  strFormatoDataCB_DDMMAAAAHORA = 'DD/MM/YYYY HH:MM:SS';
  strFormatoHORA = 'HH:MM:SS';

  //==============================================================================
  // resources para Valores
  //==============================================================================

  strFormatoValor = '#,###,###,##0.00';
  strFormatoValorB = '#########0.00';
  strFormatoQtde = '#,###,000';

  //==============================================================================
  // resources de recursos do sistema
  //==============================================================================
  strWindowsNotepade = 'c:\windows\notepad.exe';
  strTmpArquivo = 'tmp.txt';

  //==============================================================================
  // Chaves de Criptografia
  //==============================================================================
  strkey = '';


  //==============================================================================
  // Menssagens de erro
  //==============================================================================
  strFalhaAoAbrirArquivo = 'O arquivo n�o pode ser aberto';
  strFileIOError = 'File IO error';
  strArqChaveNaoEcontrado = 'Arquivo da chave privada n�o foi encontrado.';
  strArqAssiNaoEncontrado = 'Arquivo para ser assinado n�o foi encontrado.';
  StrChaveNaoLida = 'N�o foi poss�vel ler a chave privada.';


implementation

end.


