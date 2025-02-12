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
                        Message('There are no students enrolled in the subject %1', GetRecordName('Subject', RecordID))
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

   procedure ValidatePhoneNumber(var PhoneNumber: Text[14])
    var
        Prefix: Text[4];
        //phoneNumber: Text[14];
        ValidPrefixes: array[5] of Text[2];
        AreaCode: Text[2];
        IsValid: Boolean;
        i: Integer;
    begin
        Prefix := '+383';
        ValidPrefixes[1] := '44';
        ValidPrefixes[2] := '45';
        ValidPrefixes[3] := '46';
        ValidPrefixes[4] := '43';
        ValidPrefixes[5] := '49';

        if CopyStr(PhoneNumber, 1, 5) = '00383' then
            PhoneNumber := CopyStr(PhoneNumber, 6)
        else if CopyStr(PhoneNumber, 1, 4) = '+383' then
            PhoneNumber := CopyStr(PhoneNumber, 5)
        else if CopyStr(PhoneNumber, 1, 3) = '383' then
            PhoneNumber := CopyStr(PhoneNumber, 4)
        else if CopyStr(PhoneNumber, 1, 1) = '0' then
            PhoneNumber := CopyStr(PhoneNumber, 2)
        else
            Error('Invalid phone number. Must start with 00383, +383, or 0');

        AreaCode := CopyStr(PhoneNumber, 1, 2);

        IsValid := false;
        for i := 1 to 5 do begin
            if AreaCode = ValidPrefixes[i] then begin
                IsValid := true;
                break;
            end;
        end;

        // If the area code is not valid, show an error
        if not IsValid then
            Error('Invalid phone number. Please, make sure to put a valid number');
        PhoneNumber := Prefix + ' ' + PhoneNumber;
    end;

    procedure ValidateEmail(var Email: Text)
    var
        atPos: Integer;
        dotPos: Integer;
    begin
        atPos := StrPos(Email, '@');
        dotPos := StrPos(Email, '.');

        if (atPos = 0) or (dotPos = 0) or (dotPos < atPos) then
            Error('Invalid email format. Please enter a valid email address (e.g., user@example.com).');
    end;

    var

        Student: Record Student;
        Subject: Record Subject;
        Professor: Record Professor;
}