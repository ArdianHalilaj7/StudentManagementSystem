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

                field("Professor"; professorName)
                {
                    ApplicationArea = All;
                    TableRelation = Professor;

                    trigger OnLookup(var Text: Text): Boolean

                    var
                        professorID: Integer;

                    begin

                        if systemCodeunit.PerformLookup(Text, 'Professor', professorID) then begin
                            if professor.Get(professorID) then begin
                                Rec."Professor ID" := professorID;
                            end;
                            exit(true);
                        end;
                    end;
                }


                field("Subject"; subjectName)
                {
                    ApplicationArea = All;
                    TableRelation = Subject;
                    trigger OnLookup(var Text: Text): Boolean

                    var
                        subjectID: Integer;


                    begin
                        //If the subject is selected before the professor
                        if Rec."Professor ID" = 0 then begin
                            Message('Select the professor first.');
                            exit(false);
                        end;
                        if systemCodeunit.PerformLookup(Text, 'Subject', subjectID) then begin
                            if subject.Get(subjectID) then begin
                                Rec."Subject ID" := subject."Subject ID";


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
                    begin
                        if professorSchedule.Get(Rec."Schedule ID") then begin
                            Page.Run(Page::"Professor Schedule", professorSchedule);
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
        systemCodeunit: Codeunit SystemCodeunit;
        professorSchedule: Record "Professor Schedule";
        professor: Record Professor;
        subject: Record Subject;
        subjectName: Text[100];
        professorName: Text[100];

    trigger OnAfterGetRecord()
    begin
        professorName := systemCodeunit.GetRecordName('Professor', Rec."Professor ID");
        subjectName := systemCodeunit.GetRecordName('Subject', Rec."Subject ID");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Clear the professor and subject names when adding a new record
        professorName := '';
        subjectName := '';
    end;

}