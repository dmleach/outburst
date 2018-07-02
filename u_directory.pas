unit u_directory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

    { TDirectory }

    TDirectory = class
    public
      class function getDirectory: string; static;
    end;



implementation

uses
  Dialogs;

{ TDirectory }

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

