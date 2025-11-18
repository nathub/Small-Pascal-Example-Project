program Main;
{$MODE OBJFPC}
uses Student, Grading;

var
	level: TGradeLevel;
	levelString: string;
begin
	writeln('Beginning Main program. Small Example Pascal, student system.');

	readln(level);

	levelString := GradeLevelToString(level);
	writeln('Grade Levels string: ', levelString);
  
end.
