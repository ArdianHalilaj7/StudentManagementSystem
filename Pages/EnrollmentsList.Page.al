page 50208 "Enrollments' List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Enrollment;
    layout
    {
        area(Content)
        {
            repeater("Enrollment Information")
            {
                field("Enrollment ID"; Rec."Enrollment ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        Enrollment: Record "Enrollment";
                    begin
                        if Enrollment.Get(Rec."Enrollment ID") then begin
                            Page.Run(Page::"Enrollment Card", Enrollment);
                        end;
                    end;
                }

            }
        }
    }
}