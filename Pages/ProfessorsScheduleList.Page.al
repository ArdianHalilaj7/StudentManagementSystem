page 50210 "Professors' Schedule"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Professor Schedule";

    layout
    {
        area(Content)
        {
            repeater("Proffesors' Schedule")
            {

                field("Schedule ID"; Rec."Schedule ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        ProfessorSchedule: Record "Professor Schedule";
                    begin
                        if ProfessorSchedule.Get(Rec."Schedule ID") then begin
                            Page.Run(Page::"Professor Schedule", ProfessorSchedule);
                        end;
                    end;
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}