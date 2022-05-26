unit uSort;

interface

uses
    uTypes;

procedure SortListByTrophyName(var List: TFilesList; IsDesc: Boolean);
procedure SortListByYear(var List: TFilesList; IsDesc: Boolean);
procedure SortListByOponent(var List: TFilesList; IsDesc: Boolean);
procedure SortListByCountry(var List: TFilesList; IsDesc: Boolean);
procedure SortListByAttendance(var List: TFilesList; IsDesc: Boolean);
procedure SortListByOponentScore(var List: TFilesList; IsDesc: Boolean);
procedure SortListByTeamScore(var List: TFilesList; IsDesc: Boolean);
procedure SortListByCity(var List: TFilesList; IsDesc: Boolean);

implementation

procedure SortListByTrophyName(var List: TFilesList; IsDesc: Boolean);
var
  I: Integer;
  P: Integer;
  Min: TFileItem;
  MinId: Integer;
  Temp: TFileItem;
begin

  for I := 0 to Length(List)-1 do
  begin
    Min := List[I];
    MinId := I;
    for P := I + 1 to Length(List)-1 do
    begin
      if (IsDesc) then
      begin
        if (List[P].TrophyName < Min.TrophyName) then
        begin
          Min := List[P];
          MinId := P;
        end;
      end
      else
      begin
        if (List[P].TrophyName > Min.TrophyName) then
        begin
          Min := List[P];
          MinId := P;
        end;
      end;
    end;
    Temp := List[I];
    List[I] := Min;
    List[MinId] := Temp;
  end;
end;

procedure SortListByYear(var List: TFilesList; IsDesc: Boolean);
var
  I: Integer;
  P: Integer;
  Min: TFileItem;
  MinId: Integer;
  Temp: TFileItem;
  SortType: Integer;
begin
  if (IsDesc) then
    SortType := -1
  else
    SortType := 1;

  for I := 0 to Length(List)-1 do
  begin
    Min := List[I];
    MinId := I;
    for P := I + 1 to Length(List)-1 do
    begin
      if ((List[P].Year * SortType) < (Min.Year * SortType)) then
      begin
        Min := List[P];
        MinId := P;
      end;
    end;
    Temp := List[I];
    List[I] := Min;
    List[MinId] := Temp;
  end;
end;

procedure SortListByOponent(var List: TFilesList; IsDesc: Boolean);
var
  I: Integer;
  P: Integer;
  Min: TFileItem;
  MinId: Integer;
  Temp: TFileItem;
begin

  for I := 0 to Length(List)-1 do
  begin
    Min := List[I];
    MinId := I;
    for P := I + 1 to Length(List)-1 do
    begin
      if (IsDesc) then
      begin
        if (List[P].Oponent < Min.Oponent) then
        begin
          Min := List[P];
          MinId := P;
        end;
      end
      else
      begin
        if (List[P].Oponent > Min.Oponent) then
        begin
          Min := List[P];
          MinId := P;
        end;
      end;
    end;
    Temp := List[I];
    List[I] := Min;
    List[MinId] := Temp;
  end;
end;

procedure SortListByCountry(var List: TFilesList; IsDesc: Boolean);
var
  I: Integer;
  P: Integer;
  Min: TFileItem;
  MinId: Integer;
  Temp: TFileItem;
begin

  for I := 0 to Length(List)-1 do
  begin
    Min := List[I];
    MinId := I;
    for P := I + 1 to Length(List)-1 do
    begin
      if (IsDesc) then
      begin
        if (List[P].Country < Min.TrophyName) then
        begin
          Min := List[P];
          MinId := P;
        end;
      end
      else
      begin
        if (List[P].Country > Min.Country) then
        begin
          Min := List[P];
          MinId := P;
        end;
      end;
    end;
    Temp := List[I];
    List[I] := Min;
    List[MinId] := Temp;
  end;
end;

procedure SortListByAttendance(var List: TFilesList; IsDesc: Boolean);
var
  I: Integer;
  P: Integer;
  Min: TFileItem;
  MinId: Integer;
  Temp: TFileItem;
  Desc: Integer;
begin
  if (IsDesc) then
    Desc := 1
  else
    Desc := -1;

  for I := 0 to Length(List)-1 do
  begin
    Min := List[I];
    MinId := I;
    for P := I + 1 to Length(List)-1 do
    begin
      if ((List[P].Attendance * Desc) < (Min.Attendance * Desc)) then
      begin
        Min := List[P];
        MinId := P;
      end;
    end;
    Temp := List[I];
    List[I] := Min;
    List[MinId] := Temp;
  end;
end;

procedure SortListByOponentScore(var List: TFilesList; IsDesc: Boolean);
var
  I: Integer;
  P: Integer;
  Min: TFileItem;
  MinId: Integer;
  Temp: TFileItem;
  Desc: Integer;
begin
  if (IsDesc) then
    Desc := 1
  else
    Desc := -1;

  for I := 0 to Length(List)-1 do
  begin
    Min := List[I];
    MinId := I;
    for P := I + 1 to Length(List)-1 do
    begin
      if ((List[P].OponentScore * Desc) < (Min.OponentScore * Desc)) then
      begin
        Min := List[P];
        MinId := P;
      end;
    end;
    Temp := List[I];
    List[I] := Min;
    List[MinId] := Temp;
  end;
end;


procedure SortListByTeamScore(var List: TFilesList; IsDesc: Boolean);
var
  I: Integer;
  P: Integer;
  Min: TFileItem;
  MinId: Integer;
  Temp: TFileItem;
  Desc: Integer;
begin
  if (IsDesc) then
    Desc := 1
  else
    Desc := -1;

  for I := 0 to Length(List)-1 do
  begin
    Min := List[I];
    MinId := I;
    for P := I + 1 to Length(List)-1 do
    begin
      if ((List[P].TeamScore * Desc) < (Min.TeamScore * Desc)) then
      begin
        Min := List[P];
        MinId := P;
      end;
    end;
    Temp := List[I];
    List[I] := Min;
    List[MinId] := Temp;
  end;
end;

procedure SortListByCity(var List: TFilesList; IsDesc: Boolean);
var
  I: Integer;
  P: Integer;
  Min: TFileItem;
  MinId: Integer;
  Temp: TFileItem;
begin

  for I := 0 to Length(List)-1 do
  begin
    Min := List[I];
    MinId := I;
    for P := I + 1 to Length(List)-1 do
    begin
      if (IsDesc) then
      begin
        if (List[P].City < Min.City) then
        begin
          Min := List[P];
          MinId := P;
        end;
      end
      else
      begin
        if (List[P].City > Min.City) then
        begin
          Min := List[P];
          MinId := P;
        end;
      end;
    end;
    Temp := List[I];
    List[I] := Min;
    List[MinId] := Temp;
  end;
end;


end.
