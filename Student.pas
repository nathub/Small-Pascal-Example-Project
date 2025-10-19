unit Student;

interface

uses Grading, sysutils;

type
    TNameRecord = record
        firstname, middlename, lastname: string[100];
    end;

    TGradeLevel = 0..12;
    TGender = (male, female, other);

    TStudent = record
        name: TNameRecord;
        gender: TGender;
        dateofbirth: TDateTime;
        score: TGradeScore;
        grade: TGradeLetter;
        gradeLevel: TGradeLevel         //0 is kindergarden
    end;

function CreateNameRecord(first, middle, last: string[100]): TNameRecord;
function ParseGender(genderString: string[8]): TGender;
function GradeLevelToString(level: TGradeLevel): string;
function CreateStudent(): TStudent;

implementation

function CreateNameRecord(first, middle, last: string[100]): TNameRecord;
begin


end;

function GradeLevelToString(level: TGradeLevel): string;
begin
    if level = 0 then
        GradeLevelToString := 'Kindergarten'
    else
        GradeLevelToString := 'Grade ' + IntToStr(level);
end;

function CreateStudent( name: TNameRecord; 
                        gender: TGender; 
                        dob: TDateTime;
                        score: TGradeScore;
                        gradeLevel: TGradeLevel
                        ): TStudent;
begin
    var returnStudent: TStudent;
    returnStudent.name.firstname := name.firstname;
    returnStudent.name.middlename := name.middlename;
    returnStudent.name.lastname := name.lastname;

    returnStudent.gender := gender;
    returnStudent.dateofbirth := dob;
    returnStudent.score := score;
    returnStudent.grade := Grading.GetLetterFromScore(score);
    returnStudent.gradeLevel := gradeLevel;

    CreateStudent := returnStudent;
end;

end.