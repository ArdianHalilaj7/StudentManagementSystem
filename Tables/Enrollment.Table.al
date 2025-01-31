table 50238 Enrollment
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Enrollment ID"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }

        field(20; "Student ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(30; "Subject ID"; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(40; "Enrollment Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; "Enrollment ID")
        {
            Clustered = true;
        }

        key("Student ID & Subject ID"; "Student ID", "Subject ID")
        {
            Clustered = false;
        }
    }



    // fieldgroups
    // {
    //     // Add changes to field groups here
    // }

    // var
    //     myInt: Integer;

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