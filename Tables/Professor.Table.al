table 50202 Professor
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Professor ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;

        }

        field(20; "First Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(30; "Last Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }


        field(40; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;

        }

        field(50; "Email"; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(60; "Phone Number"; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(70; "Department"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Acting,Architecture,"Electronic Engineering","Computer Science",Law,Physics,Sports;

        }

        field(80; "Position/Title"; Enum ProfessorTitle)
        {
            DataClassification = ToBeClassified;

        }


        field(90; "Office Address"; enum ProfessorAddress)
        {
            DataClassification = ToBeClassified;
        }

        field(100; "Office Hours"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Professor ID") { Clustered = true; }
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