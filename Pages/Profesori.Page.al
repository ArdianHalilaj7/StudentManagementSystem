page 50202 "Profesori Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Professor;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Professor ID";Rec."Professor ID")
                {
                    
                }
                field("First Name";Rec."First Name")
                {

                }
                field("Last Name";Rec."Last Name")
                {

                }
                field(Subject;Rec.Subject)
                {
                    
                }
                field("Date of Birth";Rec."Date of Birth")
                {

                }
                field(Email;Rec.Email)
                {

                }
                field("Phone Number";Rec."Phone Number")
                {

                }
                field(Department;Rec.Department)
                {

                }
                field("Position/Title";Rec."Position/Title")
                {

                }
                field("Office Address";Rec."Office Address")
                {

                }
                field("Office Hours";Rec."Office Hours")
                {

                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}