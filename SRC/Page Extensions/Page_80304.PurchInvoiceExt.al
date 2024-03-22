pageextension 80304 PurchInvoiceExt extends "Purchase Invoice"
{
    layout
    {
        addafter(Status)
        {
            field("Calculated SVAT amount"; Rec."Calculated SVAT amount")
            {

            }
        }
    }
}