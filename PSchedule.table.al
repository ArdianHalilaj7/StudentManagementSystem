table 50239 "Professor Schedule"
{
    DataClassification = ToBeClassified;
 
    fields
    {
        field(1; "Schedule ID"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
 
        }
 
        field(2; "Professor ID"; Integer)
        {
            DataClassification = ToBeClassified;
 
        }
 
        field(3; "Subject ID"; Integer)
        {
            DataClassification = ToBeClassified;
 
        }
 
        field(4; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
 
        }
 
        field(5; "End Date"; Date)
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
 
        key("Professor ID & Subject ID"; "Professor ID", "Subject ID")
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