tableextension 80302 VendLedgerEntryExt extends "Vendor Ledger Entry"
{
    fields
    {
        field(1001; "Calculated SVAT amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(1002; "SVAT Credit Voucher Created"; Boolean)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(1003; "SVAT Credit Voucher No."; Code[20])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        
    }
}