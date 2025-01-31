page 50210 "Professors' Schedule"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Professors' Schedule";

    layout
    {
        area(Content)
        {
            repeater("Proffesors' Schedule")
            {
                field("Schedule ID"; Rec."Schedule ID")
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()

                    begin
                        if professorsSchedule.Get(Rec."Schedule ID") then begin
                            Page.Run(Page::"Professor Schedule", professorsSchedule);
                        end;
                    end;
                }


                field("Professor ID"; Rec."Professor ID")
                {
                    ApplicationArea = All;
                    TableRelation = ProfessorMS;

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

                field("Subject ID"; Rec."Subject ID")
                {
                    ApplicationArea = All;
                    TableRelation = SubjectMS;

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

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    var
        systemCodeunit: Codeunit SystemCodeunit;
        professorsSchedule: Record "Professors' Schedule";

}