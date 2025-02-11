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

                    ApplicationArea = All;
                    DrillDownPageId = "Students' List";
                    trigger OnDrillDown()
                    var
                        StudentsListPage: Page "Students' List";
                    begin
                        StudentsListPage.RunModal();
                    end;
                }

                field("No. of Professors"; ProfessorsCount)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Professors' List";
                    trigger OnDrillDown()
                    var
                        ProfessorsListPage: Page "Professors' List";
                    begin
                        ProfessorsListPage.RunModal();
                    end;
                }
                field("No. of Subjects"; SubjectsCount)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Subjects' List";
                    trigger OnDrillDown()
                    var
                        SubjectsListPage: Page "Subjects' List";
                    begin
                        SubjectsListPage.RunModal();
                    end;
                }
            }

        }
    }

    trigger OnOpenPage()
    var
        SystemCodeunit: Codeunit SystemCodeunit;
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