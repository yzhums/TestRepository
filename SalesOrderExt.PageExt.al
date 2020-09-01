pageextension 83000 SalesOrderExt extends "Sales Order"
{
    actions
    {
        modify("Print Confirmation")
        {
            Visible = false;
        }
        addafter("Work Order")
        {
            action(SelectPrint)
            {
                ApplicationArea = All;
                Image = Print;
                Caption = 'Select Print';
                ToolTip = 'Please select the report to be printed';

                trigger OnAction()
                var
                    StrMenuMembers: Label 'Sales - Quote,Order Confirmation,Sales - Invoice';
                    StrMenuDesc: Label 'Please select the report to be printed';
                    ReportID: Integer;
                begin
                    Clear(ReportID);
                    ReportID := Dialog.StrMenu(StrMenuMembers, 1, StrMenuDesc);
                    case ReportID of
                        0:
                            exit;
                        1:
                            Report.Run(204, true);
                        2:
                            Report.Run(205, true);
                        3:
                            Report.Run(206, true);
                    end;
                end;
            }
        }
    }
}
