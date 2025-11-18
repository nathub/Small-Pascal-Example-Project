{$MODE OBJFPC}
unit Student;

interface

uses Grading, sysutils;

type
    TNameRecord = record
        firstname, middlename, lastname: string[50];
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

    ENameLengthExceed = class(Exception);

function ParseGender(genderString: string): TGender;
function GradeLevelToString(level: TGradeLevel): string;
function CreateStudent(firstname, middlename, lastname: string; 
                        gender: string; 
                        dob: TDateTime;
                        score: TGradeScore;
                        gradeLevel: TGradeLevel
                        ): TStudent;

implementation

// Creates a TGender from a string, accepts 'm*' for male and 'f*' for female 
function ParseGender(genderString: string): TGender;
begin
    genderString := Trim(genderString);
    if Length(genderString) = 0 then Exit(other);

    case LowerCase(genderString[1]) of 
        'm' : ParseGender := male;
        'f' : ParseGender := female;
    else
        ParseGender := other;
    end;

end;

//
function GradeLevelToString(level: TGradeLevel): string;
begin
    if level = 0 then
        GradeLevelToString := 'Kindergarten'
    else
        GradeLevelToString := 'Grade ' + IntToStr(level);
end;

//
function CreateStudent( firstname, middlename, lastname: string; 
                        gender: string; 
                        dob: TDateTime;
                        score: TGradeScore;
                        gradeLevel: TGradeLevel
                        ): TStudent;
var 
    returnStudent: TStudent;
begin
    if Length(firstname) > 50 then raise ENameLengthExceed.Create('Firstname exceeds name length limit.');
    returnStudent.name.firstname := firstname;
    
    if Length(middlename) > 50 then raise ENameLengthExceed.Create('Middlename exceeds name length limit.');
    returnStudent.name.middlename := middlename;

    if Length(lastname) > 50 then raise ENameLengthExceed.Create('lastname exceeds name length limit.');
    returnStudent.name.lastname := lastname;

    returnStudent.gender := ParseGender(gender);
    returnStudent.dateofbirth := dob;
    returnStudent.score := score;
    returnStudent.grade := Grading.GetLetterFromScore(score);
    returnStudent.gradeLevel := gradeLevel;

    CreateStudent := returnStudent;
end;

end.
