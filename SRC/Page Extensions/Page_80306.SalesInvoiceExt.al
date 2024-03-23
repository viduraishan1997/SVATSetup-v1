pageextension 80306 SalesInvoiceExt extends "Sales Invoice"
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