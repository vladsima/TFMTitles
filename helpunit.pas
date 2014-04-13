unit HelpUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls,Lang;

type

  { THelpForm }

  THelpForm = class(TForm)
    HelpMemo: TMemo;
    Russian: TButton;
    English: TButton;
    CopyOnDblClick: TCheckBox;
    procedure CopyOnDblClickChange(Sender: TObject);
    procedure EnglishClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RussianClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  HelpForm: THelpForm;
  CopyOnDClick:boolean;
  UseLang:string;
  StngsFile:Text;

implementation

{$R *.lfm}

{ THelpForm }


procedure THelpForm.FormCreate(Sender: TObject);
var stg:TStrings;
begin
     LocalPath:=ExtractFilePath(Application.ExeName);
     if StngsArray[2]='true' then
        CopyOnDblClick.Checked:=true;
     if StngsArray[2]='false' then
        CopyOnDblClick.Checked:=false;
     HelpForm.Caption:=UsedLang[7];
     Russian.Caption:=UsedLang[24];
     English.Caption:=UsedLang[25];
     HelpMemo.Clear;
     HelpMemo.Lines.Append(UsedLang[27]+chr(13)+chr(10)+UsedLang[28]+chr(13)+chr(10)+UsedLang[29]+
     chr(13)+chr(10)+UsedLang[30]+chr(13)+chr(10)+UsedLang[31]+chr(13)+chr(10)+UsedLang[32]+chr(13)+chr(10)+UsedLang[33]+chr(13)+chr(10)+UsedLang[34]+chr(13)+chr(10)+UsedLang[35]);
end;

procedure THelpForm.FormActivate(Sender: TObject);
begin
  HelpForm.Caption:=UsedLang[7];
  Russian.Caption:=UsedLang[24];
  English.Caption:=UsedLang[25];
  CopyOnDblClick.Caption:=UsedLang[26];
  HelpMemo.Clear;
       HelpMemo.Lines.Append(UsedLang[27]+chr(13)+chr(10)+UsedLang[28]+chr(13)+chr(10)+UsedLang[29]+
       chr(13)+chr(10)+UsedLang[30]+chr(13)+chr(10)+UsedLang[31]+chr(13)+chr(10)+UsedLang[32]+chr(13)+chr(10)+UsedLang[33]+chr(13)+chr(10)+UsedLang[34]+chr(13)+chr(10)+UsedLang[35]);
end;

procedure THelpForm.RussianClick(Sender: TObject);
var LocalPath:string;
begin
     LocalPath:=ExtractFilePath(Application.ExeName);
     UseLang:='Russian';
     AssignFile(StngsFile, LocalPath+'settings.dat');
     rewrite(StngsFile);
     writeln(StngsFile,'#TFMT_Settings_File');
     writeln(StngsFile,UseLang);
     if CopyOnDClick then
        writeln(StngsFile,'true')
     else
         writeln(StngsFile,'false');
     CloseFile(StngsFile);
end;

procedure THelpForm.EnglishClick(Sender: TObject);
var LocalPath:string;
begin
     LocalPath:=ExtractFilePath(Application.ExeName);
     UseLang:='English';
     AssignFile(StngsFile, LocalPath+'settings.dat');
     rewrite(StngsFile);
     writeln(StngsFile,'#TFMT_Settings_File');
     writeln(StngsFile,UseLang);
     if CopyOnDClick then
        writeln(StngsFile,'true')
     else
         writeln(StngsFile,'false');
     CloseFile(StngsFile);
end;

procedure THelpForm.CopyOnDblClickChange(Sender: TObject);
var LocalPath:string;
begin
     LocalPath:=ExtractFilePath(Application.ExeName);
     if CopyOnDblClick.Checked
        then
            CopyOnDClick:=true
        else
            CopyOnDClick:=false;
     AssignFile(StngsFile, LocalPath+'settings.dat');
     rewrite(StngsFile);
     writeln(StngsFile,'#TFMT_Settings_File');
     writeln(StngsFile,StngsArray[1]);
     if CopyOnDClick then
        writeln(StngsFile,'true')
     else
         writeln(StngsFile,'false');
     CloseFile(StngsFile);
end;

end.

