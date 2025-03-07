page 50211 "Professor Schedule"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Professor Schedule";

    layout
    {
        area(Content)
        {
            group(Professor)
            {
                field("Professor Name"; ProfessorName)
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
            group("Course Period")
            {
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }

                field("End Date"; Rec."End Date")
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