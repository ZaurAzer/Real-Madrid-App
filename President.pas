unit President;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, COMObj, Vcl.Grids,
  Vcl.Menus;

type
  TFPresident = class(TForm)
    LabelQuestion: TLabel;
    cbAnswer1: TCheckBox;
    cbAnswer2: TCheckBox;
    cbAnswer3: TCheckBox;
    cbAnswer4: TCheckBox;
    LabelCorrectAnswers: TLabel;
    Label2: TLabel;
    LabelQuestionNumber: TLabel;
    LabelResult: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbAnswersClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure ReadExcel();
    procedure InitQuiz();
    { Public declarations }
  end;

var
  FPresident: TFPresident;

implementation

{$R *.dfm}

var
  QuestionIndex: Integer;
  cbArray: Array of TCheckBox;
  AnswerCount: Integer;
  CorrectAnswerCount: Integer;
  Excel: Variant;

procedure UnCheckBox();
var
  I: Integer;
begin
  for I := 0 to Length(cbArray)-1 do
    cbArray[I].Checked := False;
end;

procedure TFPresident.cbAnswersClick(Sender: TObject);
var
  I: Integer;
  CorrectIndex: Integer;
  CorrectAnswer: String;
  cbAnswer: TCheckBox;
begin
  cbAnswer := Sender as TCheckBox;
  if (Excel.Sheets[2].Cells[QuestionIndex, 1].Text = '') then
  begin
    LabelResult.Visible := True;
    Exit;
  end;
  CorrectIndex := StrToInt(Excel.Sheets[2].Cells[QuestionIndex, AnswerCount + 2].Text);
  CorrectAnswer := Excel.Sheets[2].Cells[QuestionIndex, CorrectIndex + 1].Text;
  LabelQuestionNumber.Caption := IntToStr(QuestionIndex) + ')';
  LabelCorrectAnswers.Caption := IntToStr(CorrectAnswerCount) + ' / ' + IntToStr(QuestionIndex);
  if (CorrectAnswer = cbAnswer.Caption) then
    Inc(CorrectAnswerCount);
  LabelQuestionNumber.Caption := IntToStr(QuestionIndex) + ')';
  LabelCorrectAnswers.Caption := IntToStr(CorrectAnswerCount) + ' / ' + IntToStr(QuestionIndex);
  ReadExcel();
  Inc(QuestionIndex);
  UnCheckBox();
end;

procedure TFPresident.InitQuiz();
begin
  LabelResult.Visible := False;
  CorrectAnswerCount := 0;
  AnswerCount := 4;
  QuestionIndex := 1;
  LabelQuestionNumber.Caption := IntToStr(QuestionIndex) + ')';
  LabelCorrectAnswers.Caption := IntToStr(CorrectAnswerCount) + ' / ' + IntToStr(QuestionIndex);
  UnCheckBox();
  ReadExcel();
end;

procedure TFPresident.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Excel.Quit;
end;

procedure TFPresident.FormCreate(Sender: TObject);
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.Workbooks.Open('C:\\Users\User\Desktop\RealCoaches.xls');
  Excel.Visible := False;
  cbArray := [cbAnswer1, cbAnswer2, cbAnswer3, cbAnswer4];
  InitQuiz();
end;

procedure TFPresident.ReadExcel();
var
  I: integer;
begin
  LabelQuestion.Caption := Excel.Sheets[2].Cells[QuestionIndex, 1].Text;

  for I := 1 to AnswerCount do
  begin
    cbArray[I-1].Caption := Excel.Sheets[2].Cells[QuestionIndex, I+1].Text;
  end;
end;
end.
