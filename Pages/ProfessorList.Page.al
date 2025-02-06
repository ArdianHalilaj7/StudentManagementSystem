page 50204 "Professors' List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Professor;
 
    layout
    {
        area(Content)
        {
            repeater("Personal Information")
            {
 
                field("Professor ID"; Rec."Professor ID")
                {
                    ApplicationArea = All;
                    DrillDown = true;
 
                    trigger OnDrillDown()
 
                    begin
                        if professor.Get(rec."Professor ID") then begin
                            Page.Run(Page::"Professor Card", professor);
                        end;
                    end;
                }
 
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

                field(Email;Rec.Email)
                {
                    ApplicationArea = All;
                }

                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Position/Title"; Rec."Position/Title")
                {
                    ApplicationArea = All;
                }
                field("Office Address"; Rec."Office Address")
                {
                    ApplicationArea = All;
                }
                field("Office Hours";Rec."Office Hours")
                {
                    ApplicationArea = All;
                }
 
            }
        }
    }
 
    var
        professor: Record Professor;
}