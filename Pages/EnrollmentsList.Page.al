page 50208 "Enrollments' List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Enrollment;
 
    layout
    {
        area(Content)
        {
            repeater("Enrollment Information")
            {
                field("Enrollment ID"; Rec."Enrollment ID")
                {
                    ApplicationArea = All;
                    DrillDown = true;
 
                    trigger OnDrillDown()
 
                    begin
                        if enrollment.Get(Rec."Enrollment ID") then begin
                            Page.Run(Page::"Enrollment Card", enrollment);
                        end
                    end;
                }
 
                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                    TableRelation = Student;
 
 
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(systemCodeunit.PerformLookup(Text, 'Student'));
                    end;
 
 
                }
 
                field("Student Name"; systemCodeunit.GetRecordName('Student', Rec."Student ID"))
                {
                    ApplicationArea = All;
                    Editable = false;
                }
 
                field("Subject ID"; Rec."Subject ID")
                {
                    ApplicationArea = All;
                    TableRelation = Subject; // TableRelation to SubjectMS table
 
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
 
                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ApplicationArea = All;
                }
 
            }
        }
    }
 
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
 
                trigger OnAction()
                begin
 
                end;
            }
        }
    }
 
 
    /* procedure GetRecordName(RecordType: Text; ID: Integer): Text[100]
 
     begin
         case
            RecordType of
            'Student':
                 begin
                     if student.Get(ID) then
                         exit(student."First Name" + ' ' + student."Last Name");
                 end;
             'Subject':
                 begin
                     if subject.Get(ID) then
                         exit(subject.Name);
                end;
         end;
     end;
 
     procedure PerformLookup(var Text: Text; LookUpType: Text): Boolean
 
     var
         studentFullName: Text;
         subjectName: Text;
 
 
     begin
 
         case
             LookUpType of
 
             'Student':
                begin
                     if Page.RunModal(Page::"Students' List", student) = Action::LookupOK then begin
                         Text := Format(student."Student ID");
 
 
                         exit(true);
                     end;
                 end;
 
             'Subject':
                 begin
                     if Page.RunModal(Page::"Subjects' List", subject) = Action::LookupOK then begin
                        Text := Format(subject."Subject ID");
                         exit(true);
                     end;
                 end;
 
         end;
 
         exit(false);
 
     end; */
 
    var
        systemCodeunit: Codeunit SystemCodeunit;
        enrollment: Record Enrollment;
 
 
}