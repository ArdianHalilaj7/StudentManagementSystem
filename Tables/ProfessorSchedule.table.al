table 50239 "Professor Schedule"
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
 
        field(40; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
 
        }
 
        field(50; "End Date"; Date)
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