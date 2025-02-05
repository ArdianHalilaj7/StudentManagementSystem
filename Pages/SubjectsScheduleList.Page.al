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
                        if systemCodeunit.PerformLookup(Text, 'Subject', subjectID) then begin
                            if subject.Get(subjectID) then begin
                                Rec."Subject ID" := subject."Subject ID";


                            end;
                            exit(true);
                        end;
                    end;

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