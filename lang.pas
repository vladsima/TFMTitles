unit Lang;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ActnList,
    StdCtrls, Clipbrd, Menus, ExtCtrls;
const LangSize=35;
  defaultLang:array [0..35] of string=('#TFMT_Lang_File','Cheese','Firsts','Saves','Hardmode','Bootcamp','Others','Help','Titles list','Favourite titles list',
'Welcome! List of favourite titles was loaded.','Welcome!','Displaying saves titles.','Displaying cheese titles.',
'Displaying firsts` titles.','Displaying hard-mode saves titles.','Displaying bootcamp titles.','Displaying shop and event titles.',
'/title ',' copied to clipboard',' added to list of Favourite titles.','Click the element in Titles List to add it into Favs List.',
' deleted from list of Favourite titles.','Click the element on Favs List to remove it.','Русский','English',
'Copy on double click','TFM Titles List v0.1', 'This program contains the whole list of TFM titles.',
'By clicking buttons on the top of main window you will load selected titles into the left list.',
'By pressing ">>" button selected title will be added to the rigth list ("Favourite titles").',
'To remove title from Favourites press "<<" button.','~~~~~~ToDo~~~~~~',
'1) Search panel','2) Load user`s lang files','3) Design :D');
var UsedLang:array[0..LangSize] of string;
    StngsArray:array[0..2] of string;
    LangFile:TextFile;
    UseLang,LocalPath:String;
    procedure SetLang(s:string);

implementation
procedure SetLang(s:string);
var i:Integer; LocalPath:string;stngsFile:text;
begin
  case s of
       'Russian':
           begin
                if FileSize(LocalPath+'russian.lng') > 1 then
                   begin
                        AssignFile(LangFile,LocalPath+'russian.lng');
                        reset(LangFile);
                        for i:=0 to LangSize do
                            ReadLn(LangFile,UsedLang[i]);
                        CloseFile(LangFile);
                   end
                else
                   begin
                        for i:=0 to LangSize do
                            UsedLang[i]:=defaultLang[i];
                   end;
           end;
       'English':
           begin
                if FileSize(LocalPath+'english.lng')>1 then
                   begin
                        AssignFile(LangFile,LocalPath+'english.lng');
                        reset(LangFile);
                        for i:=0 to LangSize do
                            ReadLn(LangFile,UsedLang[i]);
                        CloseFile(LangFile);
                   end
                else
                   begin
                        for i:=0 to LangSize do
                            UsedLang[i]:=defaultLang[i];
                   end;
           end;
  end;
  if UsedLang[0]<>defaultLang[0] then
    for i:=0 to LangSize do
      if UsedLang[i]='' then
         begin
              UsedLang[i]:=defaultLang[i];
         end;
end;
end.

