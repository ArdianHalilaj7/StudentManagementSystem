table 50202 Profesori
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Profesori_ID; Integer)
        {
            DataClassification = ToBeClassified;

        }

    }

    keys
    {
        key(PK; Profesori_ID)
        {
            Clustered = true;
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