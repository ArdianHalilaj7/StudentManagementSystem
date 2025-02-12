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
                    Visible = false;


                }

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()

                    begin
                        if Professor.Get(rec."Professor ID") then begin
                            Page.Run(Page::"Professor Card", professor);
                        end;
                    end;

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
                   
                    trigger OnValidate()
                    var
                        SystemCodeUnit: Codeunit 50220;
                    begin
                        SystemCodeUnit.ValidatePhoneNumber(Rec."Phone Number");
                    end;
                }

                field(Email; Rec.Email)
                {
                    
                    trigger OnValidate()
                    var
                        SystemCodeUnit: Codeunit 50220;
                    begin
                        SystemCodeUnit.ValidateEmail(Rec.Email);
                    end;
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
                field("Office Hours"; Rec."Office Hours")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    var
        Professor: Record Professor;
        SystemCodeUnit: Codeunit 50220;
}