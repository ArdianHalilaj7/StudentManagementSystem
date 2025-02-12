page 50206 "Subjects' List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Subject;

    layout
    {
        area(Content)
        {
            repeater("Subject Information")
            {
                field(SubjectID; Rec."Subject ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    
                    
                }

                field("Subject Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        if Subject.Get(Rec."Subject ID") then begin
                            Page.Run(Page:: "Subject Card" , Subject);
                        end;
                    end;
                    

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
        Subject: Record Subject;
}