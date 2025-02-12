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
                field("Student"; studentName)
                {
                    ApplicationArea = All;
                    TableRelation = Student;
                    trigger OnLookup(var Text: Text): Boolean

                    var
                        studentID: Integer;

                    begin
                        if SystemCodeunit.PerformLookup(Text, 'Student', studentID) then begin
                            if student.Get(studentID) then begin
                                Rec."Student ID" := student."Student ID";
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
                        SubjectID: Integer;

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
        SystemCodeunit: Codeunit SystemCodeunit;
        Enrollment: Record "Enrollment";
        Student: Record Student;
        Subject: Record Subject;
        SubjectName: Text[100];
        StudentName: Text[100];

    trigger OnAfterGetRecord()
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