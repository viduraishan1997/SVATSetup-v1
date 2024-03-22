pageextension 80307 GenLedgerSetupExt extends "General Ledger Setup"
{
    layout
    {
        addafter("Bank Account Nos.")
        {
            field("VAT Code"; Rec."SVAT Code")
            {
                ApplicationArea = All;
            }
        }
    }
}