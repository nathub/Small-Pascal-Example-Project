unit Student;

interface

uses Grading, sysutils;

type
    TNameRecord = record
        firstname, middlename, lastname: string[30];
    end;

    TGradeLevel = 0..12;

    TStudent = record
        name: TNameRecord;
        gender: (male, female, other);
        dateofbirth: TDateTime;
        score: TGradeScore;
        grade: TGradeLetter;
        gradeLevel: TGradeLevel         //0 is kindergarden
    end;

function GradeLevelToString(level: TGradeLevel): string;
function CreateStudent(): TStudent;

implementation

function GradeLevelToString(level: TGradeLevel): string;
begin
    if level = 0 then
        GradeLevelToString := 'Kindergarten'
    else
        GradeLevelToString := 'Grade ' + IntToStr(level);
end;

end.