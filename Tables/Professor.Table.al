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
            trigger OnValidate()
            begin
                
            end;

        }

       field(60; "Phone Number"; Text[14])
        {
            Caption = 'Phone Number';
            trigger OnValidate()
            // var
            //     prefix: Text[14];
             begin
            //     prefix := '+383';
            //     Rec."Phone Number" := prefix + ' ' + Rec."Phone Number";

             end;
        }

        field(70; "Department"; enum Department)
        {
            DataClassification = ToBeClassified;

        }

        field(80; "Position/Title"; Enum ProfessorTitle)
        {
            DataClassification = ToBeClassified;

        }


        field(90; "Office Address"; enum ProfessorAddress)
        {
            DataClassification = ToBeClassified;
        }

        field(100; "Office Hours"; enum ProfessorWorkingHours)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Professor ID") { Clustered = true;}
    }

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