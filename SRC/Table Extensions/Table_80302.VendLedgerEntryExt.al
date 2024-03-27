tableextension 80302 VendLedgerEntryExt extends "Vendor Ledger Entry"
{
    fields
    {
        field(80300; "Calculated SVAT amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80301; "SVAT Credit Voucher Created"; Boolean)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(80302; "SVAT Credit Voucher No."; Code[20])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }

    }
}