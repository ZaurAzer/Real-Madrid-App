unit Kursac;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, COMobj, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;// For Working with Com Interface

type
  TForm2 = class(TForm)
    BTrophies: TButton;
    BSquad: TButton;
    BCoaches: TButton;
    BPresidents: TButton;
    Image1: TImage;
    procedure BTrophiesClick(Sender: TObject);
    procedure BSquadClick(Sender: TObject);
    procedure BCoachesClick(Sender: TObject);
    procedure BPresidentsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Exlapp: OleVariant; // переменная для доступа к  MS Excel

implementation

{$R *.dfm}

uses Trophies, Players, Coaches, President;

procedure TForm2.BCoachesClick(Sender: TObject);
begin
  FCoaches.ShowModal;
end;

procedure TForm2.BPresidentsClick(Sender: TObject);
begin
  FPresident.InitQuiz();
  FPresident.ShowModal;
end;

procedure TForm2.BSquadClick(Sender: TObject);
begin
  FSquad.ShowModal;
end;

procedure TForm2.BTrophiesClick(Sender: TObject);
begin
  FTrophies.ShowModal;
end;
end.
