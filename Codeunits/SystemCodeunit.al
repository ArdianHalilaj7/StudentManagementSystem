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

    procedure PerformLookup(var Text: Text; LookUpType: Text): Boolean

    begin

        case
            LookUpType of

            'Student':
                begin
                    if Page.RunModal(Page::"Students' List", student) = Action::LookupOK then begin
                        Text := Format(student."Student ID");


                        exit(true);
                    end;
                end;

            'Subject':
                begin
                    if Page.RunModal(Page::"Subjects' List", subject) = Action::LookupOK then begin
                        Text := Format(subject."Subject ID");
                        exit(true);
                    end;
                end;
            'Professor':
                begin
                    if Page.RunModal(Page::"Professors' List", professor) = Action::LookupOK then begin
                        Text := Format(professor."Professor ID");
                        exit(true);
                    end;
                end;

        end;

        exit(false);

    end;

    var

        student: Record Student;
        subject: Record Subject;
        professor: Record Professor;
}