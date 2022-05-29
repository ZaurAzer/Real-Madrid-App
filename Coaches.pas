unit Coaches;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, COMobj,
  Vcl.Menus, Vcl.Grids, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Data.Win.ADODB,
  Vcl.DBGrids;

type
  TFCoaches = class(TForm)
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCoaches: TFCoaches;
  Exlapp, WBook : OleVariant;

implementation

{$R *.dfm}

procedure TFCoaches.Button1Click(Sender: TObject);
var
    Excel: Variant;
begin
    Excel:=CreateOleObject('Excel.Application'); // содаем приложение Excel
    Excel.Visible:=True;
    Excel.Workbook.Open;//создаем раб книгу
end;

procedure TFCoaches.Button2Click(Sender: TObject);
var
    Excel: Variant;
begin
    Excel := CreateOleObject('Excel.Application');
    Excel.DisplayAlerts := False;
    Excel.Visible := True;
    Excel.Workbooks.Open('C:\\Users\User\Desktop\CoachesTableRealMadrid.xlsx');
//     OpenWorkBook(Excel, 'C:\Users\User\Desktop\CoachesTableRealMadrid.xlsx');
end;

end.
