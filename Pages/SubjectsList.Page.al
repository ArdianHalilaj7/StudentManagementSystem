page 50206 "Subjects' List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SubjectMS;

    layout
    {
        area(Content)
        {
            repeater("Subject Information")
            {
                field(SubjectID; Rec."Subject ID")
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        if subject.Get(Rec."Subject ID") then begin
                            Page.Run(Page:: "Subject Card" , subject);
                        end;
                    end;
                }

                field("Subject Name"; Rec."Name")
                {
                    ApplicationArea = All;

                }

                field(Credits; Rec.Credits)
                {
                    ApplicationArea = All;

                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }

                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }


            }
        }
    }



    var
        subject: Record SubjectMS;
}