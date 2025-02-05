page 50216 "Subject Students"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Enrollment;

    layout
    {
        area(Content)
        {
            repeater("Enrolled Students")
            {
                field("Student Name"; studentName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    var
        studentName: Text[100]; // Temporary variable for student name
        systemCodeunit: Codeunit SystemCodeunit;


       

    trigger OnAfterGetRecord()
    begin
        studentName := systemCodeunit.GetRecordName('Student', Rec."Student ID");
    end;
}
