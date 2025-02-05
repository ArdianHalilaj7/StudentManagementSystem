table 50201 "Student"
{
    Caption = 'Student';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Student ID"; Integer)
        {
            Caption = 'Student ID';
            AutoIncrement = true;

        }
        field(20; "First Name"; Text[50])
        {
            Caption = 'First Name';
        }
        field(30; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
        }
        field(40; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(50; "Email"; Text[100])
        {
            Caption = 'Email';
        }
        field(60; "Phone Number"; Text[20])
        {
            Caption = 'Phone Number';
        }
        field(70; "Status"; Option)
        {
            OptionMembers = Active,Inactive,Graduated;
            Caption = 'Status';
        }

        field(80; "Degree Level"; enum DegreeLevel)
        {
            DataClassification = ToBeClassified;
        }

        field(90; "Field of Study"; Enum FieldStudy)
        {
            DataClassification = ToBeClassified;
        }

        field(100; "Year of Study"; enum StudentYearOfStudy)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Student ID") { Clustered = true; }
    }
}
