unit AddTrophy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls, uTrophyTypes;

type
  TfrmAddTrophy = class(TForm)
    ButtonAdd: TButton;
    leOponent: TLabeledEdit;
    leYear: TLabeledEdit;
    leCountry: TLabeledEdit;
    leAttendance: TLabeledEdit;
    leOponentScore: TLabeledEdit;
    leTeamScore: TLabeledEdit;
    leCity: TLabeledEdit;
    leTrophyName: TLabeledEdit;
    procedure ButtonAddClick(Sender: TObject);
  private
    procedure GetNewTrophy(var Trophy: TTrophiesData);
  public
    function SetNewTrophy(var Trophy: TTrophiesData): TModalResult;
  end;

var
  frmAddTrophy: TfrmAddTrophy;

implementation

{$R *.dfm}
uses
    uTrophyManager;


procedure TfrmAddTrophy.ButtonAddClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmAddTrophy.GetNewTrophy(var Trophy: TTrophiesData);
var
    Item : TTrophiesItem;
begin
    Item.TrophyName := leTrophyName.Text;
    Item.Oponent := leOponent.Text;
    Item.Year := StrToInt(leYear.Text);
    Item.OponentScore := StrToInt(leOponentScore.Text);
    Item.TeamScore := StrToInt(leOponentScore.Text);
    Item.Country := leCountry.Text;
    Item.City := leCity.Text;
    Item.Attendance:=StrToInt(leAttendance.Text);
    Trophy.Data := Item;
    AddTrophies(Item);
  end;

function TfrmAddTrophy.SetNewTrophy(var Trophy: TTrophiesData): TModalResult;
begin
  Result := ShowModal;

  if (Result <> mrCancel) then
    GetNewTrophy(Trophy);
end;

end.
