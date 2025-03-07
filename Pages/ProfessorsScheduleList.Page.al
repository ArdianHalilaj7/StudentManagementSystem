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

                field("Professor"; ProfessorName)
                {
                    ApplicationArea = All;
                    TableRelation = Professor;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Professor: Record Professor;
                        ProfessorID: Integer;
                        SystemCodeunit: Codeunit SystemCodeunit;
                    begin
                        if SystemCodeunit.PerformLookup(Text, 'Professor', ProfessorID) then begin
                            if Professor.Get(ProfessorID) then begin
                                Rec."Professor ID" := ProfessorID;
                            end;
                            exit(true);
                        end;
                    end;
                }


                field("Subject"; SubjectName)
                {
                    ApplicationArea = All;
                    TableRelation = Subject;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Subject: Record Subject;
                        SubjectID: Integer;
                        SystemCodeunit: Codeunit SystemCodeunit;
                    begin
                        //If the Subject is selected before the Professor
                        if Rec."Professor ID" = 0 then begin
                            Message('Please select the professor first.');
                            exit(false);
                        end;
                        if SystemCodeunit.PerformLookup(Text, 'Subject', SubjectID) then begin
                            if Subject.Get(SubjectID) then begin
                                Rec."Subject ID" := Subject."Subject ID";
                            end;
                            exit(true);
                        end;
                    end;
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

    var
        SubjectName: Text[100];
        ProfessorName: Text[100];

    trigger OnAfterGetRecord()
    var
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        ProfessorName := SystemCodeunit.GetRecordName('Professor', Rec."Professor ID");
        SubjectName := SystemCodeunit.GetRecordName('Subject', Rec."Subject ID");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Clear the Professor and Subject names when adding a new record
        ProfessorName := '';
        SubjectName := '';
    end;

}