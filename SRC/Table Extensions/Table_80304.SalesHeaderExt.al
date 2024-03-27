tableextension 80304 SalesHeaderExt extends "Sales Header"
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