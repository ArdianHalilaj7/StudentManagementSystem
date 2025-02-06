page 50207 "Subject Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Subject;

    layout
    {
        area(Content)
        {
            group("Subject Information")
            {
                /* field(SubjectID; Rec."Subject ID")
                {
                     ApplicationArea = All;

                 }*/

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
        area(Navigation)
        {
            action(see_Students_Enrolled)
            {
                ApplicationArea = All;
                Caption = 'Students Enrolled';
                Image = View;
                trigger OnAction()
                
                begin
                    systemCodeunit.ShowRelatedRecords('Subject', Rec."Subject ID");
                end;

            }
        }
    }
    var
        systemCodeunit: Codeunit SystemCodeunit;
}