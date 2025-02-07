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

                field("Enrollment ID";Rec."Enrollment ID")
                {
                    ApplicationArea = All;
                    //Visible = false;

                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        if enrollment.Get(Rec."Enrollment ID") then begin
                            Page.Run(Page :: "Enrollment Card", enrollment);
                        end;
                    end;
                }
                field("Student"; studentName)
                {
                    ApplicationArea = All;
                    TableRelation = Student;
                    trigger OnLookup(var Text: Text): Boolean

                    var
                        studentID: Integer;

                    begin
                        if systemCodeunit.PerformLookup(Text, 'Student', studentID) then begin
                            if student.Get(studentID) then begin
                                Rec."Student ID" := student."Student ID";
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

                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    var
        systemCodeunit: Codeunit SystemCodeunit;
        enrollment: Record "Enrollment";
        student: Record Student;
        subject: Record Subject;
        subjectName: Text[100];
        studentName: Text[100];

    trigger OnAfterGetRecord()
    begin
        studentName := systemCodeunit.GetRecordName('Student', Rec."Student ID");
        subjectName := systemCodeunit.GetRecordName('Subject', Rec."Subject ID");
    end;


}