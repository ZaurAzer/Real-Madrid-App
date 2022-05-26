unit PlayersDB;

interface

type PlayerData = record
    Surname : String;
    Age : Integer;
    Prize : Integer;
end;

var
    PlayerDB : Array[0..10] of PlayerData =
        (
        (Surname: 'Courtois';  Age: 1992 ; Prize : 65000000),
        (Surname: 'Mendy';  Age: 1996 ; Prize : 50000000),
        (Surname: 'Alaba';  Age: 1993 ; Prize : 55000000),
        (Surname: 'Militao';  Age: 1998 ; Prize : 60000000),
        (Surname: 'Carnajal';  Age: 1992 ; Prize : 18000000),
        (Surname: 'Modric';  Age: 1986 ; Prize : 10000000),
        (Surname: 'Casemiro';  Age: 1992 ; Prize : 50000000),
        (Surname: 'Kroos';  Age: 1990 ; Prize : 25000000),
        (Surname: 'Vinicius';  Age: 2000 ; Prize : 100000000),
        (Surname: 'Benzema';  Age: 1988 ; Prize : 25000000),
        (Surname: 'Rodrygo';  Age: 2001 ; Prize : 40000000)
        );

       implementation
end.
