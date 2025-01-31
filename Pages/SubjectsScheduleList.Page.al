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
                    DrillDown = true;
 
                    trigger OnDrillDown()
 
                    begin
                        if subjectsSchedule.Get(Rec."Schedule ID") then begin
                            Page.Run(Page::"Subjects' Schedule", subjectsSchedule);
                        end;
                    end;
                }
                field("Subject ID"; Rec."Subject ID")
                {
                    ApplicationArea = All;
                    TableRelation = Subject;
 
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(systemCodeunit.PerformLookup(Text, 'Subject'));
                    end;
                }
 
                field("Subject Name"; systemCodeunit.GetRecordName('Subject', Rec."Subject ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Professor ID"; Rec."Professor ID")
                {
                    ApplicationArea = All;
                    TableRelation = Professor;
 
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(systemCodeunit.PerformLookup(Text, 'Professor'));
                    end;
                }
 
                field("Professor Name"; systemCodeunit.GetRecordName('Professor', Rec."Professor ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
 
                field("Day(s)"; Rec."Day(s)")
                {
                    ApplicationArea = All;
                }
 
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                }
 
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
 
    var
        systemCodeunit: Codeunit SystemCodeunit;
        subjectsSchedule: Record "Subject Schedule";
 
}