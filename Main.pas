program Main;
{$MODE OBJFPC}
uses Student, Grading, sysutils;

var
	level: TGradeLevel;
	levelString: string;

function InputStudent(): TStudent;
var
	studentName: TNameRecord;
begin
	writeln('Enter Student Firstname: ');
	readln(studentName.firstname);

	writeln('Enter Student Middlename: ');
	readln(studentName.middlename);
	
	writeln('Enter Student Lastname: ');
	readln(studentName.lastname);

	writeln(studentName.firstname, studentName.middlename, studentName.lastname);

	InputStudent = CreateStudent(studentName.firstname, studentName.middlename, studentName.lastname,
	 'm', SysUtils.Now(), 25, 3);
end;


begin
	writeln('Beginning Main program. Small Example Pascal, student system.');

	readln(level);

	levelString := GradeLevelToString(level);
	writeln('Grade Levels string: ', levelString);

	InputStudent();
  
end

end.
	
