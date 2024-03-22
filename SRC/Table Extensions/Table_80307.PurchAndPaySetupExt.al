tableextension 80307 MyExtension extends "Purchases & Payables Setup"
{
    fields
    {
        field(10001; "SVAT Credit Voucher"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }


}