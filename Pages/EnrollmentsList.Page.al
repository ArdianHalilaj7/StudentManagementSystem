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
                field("Student"; StudentName)
                {
                    ApplicationArea = All;
                    TableRelation = Student;
                    trigger OnLookup(var Text: Text): Boolean

                    var
                        Student: Record Student;
                        StudentID: Integer;
                        SystemCodeunit: Codeunit SystemCodeunit;
                    begin
                        if SystemCodeunit.PerformLookup(Text, 'Student', StudentID) then begin
                            if Student.Get(studentID) then begin
                                Rec."Student ID" := Student."Student ID";
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
                        if SystemCodeunit.PerformLookup(Text, 'Subject', SubjectID) then begin
                            if Subject.Get(SubjectID) then begin
                                Rec."Subject ID" := Subject."Subject ID";


                            end;
                            exit(true);
                        end;
                    end;

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
    var
        StudentName: Text[100];
        SubjectName: Text[100];

    trigger OnAfterGetRecord()
    var
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        StudentName := SystemCodeunit.GetRecordName('Student', Rec."Student ID");
        SubjectName := SystemCodeunit.GetRecordName('Subject', Rec."Subject ID");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        StudentName := '';
        SubjectName := '';
    end;
}