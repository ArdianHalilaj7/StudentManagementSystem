page 50200 LogActionPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ActivityLog;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(LogId;Rec.LogId)
                {
                    ApplicationArea = All;
                }
                field(Action;Rec.Action)
                {
                    ApplicationArea = All;

                }

                field(AXSTimeStamp;Rec.AXSTimeStamp)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Priority;Rec.Priority)
                {
                    ApplicationArea =All;
                    Editable = false;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(invoke_ManualSubscriber)
            {
                Caption = 'Invoke Manual Subscriber';
                
                trigger OnAction()
                var
                    LogPublisher: Codeunit LogPublisher;
                    ManualSubscriber: Codeunit ManualSubscriber;
                
                begin
                    BindSubscription(ManualSubscriber);
                    LogPublisher.ManualPublishOnLogAction2(Rec.Action, Rec.Priority);
                end;
            }

            action(invoke_AutomaticSubscriber)
            {
                Caption = 'Invoke Automatic Subscriber';
                trigger OnAction()
                var LogPublisher: Codeunit LogPublisher;
                
                begin
                    LogPublisher.AutomaticPublishOnLogAction2(Rec.Action, Rec.Priority);
                end;
            }
        }
    }
    
}