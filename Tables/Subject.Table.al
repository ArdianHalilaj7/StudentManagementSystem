table 50137 Subject
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Subject ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }

        field(2; "Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Credits"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Description"; Text[500])
        {
            DataClassification = ToBeClassified;
        }

        field(5; "Department"; Text[100])
        {
            DataClassification = ToBeClassified;

        }

    }

    keys
    {
        key("PK"; "Subject ID"){ Clustered = true;}
        
            
        
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