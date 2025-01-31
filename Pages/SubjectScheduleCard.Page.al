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
            field("Schedule ID"; Rec."Schedule ID")
            {
                ApplicationArea = All;
            }
            group("Professor")
            {
                field("Professor ID"; Rec."Professor ID")
                {
                    ApplicationArea = All;
                }
 
                field("Professor Name"; systemCodeunit.GetRecordName('Professor', Rec."Professor ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
 
            }
            group("Subject")
            {
 
                field("Subject ID"; Rec."Subject ID")
                {
                    ApplicationArea = All;
                }
 
                field("Subject Name"; systemCodeunit.GetRecordName('Subject', Rec."Subject ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Class Information")
            {
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                }
 
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                }
                field("Day(s)"; Rec."Day(s)")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
 
    var
        systemCodeunit: Codeunit SystemCodeunit;
}