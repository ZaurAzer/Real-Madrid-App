program Kursovaya;

uses
  Vcl.Forms,
  Kursac in 'D:\Documents\Embarcadero\Studio\Projects\Kursac.pas' {Form2},
  Trophies in 'D:\Documents\Embarcadero\Studio\Projects\Trophies.pas' {FTrophies},
  Players in 'D:\Documents\Embarcadero\Studio\Projects\Players.pas' {FSquad},
  Coaches in 'D:\Documents\Embarcadero\Studio\Projects\Coaches.pas' {FCoaches},
  AddTrophy in 'D:\Documents\Embarcadero\Studio\Projects\AddTrophy.pas' {frmAddTrophy},
  uTrophyTypes in 'D:\Documents\Embarcadero\Studio\Projects\uTrophyTypes.pas',
  PlayersDBINFO in 'D:\Documents\Embarcadero\Studio\Projects\PlayersDBINFO.pas' {PlayerDBINFOFORM},
  PlayersDB in 'D:\Documents\Embarcadero\Studio\Projects\PlayersDB.pas',
  uSort in 'D:\Documents\Embarcadero\Studio\Projects\uSort.pas',
  uTypes in 'D:\Documents\Embarcadero\Studio\Projects\uTypes.pas',
  President in 'D:\Documents\Embarcadero\Studio\Projects\President.pas' {FPresident},
  uTrophyManager in 'D:\Documents\Embarcadero\Studio\Projects\uTrophyManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFTrophies, FTrophies);
  Application.CreateForm(TFSquad, FSquad);
  Application.CreateForm(TFCoaches, FCoaches);
  Application.CreateForm(TfrmAddTrophy, frmAddTrophy);
  Application.CreateForm(TPlayerDBINFOFORM, PlayerDBINFOFORM);
  Application.CreateForm(TFPresident, FPresident);
  Application.Run;
end.
