codeunit 50201 SystemCodeunit
{
    procedure GetRecordName(RecordType: Text; ID: Integer): Text[100]
    begin
        case
            RecordType of
            'Student':
                begin
                    if student.Get(ID) then
                        exit(student."First Name" + ' ' + student."Last Name");
                end;
            'Subject':
                begin
                    if subject.Get(ID) then
                        exit(subject.Name);
                end;
            'Professor':
                begin
                    if professor.Get(ID) then
                        exit(professor."First Name" + ' ' + professor."Last Name");
                end;
        end;
    end;

    procedure PerformLookup(var Text: Text; LookUpType: Text; var ID: Integer): Boolean
    var
        studentID: Integer;
    begin

        case
            LookUpType of

            'Student':
                begin
                    if Page.RunModal(Page::"Students' List", student) = Action::LookupOK then begin
                        Text := GetRecordName('Student', student."Student ID");
                        ID := student."Student ID";
                        exit(true);
                    end;
                end;

            'Subject':
                begin
                    if Page.RunModal(Page::"Subjects' List", subject) = Action::LookupOK then begin
                        Text := GetRecordName('Subject', subject."Subject ID");
                        ID := subject."Subject ID";  // Set the returned ID

                        exit(true);
                    end;
                end;
            'Professor':
                begin
                    if Page.RunModal(Page::"Professors' List", professor) = Action::LookupOK then begin
                        Text := GetRecordName('Professor', professor."Professor ID");
                        ID := professor."Professor ID";  // Set the returned ID

                        exit(true);
                    end;
                end;

        end;

        exit(false);

    end;

    procedure ShowRelatedRecords(RecordType: Text; RecordID: Integer)
    var
        professorCoursesPage: Page "Professor's Courses";
        studentEnrollmentsPage: Page "Student Enrollments";
        subjectStudentsPage: Page "Subject Students";
        professorSchedule: Record "Professor Schedule";
        enrollment: Record Enrollment;
    begin
        case RecordType of
            'Professor':
                begin
                    professorSchedule.SetRange("Professor ID", RecordID);
                    if professorSchedule.IsEmpty then
                        Message('No subject (course) is taught by this professor')
                    else begin
                        professorCoursesPage.SetTableView(professorSchedule);
                        professorCoursesPage.RunModal();
                    end;
                end;

            'Student':
                begin
                    enrollment.SetRange("Student ID", RecordID);
                    if enrollment.IsEmpty then
                        Message('This student has no enrollments in any subject')
                    else begin
                        studentEnrollmentsPage.SetTableView(enrollment);
                        studentEnrollmentsPage.RunModal();
                    end;
                end;

            'Subject':
                begin
                    enrollment.SetRange("Subject ID", RecordID);
                    if enrollment.IsEmpty then
                        Message('No students are enrolled in this subject')
                    else begin
                        subjectStudentsPage.SetTableView(enrollment);
                        subjectStudentsPage.RunModal();
                    end;
                end;

            else
                Error('Invalid Record Type provided.');
        end;
    end;

    var

        student: Record Student;
        subject: Record Subject;
        professor: Record Professor;
}