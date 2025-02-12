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
                field("Professor Name"; SystemCodeunit.GetRecordName('Professor', Rec."Professor ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }

            group(Subject)
            {
                field("Subject Name"; SystemCodeunit.GetRecordName('Subject', Rec."Subject ID"))
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
        SystemCodeunit: Codeunit SystemCodeunit;

}