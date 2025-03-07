page 50214 "Subject Schedule"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Subject Schedule";

    layout
    {
        area(Content)
        {
            group("Professor")
            {
                field("Professor Name"; ProfessorName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
            group("Subject")
            {
                field("Subject Name"; SubjectName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Course Information")
            {
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                }

                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                }
                field("Day"; Rec."Day")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        ProfessorName: Text[100];
        SubjectName: Text[100];

    trigger OnAfterGetRecord()
    var
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        ProfessorName := SystemCodeunit.GetRecordName('Professor', Rec."Professor ID");
        SubjectName := SystemCodeunit.GetRecordName('Subject', Rec."Subject ID");
    end;

}