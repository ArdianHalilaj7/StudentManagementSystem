page 50201 "Students' List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Student;
    Caption = 'Students';

    layout
    {
        area(Content)
        {
            repeater("Student Information")
            {
                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                    Visible = false;

                }

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    trigger OnDrillDown()

                    begin
                        if Student.Get(Rec."Student ID") then begin
                            Page.Run(Page::"Student Card", Student);
                        end
                    end;

                }

                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }

                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                }

                field("Phone Number"; Rec."Phone Number")
                {
                    
                    trigger OnValidate()
                    var
                        SystemCodeUnit: Codeunit 50220;
                    begin
                        SystemCodeUnit.ValidatePhoneNumber(Rec."Phone Number");
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field(Email; Rec.Email)
                {
                    
                    trigger OnValidate()
                    var
                        SystemCodeUnit: Codeunit 50220;
                    begin
                        SystemCodeUnit.ValidateEmail(Rec.Email);
                    end;
                }

                field("Degree Level"; Rec."Degree Level")
                {
                    ApplicationArea = All;
                }

                field("Department"; Rec."Department")
                {
                    ApplicationArea = All;
                }

                field("Year of Study"; Rec."Year of Study")
                {
                    ApplicationArea = All;
                }
            }

        }
    }

    var
        Student: Record Student;
        var
            SystemCodeUnit: Codeunit 50220;


}