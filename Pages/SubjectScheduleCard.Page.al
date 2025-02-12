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
                field("Professor Name"; SystemCodeunit.GetRecordName('Professor', Rec."Professor ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
            group("Subject")
            {
                field("Subject Name"; SystemCodeunit.GetRecordName('Subject', Rec."Subject ID"))
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
        SystemCodeunit: Codeunit SystemCodeunit;
}