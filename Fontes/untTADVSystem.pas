
{*******************************************************************************}
{                                                                               }
{  untTADVString.pas                                                            }
{                                                                               }
{  Copyright (C) 2016 TADVDelphi                                                }
{                                                                               }
{  Autor: Evaldo  5/3/2016                                                      }
{                                                                               }
{  Descrição: Unit para operações do sistema operacional                        }
{                                                                               }
{*******************************************************************************}

unit untTADVSystem;

interface

uses Windows, SysUtils, dialogs, Graphics, Forms, ImageHlp,
  DBCtrls, TlHelp32, Controls, ShellApi, Classes, IdGlobal,
  IdHash, IdHashMessageDigest, WinSvc;

type
  SizeInt = Integer;

  TADVAplication = record
  private

  public
    function GetVersionInfo: string;
    function FileVersionInfo(Arquivo: string): string;
    procedure AbrirArquivoComNotePad(path: string);
    procedure AbrirExplorer(path: string);
    function DiretorioAplicacao: string;
    function ExecAndWait(const filename, Params: string; const WindowState: Word): Boolean;
    function ListarArquivos(Diretorio, Extencao: string; SubDiretorio: Boolean): TStringList;
    function ListarNomesArquivos(Diretorio, Extencao: string; SubDiretorio: Boolean): TStringList;
    function AppIsRunning(ActivateIt: Boolean): Boolean;
    function CriaSubDiretorios(const NomeSubDir: string): Boolean;
    function GetLocalUserName: AnsiString;
    function LastModify: string;
    function FileSize(filename: wideString): Int64;
    function OpenFolderAndSelectFile(const filename: string): Boolean;
    function FileSizeString(filename: wideString): string;
    function DataCriacaoAplicacao: TDate;
  end;

implementation

uses untTADVResources, untTADVString;

{ TADVAplication }

{-------------------------------------------------------------------------------
  @abstract (Abrir um arquivo usando o notepad  )
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (path: string)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVAplication.AbrirArquivoComNotePad(path: string);
begin
  ShellExecute(0, 'open', PChar(Strwindowsnotepade), PChar(path), nil, SW_MAXIMIZE);
end;

{-------------------------------------------------------------------------------
  @abstract (Abrir o Explorer mostrando uma pasta)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (path: string)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVAplication.AbrirExplorer(path: string);
begin
  ShellExecute(0, PChar('open'), PChar('explorer.exe'), PChar(path), nil, SW_NORMAL);
end;

{-------------------------------------------------------------------------------
  @abstract (Verificar se há uma instancia da aplicação rodando)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (path: string)
  @return   (None)
-------------------------------------------------------------------------------}

function TADVAplication.AppIsRunning(ActivateIt: Boolean): Boolean;
var
  hSem: THandle;
  hWndMe: HWnd;
  AppTitle: string;
begin
  Result := False;
  AppTitle := Application.Title;
  hSem := CreateSemaphore(nil, 0, 1, PChar(AppTitle));
  if ((hSem <> 0) and (GetLastError() = ERROR_ALREADY_EXISTS)) then
  begin
    CloseHandle(hSem);
    Result := True;
  end;
  if Result and ActivateIt then
  begin
    Application.Title := 'zzzzzzz';
    hWndMe := FindWindow(nil, PChar(AppTitle));
    if (hWndMe <> 0) then
    begin
      if IsIconic(hWndMe) then
      begin
        ShowWindow(hWndMe, SW_SHOWNORMAL);
      end
      else
      begin
        SetForegroundWindow(hWndMe);
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  @abstract (Criar um ou vários sub-diretórios)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (const NomeSubDir: string)
  @return   (Boolean)
-------------------------------------------------------------------------------}

function TADVAplication.CriaSubDiretorios(const NomeSubDir: string): Boolean;
begin
  if DirectoryExists(NomeSubDir) then
    Result := True
  else
    Result := ForceDirectories(NomeSubDir);
end;

{-------------------------------------------------------------------------------
  @abstract (Data de Criação da Aplicação)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TDate)
-------------------------------------------------------------------------------}

function TADVAplication.DataCriacaoAplicacao: TDate;
var
  LI: TLoadedImage;
begin
  Win32Check(MapAndLoad(PAnsiChar(AnsiString(Application.ExeName)), nil, @LI, False, True));
  Result := LI.FileHeader.FileHeader.TimeDateStamp / SecsPerDay +
    UnixDateDelta;
  UnMapAndLoad(@LI);
end;

{-------------------------------------------------------------------------------
  @abstract ( Retornar o diretório da aplicação)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVAplication.DiretorioAplicacao: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

{-------------------------------------------------------------------------------
  @abstract (Execultar e esperar o termino da execução de um exe)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (const filename, Params: string; const WindowState: Word)
  @return   (Boolean)
-------------------------------------------------------------------------------}

function TADVAplication.ExecAndWait(const filename, Params: string;
  const WindowState: Word): Boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido aos espaços contidos em nomes longos }
  CmdLine := '"' + filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, False,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    PChar(ExtractFilePath(filename)), SUInfo, ProcInfo);
  { Aguarda até ser finalizado }
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Libera os Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;

end;

{-------------------------------------------------------------------------------
  @abstract (TADVAplication.FileSize)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (filename: wideString)
  @return   (Int64)
-------------------------------------------------------------------------------}

function TADVAplication.FileSize(filename: wideString): Int64;
var
  sr: TSearchRec;
begin
  if FindFirst(filename, faAnyFile, sr) = 0 then
    Result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) +
      Int64(sr.FindData.nFileSizeLow)
  else
    Result := -1;

  FindClose(sr);

end;

function TADVAplication.FileSizeString(filename: wideString): string;
var
  AValue: Int64;
const
  K = Int64(1024);
  M = K * K;
  G = K * M;
  T = K * G;
begin
  AValue := FileSize(filename);

  if AValue < K then
    Result := Format('%d bytes', [AValue])
  else if AValue < M then
    Result := Format('%f KB', [AValue / K])
  else if AValue < G then
    Result := Format('%f MB', [AValue / M])
  else if AValue < T then
    Result := Format('%f GB', [AValue / G])
  else
    Result := Format('%f TB', [AValue / T]);

end;

{-------------------------------------------------------------------------------
  @abstract (Retorna a Versão do Arquivo)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Arquivo: string)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVAplication.FileVersionInfo(Arquivo: string): string;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
begin
  Result := '';
{$IFDEF DELPHI12_UP}
  VerInfoSize := GetFileVersionInfoSize(PWideChar(Arquivo), Dummy);
{$ELSE}
  VerInfoSize := GetFileVersionInfoSize(PChar(Arquivo), Dummy);
{$ENDIF}

  GetMem(PVerInfo, VerInfoSize);
  try
    if GetFileVersionInfo(PChar(Arquivo), 0, VerInfoSize, PVerInfo) then
      if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
        with PVerValue^ do
          Result := Format('%d.%d.%d.%d', [
            HiWord(dwFileVersionMS), //Major
              LoWord(dwFileVersionMS), //Minor
              HiWord(dwFileVersionLS), //Release
              LoWord(dwFileVersionLS)]); //Build
  finally
    FreeMem(PVerInfo, VerInfoSize);
  end;

end;

{-------------------------------------------------------------------------------
  @abstract (Retornar o usuário Logado na Máquina)
  @author   (INternet)
  @created  (2016.04.19)
  @param    (None)
  @return   (AnsiString)
-------------------------------------------------------------------------------}

function TADVAplication.GetLocalUserName: AnsiString;
var
  Count: DWord;
  I: SizeInt;
begin
  Count := 256 + 1; // UNLEN + 1
  // set buffer size to 256 + 2 characters
  SetLength(Result, Count);
  if GetUserName(PChar(Result), Count) then
    for I := 1 to Length(Result) do
    begin
      if Result[I] = #0 then
      begin
        SetLength(Result, I);
        Exit;
      end;
    end
  else
    Result := '';

end;

{-------------------------------------------------------------------------------
  @abstract (Retornar a versao da aplicação)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVAplication.GetVersionInfo: string;
begin
  Result := FileVersionInfo(Application.ExeName)
end;

{-------------------------------------------------------------------------------
  @abstract (Retornar a data da ultima modificação do execultavel)
  @author   (Internet)
  @created  (2016.04.20)
  @param    (None)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVAplication.LastModify: string;
var
  FileH: THandle;
  LocalFT: TFileTime;
  DosFT: DWord;
  LastAccessedTime: TDateTime;
  FindData: TWin32FindData;

begin

  Result := '';
  FileH := FindFirstFile(PChar(Application.ExeName), FindData);

  if FileH <> INVALID_HANDLE_VALUE then
  begin

    // Windows.FindClose(nil);
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin

      FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFT);
      FileTimeToDosDateTime(LocalFT, LongRec(DosFT).Hi, LongRec(DosFT).Lo);
      LastAccessedTime := FileDateToDatetime(DosFT);
      Result := DateTimeToStr(LastAccessedTime);
    end;
  end;
end;

{-------------------------------------------------------------------------------
  @abstract (Listar os arquivo cm o path contidos em um diretório e/ou Subdiretório)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Diretorio, Extencao: string; SubDiretorio: Boolean)
  @return   (TStringList)
-------------------------------------------------------------------------------}

function TADVAplication.ListarArquivos(Diretorio, Extencao: string;
  SubDiretorio: Boolean): TStringList;
  function TemAtributo(Attr, Val: Integer): Boolean;
  begin
    Result := (Attr and Val = Val);
  end;

var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin

  Result := TStringList.Create;

  Ret := FindFirst(Diretorio + '\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') and (F.Name <> '..') then
          if SubDiretorio then
          begin
            TempNome := Diretorio + '\' + F.Name;
            Result.AddStrings(ListarArquivos(TempNome, Extencao, True));
          end;
      end
      else
      begin
        if Pos(Extencao, LowerCase(F.Name)) > 0 then
          Result.Add(Diretorio + '\' + F.Name);
      end;
      Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;

end;

{-------------------------------------------------------------------------------
  @abstract (Listar os nomes dos arquivo contidos em um diretório e/ou Subdiretório)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Diretorio, Extencao: string; SubDiretorio: Boolean)
  @return   (TStringList)
-------------------------------------------------------------------------------}

function TADVAplication.ListarNomesArquivos(Diretorio, Extencao: string;
  SubDiretorio: Boolean): TStringList;
var
  i: Integer;
  Arq: TADVString;
begin
  Result := self.ListarArquivos(Diretorio, Extencao, SubDiretorio);

  for i := 0 to Result.Count - 1 do
  begin
    Arq.text := Result[i];
    Result[i] := Arq.SubString(Arq.SearchRigth('\') + 1, Arq.StringLength + 1).Text;
  end;

end;

{-------------------------------------------------------------------------------
  @abstract (Abrir arquivo no explorer já seleionado)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (const filename: string)
  @return   (Boolean)
-------------------------------------------------------------------------------}

function TADVAplication.OpenFolderAndSelectFile(
  const filename: string): Boolean;
begin
{$IFDEF DELPHI12_UP}
  ShellExecute(0, nil, 'explorer.exe', PWideChar('/select,' + filename), nil, SW_SHOWNORMAL)
{$ELSE}
  ShellExecute(0, nil, 'explorer.exe', PChar('/select,' + filename), nil, SW_SHOWNORMAL)
{$ENDIF}
end;

end.

