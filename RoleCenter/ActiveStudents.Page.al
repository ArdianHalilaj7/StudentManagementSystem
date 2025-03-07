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
                field("Student"; StudentName)
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
        StudentName: Text[100];
    trigger OnAfterGetRecord()
    var
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        StudentName := SystemCodeunit.GetRecordName('Student', Rec."Student ID");
    end;
}