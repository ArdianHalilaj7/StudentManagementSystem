table 50202 Professor
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Professor ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;

        }

        field(2; "First Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(3; "Last Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(4; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;

        }

        field(5; "Email"; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(6; "Phone Number"; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(7; "Department"; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(8; "Position/Title"; Text[100])
        {
            DataClassification = ToBeClassified;

        }


        field(9; "Office Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(10; "Office Hours"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Profesor ID") { Clustered = true;}
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