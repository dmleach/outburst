unit uf_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    lstBurst: TListBox;
    mnuMainFileOpen: TMenuItem;
    mnuMainFile: TMenuItem;
    mnuMain: TMainMenu;
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

uses
  u_directory;

{ TfrmMain }

procedure TfrmMain.mnuMainFileOpenClick(Sender: TObject);
var
  directory: string;
begin
  directory := TDirectory.getDirectory;

  if directory <> ''
  then begin
    lstBurst.Items.CommaText := TDirectory.getBursts(directory);
  end;

end;

end.

