tableextension 80309 "Sales&RecivableSetupExt" extends "Sales & Receivables Setup"
{
    fields
    {
        field(10001; "SVAT Debit Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }


}