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


        field(61; "Email"; Text[50])
        {
            Caption = 'Email';
            trigger OnValidate()
            var
                atPos: Integer;
                dotPos: Integer;
            begin

                atPos := StrPos(Rec."Email", '@');
                dotPos := StrPos(Rec."Email", '.');

                if (atPos = 0) or (dotPos = 0) or (dotPos < atPos) then
                    Error('Invalid email format. Please enter a valid email address (e.g., user@example.com).');
            end;
        }

        field(60; "Phone Number"; Text[14])
        {
            Caption = 'Phone Number';
            trigger OnValidate()
            begin
                ValidatePhoneNumber(Rec."Phone Number");
            end;

        }
        field(70; "Status"; Option)
        {
            OptionMembers = " ",Active,Inactive,Graduated;
            Caption = 'Status';
        }

        field(80; "Degree Level"; enum DegreeLevel)
        {
            DataClassification = ToBeClassified;
        }

        field(90; "Department"; Enum Department)
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

    local procedure CalculateAge()
    var
        TodayDate: Date;
        BirthYear, CurrentYear : Integer;
        BirthMonth, CurrentMonth : Integer;
        BirthDay, CurrentDay : Integer;
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

    local procedure ValidatePhoneNumber(var PhoneNumber: Text[14])
    var
        prefix: Text[4];
        //phoneNumber: Text[14];
        validPrefixes: array[5] of Text[2];
        areaCode: Text[2];
        isValid: Boolean;
        i: Integer;
    begin
        prefix := '+383';


        if CopyStr(PhoneNumber, 1, 5) = '00383' then
            PhoneNumber := CopyStr(PhoneNumber, 6)
        else if CopyStr(PhoneNumber, 1, 4) = '+383' then
            PhoneNumber := CopyStr(PhoneNumber, 5)
        else if CopyStr(PhoneNumber, 1, 3) = '383' then
            PhoneNumber := CopyStr(PhoneNumber, 4)
        else if CopyStr(phoneNumber, 1, 1) = '0' then
            PhoneNumber := CopyStr(PhoneNumber, 2)
        else
            Error('Invalid phone number. Must start with 00383, +383, or 0');
        validPrefixes[1] := '44';
        validPrefixes[2] := '45';
        validPrefixes[3] := '46';
        validPrefixes[4] := '43';
        validPrefixes[5] := '49';
        areaCode := CopyStr(PhoneNumber, 1, 2);

        isValid := false;
        for i := 1 to 5 do begin
            if areaCode = validPrefixes[i] then begin
                isValid := true;
                break;
            end;
        end;

        // If the area code is not valid, show an error
        if not isValid then
            Error('Invalid phone number. Please, make sure to put a valid number');
        PhoneNumber := prefix + ' ' + areaCode + PhoneNumber;
    end;
}
