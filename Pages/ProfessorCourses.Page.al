page 50217 "Professor's Courses"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Professor Schedule";

    layout
    {
        area(Content)
        {
            repeater("Proffesor's Courses")
            {

                field("Subject"; subjectName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Editable = false;

                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    Editable = false;

                }

            }
        }
    }

    var
        systemCodeunit: Codeunit SystemCodeunit;
        subjectName: Text[100];
        professorName: Text[100];

    trigger OnAfterGetRecord()
    begin
        subjectName := systemCodeunit.GetRecordName('Subject', Rec."Subject ID");
    end;

}