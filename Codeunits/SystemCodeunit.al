codeunit 50220 SystemCodeunit
{
    procedure GetRecordName(RecordType: Text; ID: Integer): Text[100]
    begin
        case
            RecordType of
            'Student':
                begin
                    if Student.Get(ID) then
                        exit(Student."First Name" + ' ' + Student."Last Name");
                end;
            'Subject':
                begin
                    if Subject.Get(ID) then
                        exit(Subject.Name);
                end;
            'Professor':
                begin
                    if Professor.Get(ID) then
                        exit(Professor."First Name" + ' ' + Professor."Last Name");
                end;
        end;
    end;

    procedure PerformLookup(var Text: Text; LookUpType: Text; var ID: Integer): Boolean
    var
        StudentID: Integer;
    begin

        case
            LookUpType of

            'Student':
                begin
                    if Page.RunModal(Page::"Students' List", Student) = Action::LookupOK then begin
                        Text := GetRecordName('Student', Student."Student ID");
                        ID := Student."Student ID";
                        exit(true);
                    end;
                end;

            'Subject':
                begin
                    
                    if Professor."Professor ID" <> 0 then begin

                        Subject.SetRange(Department, Professor.Department);
                    end;

                    // Display the page for selecting a Subject
                    if Page.RunModal(Page::"Subjects' List", Subject) = Action::LookupOK then begin
                        // Get the name and set the ID based on the selected Subject
                        Text := GetRecordName('Subject', Subject."Subject ID");
                        ID := Subject."Subject ID";  // Set the returned ID

                        exit(true);  // Exit after successful selection
                    end;
                end;

            'Professor':
                begin
                    if Page.RunModal(Page::"Professors' List", Professor) = Action::LookupOK then begin
                        Text := GetRecordName('Professor', Professor."Professor ID");
                        ID := Professor."Professor ID";  // Set the returned ID

                        exit(true);
                    end;
                end;

        end;

        exit(false);

    end;

    procedure ShowRelatedRecords(RecordType: Text; RecordID: Integer)
    var
        ProfessorCoursesPage: Page "Professors' Schedule";
        StudentEnrollmentsPage: Page "Enrollments' List";
        SubjectStudentsPage: Page "Enrollments' List";
        ProfessorSchedule: Record "Professor Schedule";
        Enrollment: Record Enrollment;
    begin
        case RecordType of
            'Professor':
                begin
                    ProfessorSchedule.SetRange("Professor ID", RecordID);
                    if ProfessorSchedule.IsEmpty then
                        Message('No Subject (course) is taught by professor %1', GetRecordName('Professor', RecordID))
                    else begin
                        ProfessorCoursesPage.SetTableView(ProfessorSchedule);
                        ProfessorCoursesPage.RunModal();
                    end;
                end;

            'Student':
                begin
                    Enrollment.SetRange("Student ID", RecordID);
                    if Enrollment.IsEmpty then
                        Message('Student %1 has no enrollments in any subject (course)', GetRecordName('Student', RecordID))
                    else begin
                        StudentEnrollmentsPage.SetTableView(Enrollment);
                        StudentEnrollmentsPage.RunModal();
                    end;
                end;

            'Subject':
                begin
                    Enrollment.SetRange("Subject ID", RecordID);
                    if Enrollment.IsEmpty then
                        Message('There are no students enrolled in the Subject %1', GetRecordName('Subject', RecordID))
                    else begin
                        SubjectStudentsPage.SetTableView(Enrollment);
                        SubjectStudentsPage.RunModal();
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

        Student: Record Student;
        Subject: Record Subject;
        Professor: Record Professor;
}