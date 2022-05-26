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

procedure TfrmAddTrophy.ButtonAddClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddTrophy.GetNewTrophy(var Trophy: TTrophiesData);
begin
  Trophy.Data.TrophyName := leTrophyName.Text;
  Trophy.Data.Oponent := leOponent.Text;
  Trophy.Data.Year := StrToInt(leYear.Text);
  Trophy.Data.OponentScore := StrToInt(leOponentScore.Text);
  Trophy.Data.TeamScore := StrToInt(leTeamScore.Text);
  Trophy.Data.Country := leCountry.Text;
  Trophy.Data.City := leCity.Text;
  Trophy.Data.Attendance := StrToInt(leAttendance.Text);
end;

function TfrmAddTrophy.SetNewTrophy(var Trophy: TTrophiesData): TModalResult;
begin
  Result := ShowModal;

  if (Result <> mrCancel) then
    GetNewTrophy(Trophy);
end;

end.
