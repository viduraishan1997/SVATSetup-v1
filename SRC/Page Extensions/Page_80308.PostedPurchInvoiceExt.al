pageextension 80308 PostedPurchInvoiceHeaderExt extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Calculated SVAT Amount"; Rec."Calculated SVAT Amount")
            {
                ApplicationArea = All;
            }
        }
    }
}