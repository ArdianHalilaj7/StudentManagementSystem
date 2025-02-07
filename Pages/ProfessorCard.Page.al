page 50205 "Professor Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Professor;

    layout
    {
        area(Content)
        {
            group("Personal Information")
            {

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }

                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }

                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                }

                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = All;
                }
            }

            group("University Information")
            {
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field("Position/Title"; Rec."Position/Title")
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }



                field("Office Address"; Rec."Office Address")
                {
                    ApplicationArea = All;
                }

                field("Office Hours"; Rec."Office Hours")
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
            action(open_ProfessorCourses)
            {
                ApplicationArea = All;
                Caption = 'Professor''s Course List';
                Image = View;
                trigger OnAction()
                begin
                    systemCodeunit.ShowRelatedRecords('Professor', Rec."Professor ID");
                end;

            }
        }
    }
    var
        systemCodeunit: Codeunit SystemCodeunit;
}