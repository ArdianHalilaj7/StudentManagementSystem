codeunit 50220 SystemCodeunit
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
                    
                    if professor."Professor ID" <> 0 then begin

                        subject.SetRange(Department, professor.Department);
                    end;

                    // Display the page for selecting a subject
                    if Page.RunModal(Page::"Subjects' List", subject) = Action::LookupOK then begin
                        // Get the name and set the ID based on the selected subject
                        Text := GetRecordName('Subject', subject."Subject ID");
                        ID := subject."Subject ID";  // Set the returned ID

                        exit(true);  // Exit after successful selection
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
        professorCoursesPage: Page "Professors' Schedule";
        studentEnrollmentsPage: Page "Enrollments' List";
        subjectStudentsPage: Page "Enrollments' List";
        professorSchedule: Record "Professor Schedule";
        enrollment: Record Enrollment;
    begin
        case RecordType of
            'Professor':
                begin
                    professorSchedule.SetRange("Professor ID", RecordID);
                    if professorSchedule.IsEmpty then
                        Message('No subject (course) is taught by professor %1', GetRecordName('Professor', RecordID))
                    else begin
                        professorCoursesPage.SetTableView(professorSchedule);
                        professorCoursesPage.RunModal();
                    end;
                end;

            'Student':
                begin
                    enrollment.SetRange("Student ID", RecordID);
                    if enrollment.IsEmpty then
                        Message('Student %1 has no enrollments in any subject (course)', GetRecordName('Student', RecordID))
                    else begin
                        studentEnrollmentsPage.SetTableView(enrollment);
                        studentEnrollmentsPage.RunModal();
                    end;
                end;

            'Subject':
                begin
                    enrollment.SetRange("Subject ID", RecordID);
                    if enrollment.IsEmpty then
                        Message('There are no students enrolled in the subject %1', GetRecordName('Subject', RecordID))
                    else begin
                        subjectStudentsPage.SetTableView(enrollment);
                        subjectStudentsPage.RunModal();
                    end;
                end;

            else
                Error('Invalid Record provided.');
        end;
    end;

    procedure CalculateCount(RecordType: Text): Integer
    var
        Student: Record Student;
        Professor: Record Professor;
        Subject: Record Subject;
    begin
        case RecordType of
            'Student':
                exit(Student.Count());
            'Professor':
                exit(Professor.Count());
            'Subject':
                exit(Subject.Count());
        end;

        exit(0);
    end;

    var

        student: Record Student;
        subject: Record Subject;
        professor: Record Professor;
}