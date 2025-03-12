tableextension 50202 SubjectScheduleExt extends "Subject Schedule"
{
    fields
    {
        field(50200; "Professor Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Professor."First Name" where("Professor ID" = field("Professor ID")));
        }

        field(50201; "Professor Last Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Professor."Last Name" where("Professor ID" = field("Professor ID")));
        }
        field(50202; Subject; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Subject."Name" where("Subject ID" = field("Subject ID")));
        }
    }
    
}