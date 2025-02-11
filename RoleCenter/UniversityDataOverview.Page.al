page 50221 "University Data Overview"
{
    PageType = CardPart;
    SourceTable = Student;

    layout
    {
        area(Content)
        {
            cuegroup(Overview)
            {
                field("No. of Students"; StudentsCount)
                {
                    DrillDown = true;
                    ApplicationArea = All;
                    DrillDownPageId = "Students' List";
                }

                field("No. of Professors"; ProfessorsCount)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Professors' List";
                }
                field("No. of Subjects"; SubjectsCount)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Subjects' List";
                }
            }

        }
    }

    trigger OnOpenPage()
    var
        SystemCodeunit : Codeunit SystemCodeunit;
    begin
        StudentsCount := SystemCodeunit.CalculateCount('Student');
        ProfessorsCount := SystemCodeunit.CalculateCount('Professor');
        SubjectsCount := SystemCodeunit.CalculateCount('Subject');
    end;

    var
        StudentsCount: Integer;
        ProfessorsCount: Integer;
        SubjectsCount: Integer;

}