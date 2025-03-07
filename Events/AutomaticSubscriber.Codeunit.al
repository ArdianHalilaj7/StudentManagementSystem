codeunit 50202 AutomaticSubscriber
{

    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::LogPublisher, AutomaticOnLogAction2, '', false, false)]
    procedure HandleAutomaticLogAction(Action: Text[50]; AXSTimeStamp: DateTime; var Priority: Integer)
    var
        ALoggedActionsRec: Record ActivityLog;
    begin
        if Action = 'High' then
            Priority := 100
        else if Action = 'Low' then
            Priority := 1
        else
            Priority := 50;
        ALoggedActionsRec.Init();
        ALoggedActionsRec.Action := 'Automatic Subscriber: ' + Action;
        ALoggedActionsRec.AXSTimeStamp := CurrentDateTime;
        ALoggedActionsRec.Priority := Priority;
        ALoggedActionsRec.Insert();
    end;

}