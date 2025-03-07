codeunit 50203 ManualSubscriber
{

    EventSubscriberInstance = Manual;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::LogPublisher, ManualOnLogAction2 , '', false, false)]
    procedure HandleManualLogAction(Action: Text[50]; AXSTimeStamp: DateTime;var Priority: Integer)
    var
        MLoggedActionsRec: Record ActivityLog;
    begin
        if Action = 'High' then
            Priority := 100
        else if Action = 'Low' then
            Priority := 1
        else if Action = 'Urgent' then
            Priority := 1000
        else 
            Priority := 50;
        MLoggedActionsRec.Init();        
        MLoggedActionsRec.Action := 'Manual Subscriber: ' + Action;
        MLoggedActionsRec.AXSTimeStamp := CurrentDateTime;
        MLoggedActionsRec.Priority := Priority;
        MLoggedActionsRec.Insert();        
    end;

}