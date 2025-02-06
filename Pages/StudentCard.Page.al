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
                /* field("Student ID"; Rec."Student ID")
                 {
                     ApplicationArea = All;
                 }*/

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
                field("Field of Study"; Rec."Field of Study")
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
                    systemCodeunit.ShowRelatedRecords('Student', Rec."Student ID");
                end;
            }
        }
    }

    var
        systemCodeunit : Codeunit SystemCodeunit;
}