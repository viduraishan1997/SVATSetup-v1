pageextension 80310 PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter(Closed)
        {
            field("Calculated SVAT Amount"; Rec."Calculated SVAT Amount")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}