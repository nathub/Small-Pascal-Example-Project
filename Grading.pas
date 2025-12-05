unit Grading;

interface

type
    TGradeLetter = (gradeAPlus, gradeA, gradeAMinus,
                  gradeBPlus, gradeB, gradeBMinus,
                  gradeCPlus, gradeC, gradeCMinus,
                  gradeD, gradeF);

    TGradeScore = 0..100;

function GetLetterFromScore(score: TGradeScore): TGradeLetter;
function GradeLetterToStr(grade: TGradeLetter): string;

implementation

//
function GetLetterFromScore(score: TGradeScore): TGradeLetter;
begin
    case score of
        90..100: GetLetterFromScore := gradeA;
        85..89:  GetLetterFromScore := gradeAMinus;
        80..84:  GetLetterFromScore := gradeBPlus;
        75..79:  GetLetterFromScore := gradeB;
        70..74:  GetLetterFromScore := gradeBMinus;
        65..69:  GetLetterFromScore := gradeCPlus;
        60..64:  GetLetterFromScore := gradeC;
        55..59:  GetLetterFromScore := gradeCMinus;
        50..54:  GetLetterFromScore := gradeD;
        1..49:   GetLetterFromScore := gradeF;
        0: GetLetterFromScore := gradeF;
    end;
end;

//
function GradeLetterToStr(grade: TGradeLetter): string;
begin
    case grade of
        gradeAPlus:  GradeLetterToStr := 'A+';
        gradeA:      GradeLetterToStr := 'A';
        gradeAMinus: GradeLetterToStr := 'A-';
        gradeBPlus:  GradeLetterToStr := 'B+';
        gradeB:      GradeLetterToStr := 'B';
        gradeBMinus: GradeLetterToStr := 'B-';
        gradeCPlus:  GradeLetterToStr := 'C+';
        gradeC:      GradeLetterToStr := 'C';
        gradeCMinus: GradeLetterToStr := 'C-';
        gradeD:      GradeLetterToStr := 'D';
        gradeF:      GradeLetterToStr := 'F';
    end;
end;

end.
