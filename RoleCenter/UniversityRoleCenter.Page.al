page 50218 "University Role Center"
{
    ApplicationArea = All;
    Caption = 'University Role Center';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            group(Group1)
            {
                part(part1; RoleCenterHeadline)
                {

                    ApplicationArea = All;
                }
            }
            group(Information)
            {
                part("University Data"; "University Data Overview")
                {
                    ApplicationArea = All;
                }

                part("Active Students"; "Active Students")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Embedding)
        {


            action("Students")
            {
                ApplicationArea = All;
                RunObject = page "Students' List";
            }

            action("Professors")
            {
                ApplicationArea = All;
                RunObject = page "Professors' List";
            }

            action("Subjects")
            {
                ApplicationArea = All;
                RunObject = page "Subjects' List";
            }

            action("Enrollments")
            {
                ApplicationArea = All;
                RunObject = page "Enrollments' List";
            }
            action("Professors' Schedule")
            {
                ApplicationArea = All;
                RunObject = page "Professors' Schedule";
            }

            action("Subjects' Schedule")
            {
                ApplicationArea = All;
                RunObject = page "Subjects' Schedule";
            }
        }
        area(Creation)
        {
            action(Student)
            {
                ApplicationArea = All;
                RunObject = page "Student Card";
                RunPageMode = Create;
            }

            action(Professor)
            {
                ApplicationArea = All;
                RunObject = page "Professor Card";
                RunPageMode = Create;
            }

            action(Subject)
            {
                ApplicationArea = All;
                RunObject = page "Subject Card";
                RunPageMode = Create;
            }

            action(Enrollment)
            {
                ApplicationArea = All;
                RunObject = page "Enrollment Card";
                RunPageMode = Create;
            }

            action("Professor's Schedule")
            {
                ApplicationArea = All;
                RunObject = page "Professor Schedule";
                RunPageMode = Create;
            }

            action("Subject's Schedule")
            {
                ApplicationArea = All;
                RunObject = page "Subject Schedule";
                RunPageMode = Create;
            }
        }
    }
}
