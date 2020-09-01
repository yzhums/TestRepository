page 80003 PurchaseInvoicePicture
{
    Caption = 'Purchase Invoice Picture';
    PageType = CardPart;
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    UsageCategory = Administration;
    SourceTable = "Purchase Header";

    layout
    {
        area(Content)
        {
            field(PurchInvoiceImage; PurchInvoiceImage)
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Specifies the picture of the purchase invoice.';
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(TakePicture)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Take';
                Image = Camera;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Activate the camera on the device.';

                trigger OnAction()
                var
                //CameraInteraction: Page "Camera Interaction";
                //Picstraeam: InStream;
                begin

                    //CameraInteraction.AllowEdit(true);
                    //CameraInteraction.Quality(100);
                    //CameraInteraction.EncodingType('PNG');
                    //CameraInteraction.RunModal();
                    //CameraInteraction.GetPicture(Picstraeam);
                    //PurchInvoiceImage.ImportStream(Picstraeam, CameraInteraction.GetPictureName());
                    //if not Insert(true) then
                    //    Modify(true);

                    TestField("No.");
                    Camera.AddPicture(Rec, Rec.FieldNo(PurchInvoiceImage));

                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Delete';
                Enabled = DeleteExportEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';

                trigger OnAction()
                begin
                    TestField("No.");

                    if not Confirm(DeleteImageQst) then
                        exit;

                    Clear(PurchInvoiceImage);
                    Modify(true);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetEditableOnPictureActions;
    end;

    trigger OnOpenPage()
    begin
    end;

    var
        Camera: Codeunit Camera;
        [InDataSet]
        CameraAvailable: Boolean;
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';
        SelectPictureTxt: Label 'Select a picture to upload';
        DeleteExportEnabled: Boolean;

    local procedure SetEditableOnPictureActions()
    begin
        DeleteExportEnabled := PurchInvoiceImage.HasValue;
    end;
}