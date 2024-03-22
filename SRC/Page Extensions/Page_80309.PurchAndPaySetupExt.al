pageextension 80309 PurchAndPaySetupExt extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Posted Credit Memo Nos.")
        {
            field("SVAT Credit Voucher"; Rec."SVAT Credit Voucher")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}