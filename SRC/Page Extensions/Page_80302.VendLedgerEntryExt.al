pageextension 80302 VendLedgerEntryExt extends "Vendor Ledger Entries"
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
            field("SVAT Credit Voucher No."; Rec."SVAT Credit Voucher No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter(ActionApplyEntries)
        {
            action("SVAT Settlement")
            {
                ApplicationArea = All;
                Image = SettleOpenTransactions;

                trigger OnAction()
                var
                    VendorLedgerEntry: Record "Vendor Ledger Entry";
                    VendorSVATSettelment: Record "Vendor SVAT Settelment";
                    EntryNo: Integer;
                begin
                    VendorSVATSettelment.SetCurrentKey("Docuemt No");
                    if VendorSVATSettelment.FindSet() then
                        repeat
                            VendorSVATSettelment.Delete();
                        until VendorSVATSettelment.Next() = 0;
                    Page.Run(80300);
                    VendorLedgerEntry.SetFilter("SVAT Credit Voucher Created", '%1', false);
                    VendorLedgerEntry.SetFilter("Calculated SVAT amount", '<>0');
                    if VendorLedgerEntry.FindSet then begin
                        repeat
                            EntryNo += 1;
                            VendorSVATSettelment.Reset();
                            VendorSVATSettelment.Init();
                            VendorSVATSettelment."Entry No" := EntryNo;
                            VendorSVATSettelment."Posting Date" := VendorLedgerEntry."Posting Date";
                            VendorSVATSettelment."Docuemnt Date" := VendorLedgerEntry."Document Date";
                            //VendorSVATSettelment."Document Type" := VendorLedgerEntry."Document Type";
                            VendorSVATSettelment."Docuemt No" := VendorLedgerEntry."Document No.";
                            VendorSVATSettelment."Vendor No" := VendorLedgerEntry."Vendor No.";
                            VendorSVATSettelment."Vendor Name" := VendorLedgerEntry."Vendor Name";
                            VendorSVATSettelment."Vendor Ledger Entry no" := VendorLedgerEntry."Entry No.";
                            if VendorLedgerEntry.CalcFields(Amount) then
                                VendorSVATSettelment.Amount := Abs(VendorLedgerEntry.Amount);
                            if VendorLedgerEntry.CalcFields("Amount (LCY)") then
                                VendorSVATSettelment."Amount LCY" := Abs(VendorLedgerEntry."Amount (LCY)");
                            VendorSVATSettelment."SVAT Amount" := VendorLedgerEntry."Calculated SVAT amount";
                            VendorSVATSettelment.Insert();
                        until VendorLedgerEntry.Next() = 0;
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
}