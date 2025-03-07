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
                            Message('Please select the professor first');
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
        ProfessorName := '';
        SubjectName := '';
    end;
}