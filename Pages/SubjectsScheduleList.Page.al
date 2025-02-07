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
                field("Schedule ID";Rec."Schedule ID")
                {
                    ApplicationArea = All;
                    //Visible = false;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        if subjectSchedule.Get(Rec."Schedule ID") then begin
                            Page.Run(Page:: "Subject Schedule", subjectSchedule);
                        end;
                    end;
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

                field("Day"; Rec."Day")
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
        subjectSchedule: Record "Subject Schedule";
        student: Record Student;
        professor: Record Professor;
        subject: Record Subject;
        subjectName: Text[100];
        professorName: Text[100];

    trigger OnAfterGetRecord()
    begin
        professorName := systemCodeunit.GetRecordName('Professor', Rec."Professor ID");
        subjectName := systemCodeunit.GetRecordName('Subject', Rec."Subject ID");
    end;

}