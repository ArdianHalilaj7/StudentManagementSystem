pageextension 50200 EnrollmentExt extends "Enrollments' List"
{
    layout
    {
        addfirst("Enrollment Information")
        {
            field("Student Name"; Rec."Student Name")
            {
                ApplicationArea = All;
                TableRelation = Student."First Name";
                    trigger OnLookup(var Text: Text): Boolean

                    var
                        Student: Record Student;
                        StudentID: Integer;
                        SystemCodeunit: Codeunit SystemCodeunit;
                    begin
                        if SystemCodeunit.PerformLookup(Text, 'Student', StudentID) then begin
                            if Student.Get(StudentID) then begin
                                Rec."Student ID" := StudentID;
                                Rec."Student Name" := Text;
                                Rec."Student Last Name" := Student."Last Name";
                            end;
                            exit(true);
                        end;
                    end;
            }

            field("Student Last Name"; Rec."Student Last Name")
            {
                ApplicationArea = All;

            }
            field("Subject"; Rec."Subject")
            {
                ApplicationArea = All;
                TableRelation = Subject.Name;
                trigger OnLookup(var Text: Text): Boolean

                var
                    Subject: Record Subject;
                    SubjectID: Integer;
                    SystemCodeunit: Codeunit SystemCodeunit;

                begin
                    if SystemCodeunit.PerformLookup(Text, 'Subject', SubjectID) then begin
                        if Subject.Get(SubjectID) then begin
                            Rec."Subject ID" := SubjectID;
                            Rec.Subject := Subject.Name;
                        end;
                        exit(true);
                    end;
                end;
            }
        }
    }
}