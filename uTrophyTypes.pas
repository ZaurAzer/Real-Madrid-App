unit uTrophyTypes;

interface

type
 TTrophiesItem = record
    TrophyName: String[255];
    Oponent: String[255];
    Year: Integer;
    OponentScore: Integer;
    TeamScore: Integer;
    Country: String[255];
    City: String[255];
    Attendance: Integer;
  end;
  TTrophiesData = ^TTrophyItem;
  TTrophyItem = record
    Data: TTrophiesItem;
    Prev: TTrophiesData;
    Next: TTrophiesData;
  end;
  TTrophyList = record
    First: TTrophiesData;
    Last: TTrophiesData;
  end;

implementation

end.
