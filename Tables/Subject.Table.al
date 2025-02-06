table 50203 Subject
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Subject ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }

        field(20; "Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }

        field(30; "Credits"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(40; "Description"; Text[500])
        {
            DataClassification = ToBeClassified;
        }

        field(50; "Department"; Enum FieldStudy)
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