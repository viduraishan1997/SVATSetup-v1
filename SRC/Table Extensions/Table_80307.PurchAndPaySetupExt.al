tableextension 80307 PurchAndPaySetExt extends "Purchases & Payables Setup"
{
    fields
    {
        field(80300; "SVAT Credit Voucher"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }


}