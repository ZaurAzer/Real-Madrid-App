unit uTypes;

interface

type
  TSortStates = record
    TrophyName: Boolean;
    Oponent: Boolean;
    Year: Boolean;
    Country: Boolean;
    Attendence: Boolean;
    OpponentScore: Boolean;
    TeamScore: Boolean;
    City: Boolean;
  end;
  TFileItem = ^TFilesItem;
  TFilesItem = record
    TrophyName: String;
    Oponent: String;
    Year: Integer;
    Country : String;
    Attendance: Integer;
    OponentScore: Byte;
    TeamScore: Byte;
    City : String;
  end;
  TFilesList = Array of TFileItem;


implementation

end.
