page 50202 StudentsChart
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            usercontrol(Chart; GoogleChart)
            {
                ApplicationArea = All;
                trigger ControlReady()
                var
                    Student: Record Student;
                    Department: Enum Department;
                    Data: JsonArray;
                    JsonA: JsonArray;
                    DepartmentCounts: array[12] of Integer;
                    i: Integer;
                    DepartmentIndex: Integer;
                begin
                    JsonA.Add('Department');
                    JsonA.Add('No. of Students');
                    Data.Add(JsonA);

                    if Student.FindSet() then
                        repeat
                            DepartmentIndex := Student.Department.AsInteger();
                            DepartmentCounts[DepartmentIndex] := DepartmentCounts[DepartmentIndex] + 1;
                        until Student.Next() = 0;

                    for i := 1 to 12 do begin
                        Clear(JsonA);
                        JsonA.Add(Department.Names().Get(i + 1));
                        JsonA.Add(DepartmentCounts[i]);
                        Data.Add(JsonA);
                    end;
                    CurrPage.Chart.Run(Data);
                end;
            }
        }
    }
}