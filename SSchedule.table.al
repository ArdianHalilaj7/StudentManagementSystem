table 50240 "Subject Schedule"
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
 
        field(4; "Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
 
        field(5; "Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
 
        field(6; "End Time"; Time)
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
 
        key("ProfSubDateTime"; "Professor ID", "Subject ID", "Date", "Start Time")
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