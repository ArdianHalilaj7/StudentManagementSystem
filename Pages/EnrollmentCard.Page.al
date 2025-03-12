page 50209 "Enrollment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Enrollment;

    layout
    {
        area(Content)
        {
            group("Enrollment Information")
            {
                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ApplicationArea = All;
                }
            }
            group(Student)
            {
                field("Student Name"; GetFieldName(Rec, 'Student'))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(Subject)
            {
                field("Subject Name"; GetFieldName(Rec, 'Subject'))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    // OPTION 1 - USING A LOCAL PROCEDURE WITH ENCAPSULATION (Functional Programming)
    procedure GetFieldName(Enrollment: Record "Enrollment"; RecordType: Text): Text
    var
        Student: Record "Student";
        Subject: Record "Subject";
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        case
            RecordType of
            'Student':
                if (Student.Get(Enrollment."Student ID")) then
                    exit(SystemCodeunit.GetRecordName('Student', Student."Student ID"))
                else
                    exit('<Student not found>');
            'Subject':
                if (Subject.Get(Enrollment."Subject ID")) then
                    exit(SystemCodeunit.GetRecordName('Subject', Subject."Subject ID"))
                else
                    exit('<Subject not found>');
        end;
    end;

    //OPTION 2 
    // local procedure GetStudentName(Enrollment: Record Enrollment): Text
    // var
    //     Student: Record "Student";
    //     SystemCodeunit: Codeunit SystemCodeunit;

    // begin
    //     if (Student.Get(Enrollment."Student ID")) then
    //         exit(SystemCodeunit.GetRecordName('Student'), Student."Student ID")
    //     else
    //         exit('<Student not found>');
    // end;

    // local procedure GetSubjectName(Enrollment: Record Enrollment): Text
    // var
    //     Subject: Record "Subject";
    //     SystemCodeunit: Codeunit SystemCodeunit;

    // begin
    //     if (Subject.Get(Enrollment."Subject ID")) then
    //         exit(SystemCodeunit.GetRecordName('Subject'))
    //     else
    //         exit('<Subject not found>');
    // end;

    // //OPTION 3 - USING THE TRIGGER FOR BETTER PERFORMANCE
    // var
    //     StudentName: Text[100];
    //     SubjectName: Text[100];

    // trigger OnAfterGetRecord()
    // var
    //     Student: Record Student;
    //     Subject: Record Subject;
    //     SystemCodeunit: Codeunit SystemCodeunit;
    // begin
    //     if Student.Get(Rec."Student ID") then
    //         StudentName := SystemCodeunit.GetRecordName('Student')
    //     else
    //         StudentName := '<Student not found>';
    //     if Subject.Get(Rec."Subject ID") then
    //         SubjectName := SystemCodeunit.GetRecordName('Subject')
    //     else
    //         SubjectName := '<Subject not found>';
    // end;

    //Option 4 - USING FLOWFIELDS

}