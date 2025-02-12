page 50223 "Active Students"
{
    PageType = ListPart;
    SourceTable = Student;
    SourceTableView = where(Status = const(Active));

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Student"; studentName)
                {
                    ApplicationArea = All;
                }


                field("Department"; Rec."Department")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        SystemCodeunit: Codeunit SystemCodeunit;
        StudentName: Text[100];

    trigger OnAfterGetRecord()
    begin
        StudentName := SystemCodeunit.GetRecordName('Student', Rec."Student ID");
    end;

}