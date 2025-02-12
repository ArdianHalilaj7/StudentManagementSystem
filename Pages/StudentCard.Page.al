page 50203 "Student Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Student;
    Caption = 'Student Card';

    layout
    {
        area(Content)
        {
            group("Personal Information")
            {
                

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }

                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }

                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                }

                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = All;
                }

            }

            group("University Information")
            {
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field("Degree Level"; Rec."Degree Level")
                {
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Department"; Rec."Department")
                {
                    ApplicationArea = All;
                }
                field("Year of Study"; Rec."Year of Study")
                {
                    ApplicationArea = All;
                }
            }
        }

    }
    actions
    {
        area(Navigation)
        {
            action(open_StudentEnrollments)
            {
                ApplicationArea = All;
                Caption = 'Student Enrollments in Subjects';
                Image = View;
                trigger OnAction()
                begin
                    SystemCodeunit.ShowRelatedRecords('Student', Rec."Student ID");
                end;
            }
        }
    }

    var
        SystemCodeunit: Codeunit SystemCodeunit;
}