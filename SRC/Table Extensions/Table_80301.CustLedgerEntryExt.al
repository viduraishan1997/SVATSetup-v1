tableextension 80301 CustLedgerEntryExt extends "Cust. Ledger Entry"
{
    fields
    {
        field(80300; "Calculated SVAT amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80301; "SVAT Credit Voucher Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80302; "SVAT Debit Voucher No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}