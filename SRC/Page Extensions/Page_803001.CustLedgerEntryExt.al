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
            field("SVAT Credit Voucher Created"; Rec."SVAT Credit Voucher Created")
            {
                ApplicationArea = All;
            }
            field("SVAT Debit Voucher No."; Rec."SVAT Debit Voucher No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(AppliedEntries)
        {
            action("SVAT Settlement")
            {
                ApplicationArea = All;
                Image = SettleOpenTransactions;

                trigger OnAction()
                var
                    CustomerLedgerEntry: Record "Cust. Ledger Entry";
                    CustomerSVATSettelment: Record CustomerSVATSettelment;
                    EntryNo: Integer;
                begin
                    CustomerSVATSettelment.SetCurrentKey("Docuemt No");
                    if CustomerSVATSettelment.FindSet() then
                        repeat
                            CustomerSVATSettelment.Delete();
                        until CustomerSVATSettelment.Next() = 0;
                    Page.Run(80301);
                    CustomerLedgerEntry.SetFilter("SVAT Credit Voucher Created", '%1', false);
                    CustomerLedgerEntry.SetFilter("Calculated SVAT amount", '<>0');
                    if CustomerLedgerEntry.FindSet then begin
                        repeat
                            EntryNo += 1;
                            CustomerSVATSettelment.Reset();
                            CustomerSVATSettelment.Init();
                            CustomerSVATSettelment."Entry No" := EntryNo;
                            CustomerSVATSettelment."Posting Date" := CustomerLedgerEntry."Posting Date";
                            CustomerSVATSettelment."Docuemnt Date" := CustomerLedgerEntry."Document Date";
                            CustomerSVATSettelment."Document Type" := Format(CustomerLedgerEntry."Document Type");
                            CustomerSVATSettelment."Docuemt No" := CustomerLedgerEntry."Document No.";
                            CustomerSVATSettelment."Customer No" := CustomerLedgerEntry."Customer No.";
                            CustomerSVATSettelment."Customer Name" := CustomerLedgerEntry."Customer Name";
                            CustomerSVATSettelment."Customer Ledger Entry no" := CustomerLedgerEntry."Entry No.";
                            if CustomerLedgerEntry.CalcFields(Amount) then
                                CustomerSVATSettelment.Amount := Abs(CustomerLedgerEntry.Amount);
                            if CustomerLedgerEntry.CalcFields("Amount (LCY)") then
                                CustomerSVATSettelment."Amount LCY" := Abs(CustomerLedgerEntry."Amount (LCY)");
                            CustomerSVATSettelment."SVAT Amount" := CustomerLedgerEntry."Calculated SVAT amount";
                            CustomerSVATSettelment.Insert();
                        until CustomerLedgerEntry.Next() = 0;
                    end;
                end;
            }
        }
    }
}