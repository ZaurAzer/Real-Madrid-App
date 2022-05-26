unit PlayersDBINFO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, PlayersDB;

 type
  TPlayerDBINFOFORM = class(TForm)
    PlayerAge: TEdit;
    Label1: TLabel;
    TransferPrize: TEdit;
    Label3: TLabel;
    PlayerName: TEdit;
    Label4: TLabel;
  private
    { Private declarations }
  public
    procedure PlayerShowModal(Index : Integer );

    { Public declarations }
  end;

var
  PlayerDBINFOFORM: TPlayerDBINFOFORM;

implementation

{$R *.dfm}

 procedure TPlayerDBINFOFORM.PlayerShowModal(Index : Integer );

 Begin
    PlayerName.Text := PlayerDB[Index].Surname;
    PlayerAge.Text := IntToStr(PlayerDB[Index].Age);
    TransferPrize.Text := IntToStr(PlayerDB[Index].Prize);
    ShowModal;
 End;

end.
