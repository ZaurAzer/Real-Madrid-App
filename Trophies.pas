unit Trophies;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uTrophyTypes,
  Vcl.StdCtrls, uTypes, uSort, Vcl.ComCtrls;

type
  TFTrophies = class(TForm)
    cbTrophies: TComboBox;
    ButtonAddTrophy: TButton;
    lvTrophies: TListView;
    procedure FormCreate(Sender: TObject);
    procedure cbTrophiesSelect(Sender: TObject);
    procedure cbTrophiesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonAddTrophyClick(Sender: TObject);
    procedure lvTrophiesColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations }
  public
  procedure ListUpdate (var RTrophies : TTrophyList);
    { Public declarations }
  end;

var
  FTrophies: TFTrophies;
  SortStates: TSortStates;

implementation

uses
  AddTrophy, uTrophyManager;

var
  RTrophies: TTrophyList;
  TrophyAttr: Array of String = [
    'Trophy Name',
    'Oponent',
    'Year',
    'Oponent Score',
    'Team Score',
    'Country',
    'City',
    'Attendance'
  ];

{$R *.dfm}

procedure SetComboBox(cbList: TComboBox; RTrophies: TTrophyList);
var
  I: Integer;
  TrophyItem: TTrophiesData;
  cbStringList: TStringList;
begin
  cbList.Clear;
  cbStringList := TStringList.Create;
  cbStringList.Duplicates := dupIgnore;
  cbStringList.Sorted := true;
  TrophyItem := RTrophies.First;
  while (TrophyItem <> nil) do
  begin
    cbStringList.Add(TrophyItem.Data.TrophyName);
    TrophyItem := TrophyItem.Next;
  end;
  for I := 0 to cbStringList.Count-1 do
  begin
    cbList.Items.Add(cbStringList[I]);
  end;

end;

function SearchTrophyByName(TrophyName: String): TTrophiesData;
var
  I: Integer;
  TrophyItem: TTrophiesData;
  IsFound: Boolean;
begin
  IsFound := False;
  TrophyItem := RTrophies.First;
  while (TrophyItem <> nil) and Not (IsFound) do
  begin
    IsFound := TrophyItem.Data.TrophyName = TrophyName;
    if Not IsFound then
      TrophyItem := TrophyItem.Next;
  end;

  Result := TrophyItem;
end;

procedure FillStringGrid(lvTrophies: TListView; cbTrophies: TComboBox);
var
  I: Integer;
  TrophyItem: TTrophiesData;
  lvItem: TListItem;
begin
  lvTrophies.Clear;
  TrophyItem := RTrophies.First;

  while (TrophyItem <> nil) do
  begin
    if (TrophyItem.Data.TrophyName = cbTrophies.Text) then
    begin
      lvItem := lvTrophies.Items.Add;
      lvItem.Caption := TrophyItem.Data.TrophyName;
      lvItem.SubItems.Add(TrophyItem.Data.Oponent);
      lvItem.SubItems.Add(IntToStr(TrophyItem.Data.Year));
      lvItem.SubItems.Add(IntToStr(TrophyItem.Data.OponentScore));
      lvItem.SubItems.Add(IntToStr(TrophyItem.Data.TeamScore));
      lvItem.SubItems.Add(TrophyItem.Data.Country);
      lvItem.SubItems.Add(TrophyItem.Data.City);
      lvItem.SubItems.Add(IntToStr(TrophyItem.Data.Attendance));
    end;
    TrophyItem := TrophyItem.Next;
  end;
end;

procedure AddTrophyToList(TrophyElement: TTrophiesData);
begin
  TrophyElement.Prev := nil;
  TrophyElement.Next := nil;
  if (RTrophies.First = nil) then
  begin
    RTrophies.First := TrophyElement;
    RTrophies.Last := TrophyElement;
  end
  else
  begin
    TrophyElement.Next := RTrophies.First;
    RTrophies.First.Prev := TrophyElement;
    RTrophies.First := TrophyElement;
  end;
end;

procedure TFTrophies.ButtonAddTrophyClick(Sender: TObject);
var
  ModalResult: TModalResult;
  TrophyElement: TTrophiesData;
begin
  New(TrophyElement);
  ModalResult := frmAddTrophy.SetNewTrophy(TrophyElement);

  if ModalResult = mrOk then
  begin
  ListUpdate(RTrophies);
  AddTrophyToList(TrophyElement);
  SetComboBox(cbTrophies, RTrophies);
  end;
end;

procedure TFTrophies.cbTrophiesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 13) then
    Self.cbTrophiesSelect(Sender);
end;

procedure TFTrophies.cbTrophiesSelect(Sender: TObject);
var
  SelectedItem: TTrophiesData;
begin
  SelectedItem := SearchTrophyByName(cbTrophies.Text);
  FillStringGrid(lvTrophies, cbTrophies);
end;

procedure TFTrophies.ListUpdate (var RTrophies : TTrophyList);
begin
    RTrophies := GetTrophyItems;
    FillStringGrid(lvTrophies, cbTrophies);
end;

procedure TFTrophies.FormCreate(Sender: TObject);
begin
  SortStates.Year := False;
  SortStates.TrophyName := False;
  SortStates.Oponent := False;
  SortStates.Country := False;
  SortStates.Attendence := False;
  RTrophies.First := nil;
  RTrophies.Last := nil;
  ListUpdate(RTrophies);
  SetComboBox(cbTrophies, RTrophies);

end;

procedure SetListViewList(lvTrophies: TListView; TrophyList: TFilesList);
var
  I: Integer;
  lvItem: TListItem;
begin
  lvTrophies.Clear;
  for I := 0 to Length(TrophyList)-1 do
  begin
    lvItem := lvTrophies.Items.Add;
    lvItem.Caption := TrophyList[I].TrophyName;
    lvItem.SubItems.Add(TrophyList[I].Oponent);
    lvItem.SubItems.Add(IntToStr(TrophyList[I].Year));
    lvItem.SubItems.Add(IntToStr(TrophyList[I].OponentScore));
    lvItem.SubItems.Add(IntToStr(TrophyList[I].TeamScore));
    lvItem.SubItems.Add(TrophyList[I].Country);
    lvItem.SubItems.Add(TrophyList[I].City);
    lvItem.SubItems.Add(IntToStr(TrophyList[I].Attendance));
  end;
end;

procedure TFTrophies.lvTrophiesColumnClick(Sender: TObject;
  Column: TListColumn);
var
  I: Integer;
  TrophyItem: TFileItem;
  TrophyList: TFilesList;
begin
  SetLength(TrophyList, lvTrophies.Items.Count);

  for I := 0 to lvTrophies.Items.Count-1 do
  begin
    New(TrophyItem);
    TrophyItem.TrophyName := lvTrophies.Items[i].Caption;
    TrophyItem.Oponent := lvTrophies.Items[i].SubItems[0];
    TrophyItem.Year := StrToInt(lvTrophies.Items[i].SubItems[1]);
    TrophyItem.OponentScore := StrToInt(lvTrophies.Items[i].SubItems[2]);
    TrophyItem.TeamScore := StrToInt(lvTrophies.Items[i].SubItems[3]);
    TrophyItem.Country := lvTrophies.Items[i].SubItems[4];
    TrophyItem.City := lvTrophies.Items[i].SubItems[5];
    TrophyItem.Attendance := StrToInt(lvTrophies.Items[i].SubItems[6]);

    TrophyList[I] := TrophyItem;
  end;

  case (Column.Index) of
  2: begin
     SortStates.Year := Not SortStates.Year;
     SortListByYear(TrophyList, SortStates.Year);
     FillStringGrid(lvTrophies, cbTrophies);
     SetListViewList(lvTrophies, TrophyList);
  end;
  3: begin
     SortStates.OpponentScore := Not SortStates.OpponentScore;
     SortListByOponentScore(TrophyList, SortStates.OpponentScore);
     FillStringGrid(lvTrophies, cbTrophies);
     SetListViewList(lvTrophies, TrophyList);
  end;
  4: begin
     SortStates.TeamScore := Not SortStates.TeamScore;
     SortListByTeamScore(TrophyList, SortStates.TeamScore);
     FillStringGrid(lvTrophies, cbTrophies);
     SetListViewList(lvTrophies, TrophyList);
  end;
  7: begin
     SortStates.Attendence := Not SortStates.Attendence;
     SortListByAttendance(TrophyList, SortStates.Attendence);
     FillStringGrid(lvTrophies, cbTrophies);
     SetListViewList(lvTrophies, TrophyList);
  end;
  end;
  if (Column.Index = 2) then
  begin

  end;

end;

end.
