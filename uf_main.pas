unit uf_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  FileCtrl, Menus;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    Label1: TLabel;
    mnuMainFileOpen: TMenuItem;
    mnuMainFile: TMenuItem;
    mnuMain: TMainMenu;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure mnuMainFileOpenClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.mnuMainFileOpenClick(Sender: TObject);
var
  dlgOpen: TSelectDirectoryDialog;
begin
  dlgOpen := TSelectDirectoryDialog.Create(frmMain);

  try
    dlgOpen.InitialDir := GetCurrentDir;

    if dlgOpen.Execute
    then begin
      Label1.Caption := dlgOpen.FileName;
    end;
  finally
    FreeAndNil(dlgOpen);
  end;
end;

end.

