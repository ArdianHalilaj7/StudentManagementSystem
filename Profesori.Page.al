page 50202 "Profesori Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Profesori;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Profesori_ID;Rec.Profesori_ID)
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