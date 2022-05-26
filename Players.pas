unit Players;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, System.ImageList, Vcl.ImgList, PlayersDBINFO;

type
  TFSquad = class(TForm)
    ImageField: TImage;
    Kurtua: TImage;
    Karvahal: TImage;
    Alaba: TImage;
    Militao: TImage;
    Mendy: TImage;
    Casemiro: TImage;
    Kroos: TImage;
    Rodrygo: TImage;
    Benzema: TImage;
    Vinicius: TImage;
    Modric: TImage;
    procedure MendyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSquad: TFSquad;

implementation

{$R *.dfm}


procedure TFSquad.MendyClick(Sender: TObject);
var
    PlayerImage: TImage;

begin
    PlayerImage := Sender As TImage;

    PlayerDBINFOFORM.PlayerShowModal(StrToInt(PlayerImage.Hint));
end;

end.
