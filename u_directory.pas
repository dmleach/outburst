unit u_directory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

    { TDirectory }

    TDirectory = class
    public
      class function getBursts(directory: string): string;
      class function getDirectory: string; static;
    end;



implementation

uses
  Dialogs, FileUtil;

{ TDirectory }

class function TDirectory.getBursts(directory: string): string;
var
  files: TStringList;
  resultString: string;
begin
  files := TStringList.Create();

  try
    FindAllFiles(files, directory, '', false);
    result := files.CommaText;
  finally
    FreeAndNil(files);
  end;
end;

class function TDirectory.getDirectory: string;
var
  directory: string;
  dlgOpen: TSelectDirectoryDialog;
begin
  directory := '';
  dlgOpen := TSelectDirectoryDialog.Create(nil);

  try
    dlgOpen.InitialDir := GetCurrentDir;

    if dlgOpen.Execute
    then begin
      directory := dlgOpen.FileName;
    end;
  finally
    FreeAndNil(dlgOpen);
  end;

  result := directory;
end;

end.

