tableextension 50200 EnrollmentExt extends Enrollment
{
    fields
    {
        field(50200; "Student Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Student."First Name" where("Student ID" = field("Student ID")));
        }

        field(50201; "Student Last Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Student."Last Name" where("Student ID" = field("Student ID")));
        }
        field(50202; Subject; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Subject."Name" where("Subject ID" = field("Subject ID")));
        }
    }
}