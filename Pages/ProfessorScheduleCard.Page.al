page 50211 "Professor Schedule"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Professor Schedule";

    layout
    {
        area(Content)
        {
            field("Schedule ID"; Rec."Schedule ID")
            {
                ApplicationArea = All;
            }
            group(Professor)
            {



                field("Professor ID"; Rec."Professor ID")
                {
                    ApplicationArea = All;
                    TableRelation = Professor;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(systemCodeunit.PerformLookup(Text, 'Professor'));
                    end;
                }

                field("Professor Name"; systemCodeunit.GetRecordName('Professor', Rec."Professor ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }




            }

            group(Subject)
            {
                field("Subject ID"; Rec."Subject ID")
                {
                    ApplicationArea = All;
                    TableRelation = Subject;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(systemCodeunit.PerformLookup(Text, 'Subject'));
                    end;
                }

                field("Subject Name"; systemCodeunit.GetRecordName('Subject', Rec."Subject ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            group("Course Period")
            {


                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


    var
        systemCodeunit: Codeunit SystemCodeunit;

}