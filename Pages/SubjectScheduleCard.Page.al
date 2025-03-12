page 50214 "Subject Schedule"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Subject Schedule";

    layout
    {
        area(Content)
        {
            group("Professor")
            {
                field("Professor Name"; GetFieldName(Rec, 'Professor'))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Subject")
            {
                field("Subject Name"; GetFieldName(Rec, 'Subject'))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Course Information")
            {
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                }

                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                }
                field("Day"; Rec."Day")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    procedure GetFieldName(SubjectSchedule: Record "Subject Schedule"; RecordType: Text): Text
    var
        Professor: Record "Professor";
        Subject: Record "Subject";
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        case
            RecordType of
            'Professor':
                if (Professor.Get(SubjectSchedule."Professor ID")) then
                    exit(SystemCodeunit.GetRecordName('Professor', Professor."Professor ID"))
                else
                    exit('<Professor not found>');
            'Subject':
                if (Subject.Get(SubjectSchedule."Subject ID")) then
                    exit(SystemCodeunit.GetRecordName('Subject', Subject."Subject ID"))
                else
                    exit('<Subject not found>');
        end;
    end;

}