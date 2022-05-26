unit uTrophyTypes;

interface

type
 TTrophiesItem = record
    TrophyName: String;
    Oponent: String;
    Year: Integer;
    OponentScore: Integer;
    TeamScore: Integer;
    Country: String;
    City: String;
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
