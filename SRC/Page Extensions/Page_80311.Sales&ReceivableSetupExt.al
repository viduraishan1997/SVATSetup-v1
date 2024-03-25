pageextension 80311 "Sales&ReceivableSetupExt" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Direct Debit Mandate Nos.")
        {
            field("SVAT Debit Nos"; Rec."SVAT Debit Nos")
            {
                ApplicationArea = All;
            }
        }
    }


}