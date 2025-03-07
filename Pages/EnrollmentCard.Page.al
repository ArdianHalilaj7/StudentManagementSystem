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
                    Editable = false;
                }
            }
            group(Subject)
            {
                field("Subject Name"; SubjectName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    var
        StudentName: Text[100];
        SubjectName: Text[100];

    //OPTION 1 - USING THE TRIGGER FOR BETTER PERFORMANCE
    trigger OnAfterGetRecord()
    var
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        StudentName := SystemCodeunit.GetRecordName('Student', Rec."Student ID");
        SubjectName := SystemCodeunit.GetRecordName('Subject', Rec."Subject ID");
    end;

    // OPTION 2 - USING A LOCAL PROCEDURE WITH ENCAPSULATION (Functional Programming)
    // local procedure GetRecord(Enrollment: Record "Enrollment"; RecordType: Text): Text
    // var
    //     SystemCodeunit: Codeunit SystemCodeunit;
    // begin
    //     case
    //         RecordType of
    //         'Student':
    //             exit(SystemCodeunit.GetRecordName('Student', Enrollment."Student ID"));
    //         'Subject':
    //             exit(SystemCodeunit.GetRecordName('Subject', Enrollment."Subject ID"));
    //         else
    //             exit('');
    //     end;
    // end;

}