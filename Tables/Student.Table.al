table 50201 "Student"
{
    Caption = 'Student';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Student ID"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Student ID';
            
        }
        field(20; "First Name"; Text[50])
        {
            Caption = 'First Name';
                        trigger OnValidate()
            var
                lastChar: Text[50];
            begin
                if "First Name" <> '' then begin
                    // Get the last character of the name
                    lastChar := CopyStr("First Name", StrLen("First Name"), 1);
                    // Determine gender based on the last character
                    case lastChar of
                        'i', 'I':
                            gender := Gender::Mashkull;
                        'a', 'A':
                            Gender := Gender::Femer;
                        else
                            Gender := Gender::" ";
                    end;
                end else
                    Gender := Gender::" ";

                    // Check if Emri contains 'ë' 
                    if StrPos("First Name", 'ë') > 0 then 
                    Message('Emri: %1 ka shkronjen "ë" dhe eshte %2', Rec."First Name", Rec.Gender);
            end;
        }
        field(30; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
        }
        field(31; Gender; Enum Gender)
        {
            Caption = 'Gender';
            DataClassification = ToBeClassified;
        }
        // field(40; "Date of Birth"; Date)
        // {
        //     Caption = 'Date of Birth';
        // }
        field(40; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
            trigger OnValidate()
            begin
                CalculateAge();
            end;
        }

        field(41; Age; Integer)
        {
            Caption = 'Age';
            DataClassification = ToBeClassified;

        }
        
        field(50; "Email"; Text[100])
        {
            Caption = 'Email';
        }
        field(60; "Phone Number"; Text[14])
        {
            Caption = 'Phone Number';
            trigger OnValidate()
            var
                prefix: Text[14];
            begin
                prefix := '+383';
                Rec."Phone Number" := prefix + ' ' + Rec."Phone Number";

            end;
        }
        field(70; "Status"; Option)
        {
            OptionMembers = " ",Active,Inactive,Graduated;
            Caption = 'Status';
        }

         field(80; "Course of Study/Program"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(90; "Year of Study"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Student ID") { Clustered = true; }
    }

    local procedure CalculateAge()
var
    TodayDate: Date;
    BirthYear, CurrentYear: Integer;
    BirthMonth, CurrentMonth: Integer;
    BirthDay, CurrentDay: Integer;
begin
    TodayDate := Today;
    
    BirthYear := Date2DMY("Date of Birth", 3);
    BirthMonth := Date2DMY("Date of Birth", 2);
    BirthDay := Date2DMY("Date of Birth", 1);

    CurrentYear := Date2DMY(TodayDate, 3);
    CurrentMonth := Date2DMY(TodayDate, 2);
    CurrentDay := Date2DMY(TodayDate, 1);

    // Calculate Age
    Age := CurrentYear - BirthYear;

    // Adjust if birthday hasn't occurred yet this year
    if (CurrentMonth < BirthMonth) or ((CurrentMonth = BirthMonth) and (CurrentDay < BirthDay)) then
        Age := Age - 1;
end;

}
