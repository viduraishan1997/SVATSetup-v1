tableextension 80301 CustLedgerEntryExt extends "Cust. Ledger Entry"
{
    fields
    {
        field(10001; "Calculated SVAT amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10002; "SVAT Credit Voucher Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10003; "SVAT Debit Voucher No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}