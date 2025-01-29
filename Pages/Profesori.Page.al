page 50202 "Profesori Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Professor;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Professor ID";Rec."Professor ID")
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