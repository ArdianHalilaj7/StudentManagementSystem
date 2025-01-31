page 50207 "Subject Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SubjectMS;

    layout
    {
        area(Content)
        {
            group("Subject Information")
            {
                // field(SubjectID; Rec."Subject ID")
                // {
                //     ApplicationArea = All;

                // }

                field("Subject Name"; Rec."Name")
                {
                    ApplicationArea = All;

                }

                field(Credits; Rec.Credits)
                {
                    ApplicationArea = All;

                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }

                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}