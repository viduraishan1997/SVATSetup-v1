tableextension 80305 GenLedgerSetupExt extends "General Ledger Setup"
{
    fields
    {
        field(100001; "SVAT Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tax Jurisdiction";
        }
    }
}