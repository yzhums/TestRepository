pageextension 80003 PurchaseInvoiceExt extends "Purchase Invoice"
{
    layout
    {
        addbefore(IncomingDocAttachFactBox)
        {
            part(PurchaseInvoicePicture; PurchaseInvoicePicture)
            {
                ApplicationArea = All;
                SubPageLink = "Document Type" = field("Document Type"),
                                                "No." = field("No.");
            }
        }
    }
}