page 50201 "Student List"
{
    PageType = List;
    SourceTable = "Student";
    ApplicationArea = All;
    Caption = 'Students List';
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Enroll Student")
            {
                ApplicationArea = All;
                // RunObject = Page 50101;  
            }
            // action("Shfaq Mesazhin")
            // {
            //     trigger OnAction()
            //     begin
            //         Message('Mesazhi u shfaq');
            //     end;
            // }
        }
    }
}
