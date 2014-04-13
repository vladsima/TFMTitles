unit main;

{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ActnList,
  StdCtrls, Clipbrd, Menus, ExtCtrls, ComCtrls, Grids, HelpUnit,Lang;

type

  { TTFMTForm }

  TTFMTForm = class(TForm)
    Help: TButton;
    DelFav: TButton;
    Fav: TButton;
    Cheese: TButton;
    Firsts: TButton;
    FavesListName: TLabel;
    InfoPanel: TStatusBar;
    TitlesGrid: TStringGrid;
    FavsGrid: TStringGrid;
    TitlesListName: TLabel;
    Saves: TButton;
    Hardmode: TButton;
    Bootcamps: TButton;
    Others: TButton;
    procedure BootcampsClick(Sender: TObject);
    procedure CheeseClick(Sender: TObject);
    procedure DelFavClick(Sender: TObject);
    procedure FavClick(Sender: TObject);
    procedure FavsGridClick(Sender: TObject);
    procedure FavsGridDblClick(Sender: TObject);
    procedure FirstsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HardmodeClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure OthersClick(Sender: TObject);
    procedure SavesClick(Sender: TObject);
    procedure TitlesGridClick(Sender: TObject);
    procedure TitlesGridDblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
const
LangSize=35;
  SavesList:array [0..38] of string=('1 > Shaman Disciple',  '2 > Accomplished Shaman',  '3 > Shaman',  '4 > Shaman Master',  '13 > Inspired Shaman',
 '14 > Shaman Champion',  '15 > Glorious Shaman',  '16 > Shaman Duchess',  '17 > Shaman Princess',  '18 > Shaman Empress',
 '19 > Legendary Shaman',  '20 > Immortal Shaman',  '21 > The Chosen Shaman',  '22 > Holy Shaman',  '23 > Shaman Oracle',
 '24 > Shaman Prophet',  '25 > Shamarvelous',  '94 > Ancient Shaman',  '95 > Fearless Shaman',  '96 > Almight Shaman',
 '97 > Architect Shaman',  '98 > Mademoiselle',  '99 > Lady Chamane',  '100 > Loved',  '101 > Magician',
 '102 > Hero of Mice',  '103 > Angel Shaman',  '104 > The Creator',  '105 > Absolute Shaman',  '106 > Miraculous Shaman',
 '107 > Liberator',  '108 > Troll Shaman',  '109 > Ghost Shaman',  '110 > Spirit',  '111 > Demigoddess Shaman',
 '112 > Last Hope',  '113 > Redeemer',  '200 > Goddess Shaman',  '114 > Alpha & Omega');
  CheeseList:array [0..47] of string=('0 > Little Mouse','5 > Greedy Mouse','6 > Here ! Cheese !','7 > Yeeeeah Cheese ^^',
'8 > Cheeeeeese **','26 > Glutton Mouse','27 > Gleany','28 > Plumpy Mouse','29 > Paunchy Mouse',
'30 > Chubby Mouse','31 > Fluffy Mouse','32 > Tubby Mouse','33 > The Chubby',
'34 > The Puffy','35 > Activist Mouse','36 > Unionized Mouse','37 > Mouse on Strike',
'38 > The Cheese Initiated','39 > The Cheese Adept','40 > The Cheese Priest','41 > The Reaper',
'72 > Cheese Finder','73 > Cheese Knight','74 > Cheesegrubber','75 > Fatty','76 > Stout Mouse',
'77 > Cheese Lover','78 > Camembert','79 > PontL`Eveque','80 > Cheese Catcher','81 > It`s Over 9000',
'82 > Collector','83 > Cheeseleader','84 > Cheese Thief','85 > Cheese Creator','86 > Cheese Pizza',
'87 > Cheese Minister','88 > Prodigy Mouse','89 > Princess Of Transformice','90 > Cheesoholic',
'91 > The Cheesen One','92 > Sailor Mouse','234 > Om Nom Nom','235 > *-*','236 > Cheese Addict',
'237 > Cheesus','238 > Queen of Cheese','93 > MAH CHEESE!');
  FirstsList:array [0..44] of string=('9 > Fast Mouse','10 > Agile Mouse','11 > Pirate Mouse','12 > Ninja Mouse','42 > Rogue Mouse',
'43 > Looter','44 > Stalker','45 > Frothy Mouse','46 > The Silent','47 > Hawk Mouse',
'48 > Cobra Mouse','49 > Spidermouse','50 > Quick Silver','51 > Athletic Mouse',
'52 > Hasty Mouse','53 > Rocket Mouse','54 > Sonic The Mouse','55 > Pingless',
'56 > Kamikaze','57 > Warrior Mouse','58 > Mach 1','59 > Hunter','60 > First!','61 > Sniper',
'62 > Flash','63 > Supermouse','64 > Light Speed','65 > Time Traveler','66 > Fast Wind',
'67 > E=MouseC²','68 > Jumper','69 > The Untouchable','231 > Dynamite','232 > Speedmaster',
'233 > Whirlwind','70 > Wall-Jumper','224 > Sprinter','225 > Batmouse','226 > The Unseen',
'227 > Unstoppable','202 > The Wind Master','228 > ¡Ándale! ¡Ándale!','229 > Torpedo','230 > Speedy Gorgonzola',
'71 > LIGHTNING');
  HardModeList:array[0..10]of string=('213 > Decorator','214 > Builder','215 > Manufacturer',
  '216 > Technician','217 > Mechanic','218 > Specialist','219 > Inventor','220 > Engineer',
  '221 > Inventive Mouse','222 > Ingenious Mouse','223 > Virtuoso');
  BcList:array[0..30] of String=('256 > Rookie','257 > Neophyte','258 > Private','259 > Deft Mouse',
'260 > Solo Artist','261 > Caporal','262 > Accurate Mouse','263 > Bootcampeur',
'264 > Sergeant','265 > Corner Jumper','266 > Skilled Mouse','267 > Lieutenant',
'268 > Longjumper','269 > Incredimouse','270 > Bootcamp Addict','271 > Capitain',
'272 > Dexterous Mouse','273 > Maniac','274 > Major','275 > Cheese Artist','276 > Acrobat',
'277 > Colonel','278 > Shortcutter','279 > Tarzan','280 > Général','281 > Living Legend',
'282 > Stuntmouse','283 > Pro','284 > Chuck Souris','285 > Queen of Bootcamp','286 > Gravity Master');
  otherlist:array[0..63] of String=('115 > Nice Mouse','116 > Adorable Mouse','117 > Charming Mouse',
'118 > Pretty Mouse','119 > Cute Mouse','120 > Frivolous Mouse',
'121 > Snob Mouse','122 > Stylish Mouse','123 > Actress Mouse',
'124 > Fashion Mouse','125 > Sexy','126 > SuperStar',
'127 > Little Snowflake','128 > Christmas Spirit','129 > Little Pixie',
'130 > Santa Claus','210 > Alluring Mouse','211 > Temptress','212 > Latin Lover',
'240 > Cookies','241 > Christmas Cake','242 > Whitebeard','243 > Generous',
'244 > Snowy','245 > Snowstorm','249 > Omelettovore','250 > My Cutie Pie','251 > Fiancée',
'253 > Tonnerre de Brest','254 > Chocovore','255 > Chocobunny','287 > Vampire','288 > Snowball',
'289 > I`m cold','290 > Grilled Chestnut','291 > Chaussette','292 > Souris Sapin',
'293 > Cookies Eater','294 > I Cheese You','295 > Chicken','296 > Explorer','297 > Sardine',
'298 > Fishermouse','299 > Adorer','300 > Frankenmaus','301 > Bonbon *-*','302 > Pumpkin Juice',
'303 > Trick or Treat','304 > Poltergeist','305 > Halloween 2012','306 > Halloween 2013','307 > Von Drekkemaus',
'308 > Candy Cane','309 > Fairy Lights','310 > Papaille Noel','311 > Elfette',
'312 > Ange des Neiges','313 > Just Married','314 > Candy Apple','315 > Broken Heart','316 > Honeymoon',
'317 > Carnaval 2014','318 > Churros','319 > Partygoes');
  SavesListnum:array [0..38] of integer=(1,2,3,4,13,14,15,16,17,18,19,20,21,22,23,24,
  25,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,200,114);
CheeseListnum:array [0..47] of integer=(0,5,6,7,8,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,72,73,74,75,76,77,
  78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,234,235,236,237,238,93);
FirstsListnum:array [0..44] of integer=(9,10,11,12,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,
  62,63,64,65,66,67,68,69,231,232,233,70,224,225,226,227,202,228,229,230,71);
HardModeListnum:array[0..10]of integer=(213,214,215,216,217,218,219,220,221,222,223);
BcListnum:array[0..30] of integer=(256,257,258,259,260,261,262,263,264,265,266,267,268,269 ,270,271,272,273,274,275,276,277,
  278,279,280 ,281,282,283,284,285,286);
otherlistnum:array[0..63] of integer=(115,116 ,117 ,118 ,119 ,120 ,121 ,122 ,123 ,124,125,126, 127 ,128 ,129 ,130 ,
  210 ,211 ,212 ,240 ,241 ,242 ,243 ,244 ,245 ,249 ,250 ,251 ,253 ,254 ,255 ,287 ,288 ,289 ,290 ,291 ,292 ,293 ,
  294 ,295 ,296 ,297 ,298 ,299 ,300 ,301 ,302 ,303,304 ,305 ,306 ,307 ,308 ,309 ,310 ,311 ,312 ,313,314 ,315, 316,317,318,319);
var
  TFMTForm: TTFMTForm;
  favCheckPos,q:shortint;
  favCheck,Checked,checkednum,LocalPath:String;
  FFile:text;

implementation

{$R *.lfm}
{$R *.rc}

{ TTFMTForm }

procedure TTFMTForm.FormCreate(Sender: TObject);
var i:Integer;Str:String;
begin
  LocalPath:=ExtractFilePath(Application.ExeName);
  AssignFile(StngsFile,LocalPath+'settings.dat');
  {$I-}reset(StngsFile);{$I+}
  if IOResult<>0 then
     begin
       Rewrite(StngsFile);
       writeln(StngsFile,'#TFMT_Settings_File');
       writeln(StngsFile,'English');
       writeln(StngsFile,'false');
       Closefile(StngsFile);
     end
  else
      begin
        for i:=0 to 2 do
            ReadLn(StngsFile,StngsArray[i]);
        CloseFile(StngsFile);
      end;
  UseLang:=StngsArray[1];
  SetLang(uselang);
  if StngsArray[2]='true' then
     CopyOnDClick:=true;
  if StngsArray[2]='false' then
     CopyOnDClick:=false;
  i:=0;
  if FileSize(LocalPath+'fav.dat')>1 then
     begin
          AssignFile(FFile,LocalPath+'fav.dat');
          Reset(FFile);
          FavsGrid.RowCount:=1;
          while not EOF(FFile) do
          begin
               Readln(FFile,Str);
               FavsGrid.Cells[0,i]:=Str;
               inc(i);
               FavsGrid.RowCount:=i+1;
          end;
          CloseFile(FFile);
          if FavsGrid.Cells[0,FavsGrid.RowCount-1]='' then
             FavsGrid.RowCount:=i;
          InfoPanel.SimpleText:=UsedLang[10];
     end
  else
    begin
           AssignFile(FFile,LocalPath+'fav.dat');
           Rewrite(FFile);
           Closefile(FFile);
           InfoPanel.SimpleText:=UsedLang[11];
    end;
  favCheckPos:=-1;

  Cheese.Caption:=UsedLang[1];
  Firsts.Caption:=UsedLang[2];
  Saves.Caption:=UsedLang[3];
  Hardmode.Caption:=UsedLang[4];
  Bootcamps.Caption:=UsedLang[5];
  Others.Caption:=UsedLang[6];
  Help.Caption:=UsedLang[7];
  TitlesListName.Caption:=UsedLang[8];
  FavesListName.Caption:=UsedLang[9];
end;

procedure TTFMTForm.FormActivate(Sender: TObject);
var i:Integer;
begin
  AssignFile(StngsFile,LocalPath+'settings.dat');
  reset(StngsFile);
  for i:=0 to 2 do
      ReadLn(StngsFile,StngsArray[i]);
  CloseFile(StngsFile);
  UseLang:=StngsArray[1];
  SetLang(uselang);
     SetLang(uselang);
     Cheese.Caption:=UsedLang[1];
     Firsts.Caption:=UsedLang[2];
     Saves.Caption:=UsedLang[3];
     Hardmode.Caption:=UsedLang[4];
     Bootcamps.Caption:=UsedLang[5];
     Others.Caption:=UsedLang[6];
     Help.Caption:=UsedLang[7];
     TitlesListName.Caption:=UsedLang[8];
     FavesListName.Caption:=UsedLang[9];
end;

procedure TTFMTForm.HelpClick(Sender: TObject);
begin
  HelpForm.Show;
end;

procedure TTFMTForm.SavesClick(Sender: TObject);
var i:integer;
begin
  TitlesGrid.RowCount:=39;
  for i:=0 to 38 do
      TitlesGrid.Cells[0,i]:=SavesList[i];
  q:=0;
  InfoPanel.SimpleText:=UsedLang[12];
end;

procedure TTFMTForm.CheeseClick(Sender: TObject);
var i:integer;
begin
  TitlesGrid.RowCount:=48;
  for i:=0 to 47 do
    TitlesGrid.Cells[0,i]:=CheeseList[i];
  q:=1;
  InfoPanel.SimpleText:=UsedLang[13];
end;

procedure TTFMTForm.FirstsClick(Sender: TObject);
var i:integer;
begin
  TitlesGrid.RowCount:=46;
  for i:=0 to 45 do
    TitlesGrid.Cells[0,i]:=FirstsList[i];
  q:=3;
  InfoPanel.SimpleText:=UsedLang[14];
end;

procedure TTFMTForm.HardmodeClick(Sender: TObject);
var i:integer;
begin
  TitlesGrid.RowCount:=11;
  for i:=0 to 10 do
    TitlesGrid.Cells[0,i]:=HardModeList[i];
  q:=4;
  InfoPanel.SimpleText:=UsedLang[15];
end;

procedure TTFMTForm.BootcampsClick(Sender: TObject);
var i:integer;
begin
  TitlesGrid.RowCount:=31;
  for i:=0 to 30 do
    TitlesGrid.Cells[0,i]:=BcList[i]; ;
  q:=2;
  InfoPanel.SimpleText:=UsedLang[16];
end;

procedure TTFMTForm.OthersClick(Sender: TObject);
var i:integer;
begin
  TitlesGrid.RowCount:=64;
for i:=0 to 63 do
    TitlesGrid.Cells[0,i]:=otherlist[i];
  q:=5;
  InfoPanel.SimpleText:=UsedLang[17];
end;

procedure TTFMTForm.TitlesGridClick(Sender: TObject);
begin
  if (TitlesGrid.RowCount<>0) then
     begin
     Checked:=TitlesGrid.Cells[0,TitlesGrid.Row];
     if not CopyOnDClick then
        begin
             case q of
                0:begin
                       ClipBoard.AsText:=UsedLang[18]+IntToStr(SavesListnum[TitlesGrid.Row]);
                       checkednum:=IntToStr(SavesListnum[TitlesGrid.Row]);
                end;
                1:begin
                       ClipBoard.AsText:=UsedLang[18]+IntToStr(CheeseListnum[TitlesGrid.Row]);
                       checkednum:=IntToStr(CheeseListnum[TitlesGrid.Row]);
                end;
                2:begin
                       ClipBoard.AsText:=UsedLang[18]+IntToStr(FirstsListnum[TitlesGrid.Row]);
                       checkednum:=IntToStr(FirstsListnum[TitlesGrid.Row]);
                end;
                3:begin
                       ClipBoard.AsText:=UsedLang[18]+IntToStr(HardModeListnum[TitlesGrid.Row]);
                       checkednum:=IntToStr(HardModeListnum[TitlesGrid.Row]);
                end;
                4:begin
                       ClipBoard.AsText:=UsedLang[18]+IntToStr(BcListnum[TitlesGrid.Row]);
                       checkednum:=IntToStr(BcListnum[TitlesGrid.Row]);
                end;
                5:begin
                       ClipBoard.AsText:=UsedLang[18]+IntToStr(otherlistnum[TitlesGrid.Row]);
                       checkednum:=IntToStr(otherlistnum[TitlesGrid.Row]);
                end;
                end;
                InfoPanel.SimpleText:=TitlesGrid.Cells[0,TitlesGrid.Row]+UsedLang[19]
        end;
     end;
end;

procedure TTFMTForm.TitlesGridDblClick(Sender: TObject);
begin
  if TitlesGrid.RowCount<>0 then
     if CopyOnDClick then
  begin
  case q of
   0:begin
          ClipBoard.AsText:=UsedLang[18]+IntToStr(SavesListnum[TitlesGrid.Row]);
          checkednum:=IntToStr(SavesListnum[TitlesGrid.Row]);
   end;
   1:begin
          ClipBoard.AsText:=UsedLang[18]+IntToStr(CheeseListnum[TitlesGrid.Row]);
          checkednum:=IntToStr(CheeseListnum[TitlesGrid.Row]);
   end;
   2:begin
          ClipBoard.AsText:=UsedLang[18]+IntToStr(FirstsListnum[TitlesGrid.Row]);
          checkednum:=IntToStr(FirstsListnum[TitlesGrid.Row]);
   end;
   3:begin
          ClipBoard.AsText:=UsedLang[18]+IntToStr(HardModeListnum[TitlesGrid.Row]);
          checkednum:=IntToStr(HardModeListnum[TitlesGrid.Row]);
   end;
   4:begin
          ClipBoard.AsText:=UsedLang[18]+IntToStr(BcListnum[TitlesGrid.Row]);
          checkednum:=IntToStr(BcListnum[TitlesGrid.Row]);
   end;
   5:begin
          ClipBoard.AsText:=UsedLang[18]+IntToStr(otherlistnum[TitlesGrid.Row]);
          checkednum:=IntToStr(otherlistnum[TitlesGrid.Row]);
   end;
   end;
   InfoPanel.SimpleText:=TitlesGrid.Cells[0,TitlesGrid.Row]+UsedLang[19]
  end;
end;

procedure TTFMTForm.FavsGridClick(Sender: TObject);
var i:integer;
begin
     favCheck:=FavsGrid.Cells[0,FavsGrid.Row];
     favCheckPos:=FavsGrid.Row;
     if not CopyOnDClick then
     begin
          for i:=0 to 38 do
         if FavsGrid.Cells[0,FavsGrid.Row]=SavesList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(SavesListnum[i]);
     for i:=0 to 47 do
         if FavsGrid.Cells[0,FavsGrid.Row]=CheeseList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(CheeseListnum[i]);
     for i:=0 to 44 do
         if FavsGrid.Cells[0,FavsGrid.Row]=FirstsList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(FirstsListnum[i]);
     for i:=0 to 10 do
         if FavsGrid.Cells[0,FavsGrid.Row]=HardModeList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(HardModeListnum[i]);
     for i:=0 to 30 do
         if FavsGrid.Cells[0,FavsGrid.Row]=BcList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(BcListnum[i]);
     for i:=0 to 63 do
         if FavsGrid.Cells[0,FavsGrid.Row]=otherlist[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(otherlistnum[i]);
     InfoPanel.SimpleText:=FavsGrid.Cells[0,FavsGrid.Row]+UsedLang[19];
  end;
end;

procedure TTFMTForm.FavsGridDblClick(Sender: TObject);
var i:integer;
begin
  if FavsGrid.RowCount<>0 then
     if CopyOnDClick then
  begin
     for i:=0 to 38 do
         if FavsGrid.Cells[0,FavsGrid.Row]=SavesList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(SavesListnum[i]);
     for i:=0 to 47 do
         if FavsGrid.Cells[0,FavsGrid.Row]=CheeseList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(CheeseListnum[i]);
     for i:=0 to 44 do
         if FavsGrid.Cells[0,FavsGrid.Row]=FirstsList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(FirstsListnum[i]);
     for i:=0 to 10 do
         if FavsGrid.Cells[0,FavsGrid.Row]=HardModeList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(HardModeListnum[i]);
     for i:=0 to 30 do
         if FavsGrid.Cells[0,FavsGrid.Row]=BcList[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(BcListnum[i]);
     for i:=0 to 63 do
         if FavsGrid.Cells[0,FavsGrid.Row]=otherlist[i]
            then
                ClipBoard.AsText:=UsedLang[18]+IntToStr(otherlistnum[i]);
     InfoPanel.SimpleText:=FavsGrid.Cells[0,FavsGrid.Row]+UsedLang[19];
end;
end;

procedure TTFMTForm.FavClick(Sender: TObject);
var i:integer;
begin
  if Checked<>''  then
    begin
     AssignFile(FFile,LocalPath+'fav.dat');
     {$I-} Append(FFile);{$I+}
     if IOResult = 0 then
             Writeln(FFile, Checked);
     i:=FavsGrid.RowCount;
     inc(i);
     FavsGrid.RowCount:=i;
     FavsGrid.Cells[0,FavsGrid.RowCount-1]:=Checked;
     closefile(FFile);
     InfoPanel.SimpleText:=Checked+UsedLang[20];
     Checked:='';
    end
  else
     InfoPanel.SimpleText:=UsedLang[21];
end;

procedure TTFMTForm.DelFavClick(Sender: TObject);
var i:integer;
begin
  if favCheckPos>=0 then
  begin
  for i:=favCheckPos to FavsGrid.RowCount-2 do
      begin
           FavsGrid.Cells[0,i]:=FavsGrid.Cells[0,i+1];
      end;
  i:=FavsGrid.RowCount;
  i:=i-1;
  FavsGrid.RowCount:=i;
  AssignFile(FFile,LocalPath+'fav.dat');
  {$I-} rewrite(FFile);{$I+}
  for i:=0 to FavsGrid.RowCount-1 do
      Writeln(FFile, FavsGrid.Cells[0,i]);
  closefile(FFile);
  InfoPanel.SimpleText:=favCheck+UsedLang[22];
  favCheckPos:=-1;
  end
  else
  InfoPanel.SimpleText:=UsedLang[23];

end;

end.
