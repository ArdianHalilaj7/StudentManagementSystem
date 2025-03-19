page 50211 "Professor Schedule"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Professor Schedule";

    layout
    {
        area(Content)
        {
            group(Professor)
            {
                field("Professor Name"; ProfessorName)
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Professor: Record Professor;
                        ProfessorID: Integer;
                        SystemCodeunit: Codeunit SystemCodeunit;
                    begin
                        if Page.RunModal(Page:: "Professors' List", Professor) = Action:: LookupOK then begin
                            Text := SystemCodeunit.GetRecordName('Professor', Professor."Professor ID");
                            if Professor.Get(Professor."Professor ID") then
                                Rec."Professor ID" := Professor."Professor ID";
                            exit(true);
                        end;
                    end;
                }
            }
            group(Subject)
            {
                field("Subject Name"; SubjectName)
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Subject: Record Subject;
                        SystemCodeunit: Codeunit SystemCodeunit;
                    begin
                        if Page.RunModal(Page:: "Subjects' List", Subject) = Action:: LookupOK then
                            Text := SystemCodeunit.GetRecordName('Subject', Subject."Subject ID");
                            if Subject.Get(Subject."Subject ID") then
                                Rec."Subject ID" := Subject."Subject ID";
                            exit(true);
                    end;
                }
            }
            group("Course Period")
            {
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        ProfessorName: Text[100];
        SubjectName: Text[100];

    trigger OnAfterGetRecord()
    var
        Professor: Record Professor;
        Subject: Record Subject;
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        if Professor.Get(Rec."Professor ID") then
            ProfessorName := SystemCodeunit.GetRecordName('Professor', Professor."Professor ID")
        else
            ProfessorName := '<Professor not found>';
        if Subject.Get(Rec."Subject ID") then
            SubjectName := SystemCodeunit.GetRecordName('Subject', Subject."Subject ID")
        else
            SubjectName := '<Subject not found>';
    end;
}