tableextension 80306 PurchPostInvoiceHeaderExt extends "Purch. Inv. Header"
{
    fields
    {
        field(10001; "Calculated SVAT Amount"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
    }
}