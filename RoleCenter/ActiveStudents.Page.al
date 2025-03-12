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
                field("Student"; GetStudentName())
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
    local procedure GetStudentName(): Text
    var
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        if Rec.Get(Rec."Student ID")  then
            exit(SystemCodeunit.GetRecordName('Student', Rec."Student ID"))
        else
            exit('<Student not found>');
    end;
}