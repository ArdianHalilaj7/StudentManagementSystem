page 50218 "My Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'My Custom Role Center';
    layout
    {
     
    }
    

    actions
    {
        area(Processing)
        {
        group(Students)
        {
            Caption = 'Students';
            action(OpenStudentPage)
            {
                Caption = 'Student';
                ApplicationArea = All;
                RunObject = Page 50201;
            }
            action(OpenEnrollmentsPage)
            {
                Caption = 'Enrollments';
                ApplicationArea = All;
                RunObject = Page 50208;
            }
        }
        group(Professors)
        {
            Caption = 'Professors';
            action(OpenProfessorPage)
            {
                Caption = 'Professor';
                ApplicationArea = All;
                RunObject = Page 50204;
            }
            action(OpenProfessorCourses)
            {
                Caption = 'Professor''s Course List';
                ApplicationArea = All;
                RunObject = Page 50210;
            }
        }
        group(Subjects)
        {
            Caption = 'Subjects';
            action(OpenSubjectsPage)
            {
                Caption = 'Subjects';
                ApplicationArea = All;
                RunObject = Page 50206;
            }
            action(OpenSubjectCourses)
            {
                Caption = 'Subject''s Course List';
                ApplicationArea = All;
                RunObject = Page 50213;
            }
        }
        }
    }
}


