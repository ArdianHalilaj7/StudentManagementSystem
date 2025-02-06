table 50206 "Subject Schedule"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(10; "Schedule ID"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }

        field(20; "Professor ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(30; "Subject ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(40; "Day(s)"; Option)
        {
            OptionMembers = Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday;
        }

        field(50; "Start Time"; enum SubjectScheduleStartTime)
        {
            DataClassification = ToBeClassified;
        }

        field(60; "End Time"; enum SubjectScheduleEndTime)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Schedule ID")
        {
            Clustered = true;
        }

        key("ProfSubDateTime"; "Professor ID", "Subject ID", "Start Time")
        {
            Clustered = false;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}