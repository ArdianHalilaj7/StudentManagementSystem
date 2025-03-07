codeunit 50201 EmailSubscriber
{

    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::EmailPublisher, OnEmailChanged, '', true, true)]
    local procedure OnEmailChanged(Email: Text)

    var
        atPos: Integer;
        dotPos: Integer;
    begin
        atPos := StrPos(Email, '@');
        dotPos := StrPos(Email, '.');

        if (atPos = 0) or (dotPos = 0) or (dotPos < atPos) then
            Error('Invalid email format. Please enter a valid email address (e.g., user@example.com).');
    end;

}