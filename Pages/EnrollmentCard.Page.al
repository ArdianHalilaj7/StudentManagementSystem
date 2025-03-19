page 50209 "Enrollment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Enrollment;

    layout
    {
        area(Content)
        {
            group("Enrollment Information")
            {
                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ApplicationArea = All;
                }
            }
            group(Student)
            {
                field("Student Name"; StudentName)
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Student: Record Student;
                        StudentID: Integer;
                        SystemCodeunit: Codeunit SystemCodeunit;
                    begin
                        if Page.RunModal(Page::"Students' List", Student) = Action::LookupOK then begin
                            Text := SystemCodeunit.GetRecordName('Student', Student."Student ID");
                            if Student.Get(Student."Student ID") then
                                Rec."Student ID" := Student."Student ID";
                            exit(true);
                        end;
                    end;
                }
            }
            group(Subject)
            {
                field("Subject Name"; SubjectName)
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        SubjectID: Integer;
                        SystemCodeunit: Codeunit SystemCodeunit;
                        Subject: Record Subject;
                    begin
                        if SystemCodeunit.PerformLookup(Text, 'Subject', SubjectID) then begin
                            if Subject.Get(SubjectID) then begin
                                Rec."Subject ID" := Subject."Subject ID";
                            end;
                            exit(true);
                        end;
                    end;
                }
            }
        }
    }
    var
        StudentName: Text[100];
        SubjectName: Text[100];

    trigger OnAfterGetRecord()
    var
        Student: Record Student;
        Subject: Record Subject;
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        if Student.Get(Rec."Student ID") then
            StudentName := SystemCodeunit.GetRecordName('Student', Student."Student ID")
        else
            StudentName := '<Student not found>';
        if Subject.Get(Rec."Subject ID") then
            SubjectName := SystemCodeunit.GetRecordName('Subject', Subject."Subject ID")
        else
            SubjectName := '<Subject not found>';
    end;
}