tableextension 80303 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(80300; "Calculated SVAT amount"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
    }
}