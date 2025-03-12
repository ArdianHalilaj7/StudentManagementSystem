page 50213 "Subjects' Schedule"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Subject Schedule";

    layout
    {
        area(Content)
        {
            repeater("Subject Schedule")
            {
                field("Schedule ID"; Rec."Schedule ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                
                field("Day"; Rec."Day")
                {
                    ApplicationArea = All;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        SubjectSchedule: Record "Subject Schedule";
                    begin
                        if SubjectSchedule.Get(Rec."Schedule ID") then begin
                            Page.Run(Page::"Subject Schedule", SubjectSchedule);
                        end;
                    end;
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}