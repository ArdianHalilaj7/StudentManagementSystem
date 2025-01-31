table 50206 "Subject Schedule"
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
 
        field(40; "Day(s)"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
 
        field(50; "Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
 
        field(60; "End Time"; Time)
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
 
        key("ProfSubDateTime"; "Professor ID", "Subject ID", "Start Time")
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