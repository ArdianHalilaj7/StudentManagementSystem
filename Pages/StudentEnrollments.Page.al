page 50215 "Student Enrollments"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Enrollment;

    layout
    {
        area(Content)
        {
            repeater("Enrollment Information")
            {
                field("Subject"; subjectName)
                {
                    ApplicationArea = All;
                }

                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        subjectName: Text[100];
        systemCodeunit: Codeunit SystemCodeunit;
        passedStudentID: Integer; // Variable to store the passed Student ID




    trigger OnAfterGetRecord()
    begin
        subjectName := systemCodeunit.GetRecordName('Subject', Rec."Subject ID");

    end;
}