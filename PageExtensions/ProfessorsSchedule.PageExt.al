pageextension 50201 ProfessorScheduleExt extends "Professors' Schedule"
{
    layout
    {
        addfirst("Proffesors' Schedule")
        {
            field("Professor Name"; Rec."Professor Name")
            {
                ApplicationArea = All;
                TableRelation = Professor."First Name";
                trigger OnLookup(var Text: Text): Boolean
                var
                    Professor: Record Professor;
                    ProfessorID: Integer;
                    SystemCodeunit: Codeunit SystemCodeunit;
                begin
                    if SystemCodeunit.PerformLookup(Text, 'Professor', ProfessorID) then begin
                        if Professor.Get(ProfessorID) then begin
                            Rec."Professor ID" := ProfessorID;
                            Rec."Professor Name" := Text;
                            Rec."Professor Last Name" := Professor."Last Name";
                        end;
                        exit(true);
                    end;
                end;
            }

            field("Professor Last Name"; Rec."Professor Last Name")
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