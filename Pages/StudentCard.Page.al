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

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("Course of Study/Program"; Rec."Course of Study/Program")
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
            // action(navigate_ProfessorList)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Professors';
            //     Image = Users;
            //     RunObject = page "Professors'' List";
            // }
            // action(navigate_ProfessorSchedule)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Professors'' Schedule';
            //     Image = Addresses;
            //     RunObject = page "Professors'' Schedule";
            // }
            // action(navigate_SubjectList)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Subjects';
            //     Image = Note;
            //     RunObject = page "Subject List";
            // }

            // action(navigate_EnrollmentList)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Enrollments';
            //     Image = Form;
            //     RunObject = page "Enrollment List";
            // }

            // action(navigate_EnrollmentCard)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Enrollments'' Details';
            //     Image = Form;
            //     RunObject = page "Enrollment Card";
            // }

        }
    }

    var
        myInt: Integer;
}