unit uTrophyManager;

interface

uses
    uTrophyTypes, IOUtils, SysUtils, Classes;

procedure AddTrophies(TrophiesData: TTrophiesItem);
function GetTrophyItems(): TTrophyList;
procedure InitHistoryStorage();

implementation

var
  FileName: String = 'KursacTrophiesData.dat';

function GetStorageFilePath(): String;
begin
  Result := TPath.Combine(TPath.GetTempPath, FileName);
end;

procedure InitHistoryStorage();
var
  FHistory: File of TTrophiesItem;
  Item: TTrophiesItem;
begin
  if Not (TFile.Exists(GetStorageFilePath())) then
  begin
    TFile.Create(GetStorageFilePath());
  end;
end;


procedure AddTrophies(TrophiesData: TTrophiesItem);
var
  TempPath: String;
  FHistory: File of TTrophiesItem;
  Item: TTrophiesItem;
  FilePath: String;
  FStream: TFileStream;
  begin
  InitHistoryStorage();
  FilePath := GetStorageFilePath();
  AssignFile(FHistory, FilePath);
  Reset(FHistory);
  Seek(FHistory, Filesize(FHistory));
  Write(FHistory, TrophiesData);
  CloseFile(FHistory);
 end;
procedure ClearFile();
var
  FHistory: File of TTrophiesItem;
begin
  AssignFile(FHistory, GetStorageFilePath);
  Rewrite(FHistory);
  CloseFile(FHistory);
end;

procedure AddActionItem(var List: TTrophyList; Data: TTrophiesItem);
var
  Item: TTrophiesData;
begin
  New(Item);
  Item.Data := Data;
  Item.Next := nil;
  Item.Prev := nil;

  if (List.First = nil) then
  begin
    List.First := Item;
    List.Last := Item;
  end
  else
  begin
    Item.Next := List.First;
    List.First.Prev := Item;
    List.First := Item;
  end;
end;

function GetTrophyItems(): TTrophyList;
var
  FHistory: File of TTrophiesItem;
  HistoryActions: TTrophyList;
  HistoryItem: TTrophiesItem;
begin
  HistoryActions.First := nil;
  HistoryActions.Last := nil;
  InitHistoryStorage();
  AssignFile(FHistory, GetStorageFilePath());
  Reset(FHistory);

  try
    While not EOF(FHistory) do
    begin
      Read(FHistory, HistoryItem);
      AddActionItem(HistoryActions, HistoryItem);
    end;
  finally
   CloseFile(FHistory);
  end;

  Result := HistoryActions;
end;




end.
