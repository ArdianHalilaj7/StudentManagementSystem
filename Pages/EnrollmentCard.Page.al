page 50209 "Enrollment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Enrollment;

    layout
    {
        area(Content)
        {
            group("Enrollment Information")
            {
                field("Enrollment ID"; Rec."Enrollment ID")
                {
                    ApplicationArea = All;
                    /* DrillDown = true;
 
                     trigger OnDrillDown()
 
                     begin
                         if enrollment.Get(Rec."Enrollment ID") then begin
                             Page.Run(Page::"Enrollment Card", enrollment);
                         end
                     end;*/
                }
                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ApplicationArea = All;
                }


            }
            group(Student)
            {

                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                    /* TableRelation = StudentMS;
 
                     trigger OnLookup(var Text: Text): Boolean
                     begin
                         exit(systemCodeunit.PerformLookup(Text, 'Student'));
                    end;*/
                }

                field("Student Name"; systemCodeunit.GetRecordName('Student', Rec."Student ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(Subject)
            {
                field("Subject ID"; Rec."Subject ID")
                {
                    ApplicationArea = All;
                    /* TableRelation = SubjectMS; // TableRelation to Subject table

                     trigger OnLookup(var Text: Text): Boolean
                     begin
                         exit(systemCodeunit.PerformLookup(Text, 'Subject'));
                     end;*/
                }

                field("Subject Name"; systemCodeunit.GetRecordName('Subject', Rec."Subject ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }


        }
    }

    var
        systemCodeunit: Codeunit SystemCodeunit;
        enrollment: Record Enrollment;
}