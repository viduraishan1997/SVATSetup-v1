tableextension 80308 SalesInvoiceHeaderExt extends "Sales Invoice Header"
{
    fields
    {
        field(1001; "Calculated SVAT Amount1"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
    }


}