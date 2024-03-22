pageextension 80301 CustLedgerEntryExt extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Calculated SVAT amount"; Rec."Calculated SVAT amount")
            {
                ApplicationArea = All;
                ToolTip = 'Display the Calculated SVAT Amount';
            }
        }
    }
}