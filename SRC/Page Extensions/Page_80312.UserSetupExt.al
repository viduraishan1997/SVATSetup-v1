pageextension 80312 UserSetupExt extends "User Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {
            field("Create SVAT CR/DR Voucher"; Rec."Create SVAT CR/DR Voucher")
            {
                ApplicationArea = All;
            }
        }
    }
}