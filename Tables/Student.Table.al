table 50201 "Student"
{
    Caption = 'Student';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Student ID"; Code[20])
        {
            Caption = 'Student ID';
        }
        field(2; "First Name"; Text[50])
        {
            Caption = 'First Name';
        }
        field(3; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
        }
        field(4; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(5; "Email"; Text[100])
        {
            Caption = 'Email';
        }
        field(6; "Phone Number"; Text[20])
        {
            Caption = 'Phone Number';
        }
        field(7; "Status"; Option)
        {
            OptionMembers = Active,Inactive,Graduated;
            Caption = 'Status';
        }

         field(8; "Course of Study/Program"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(9; "Year of Study"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Student ID") { Clustered = true; }
    }
}
