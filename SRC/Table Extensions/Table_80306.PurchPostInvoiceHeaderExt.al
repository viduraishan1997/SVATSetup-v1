tableextension 80306 PurchPostInvoiceHeaderExt extends "Purch. Inv. Header"
{
    fields
    {
        field(80300; "Calculated SVAT Amount"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
    }
}