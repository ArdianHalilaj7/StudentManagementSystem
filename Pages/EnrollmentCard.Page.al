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
                field("Student Name"; systemCodeunit.GetRecordName('Student', Rec."Student ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(Subject)
            {
                field("Subject Name"; systemCodeunit.GetRecordName('Subject', Rec."Subject ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }


        }
    }

    var
        systemCodeunit: Codeunit SystemCodeunit;
        enrollment: Record Enrollment;
}