page 50211 "Professor Schedule"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Professor Schedule";

    layout
    {
        area(Content)
        {
            group(Professor)
            {
                field("Professor Name"; GetFieldName(Rec, 'Professor'))
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
            group(Subject)
            {
                field("Subject Name"; GetFieldName(Rec, 'Subject'))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Course Period")
            {
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    procedure GetFieldName(ProfessorSchedule: Record "Professor Schedule"; RecordType: Text): Text
    var
        Professor: Record "Professor";
        Subject: Record "Subject";
        SystemCodeunit: Codeunit SystemCodeunit;
    begin
        case
            RecordType of
            'Professor':
                if (Professor.Get(ProfessorSchedule."Professor ID")) then
                    exit(SystemCodeunit.GetRecordName('Professor', Professor."Professor ID"))
                else
                    exit('<Professor not found>');
            'Subject':
                if (Subject.Get(ProfessorSchedule."Subject ID")) then
                    exit(SystemCodeunit.GetRecordName('Subject', Subject."Subject ID"))
                else
                    exit('<Subject not found>');
        end;
    end;
}