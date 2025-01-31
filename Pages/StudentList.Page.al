page 50201 "Students' List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentMS;
    Caption = 'Students';

    layout
    {
        area(Content)
        {
            repeater("Personal Information")
            {
                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()

                    begin
                        if student.Get(Rec."Student ID") then begin
                            Page.Run(Page::"Student Card", student);
                        end
                    end;
                }

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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field(Email; Rec.Email)
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
            // action(navigate_StudentDetails)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Student Details';
            //     Image = User;
            //     RunObject = page "Student Card";

            // }
        }
        area(Processing)
        {
            action(navigate_ProfessorList)
            {
                ApplicationArea = All;
                Caption = 'Professors';
                Image = Users;
                RunObject = page "Professors' List";
                Promoted = true;
            }
            action(navigate_SubjectList)
            {
                ApplicationArea = All;
                Caption = 'Subjects';
                Image = Note;
                RunObject = page "Subjects' List";
            }
            action(navigate_EnrollmentsList)
            {
                ApplicationArea = All;
                Caption = 'Enrollments';
                Image = Form;
                RunObject = page "Enrollments' List";
            }
            action(navigate_ProfessorsSchedule)
            {
                ApplicationArea = All;
                Caption = 'Professors'' Schedule';
                Image = AbsenceCalendar;
                RunObject = page "Professors' Schedule";
            }


            action(navigate_SubjectsSchedule)
            {
                ApplicationArea = All;
                Caption = 'Subjects'' Schedule';
                Image = Accounts;
                RunObject = page "Subjects' Schedule";
            }



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
        student: Record StudentMS;


}