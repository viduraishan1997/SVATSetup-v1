page 80300 "Vendor SVAT Settelment"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Vendor SVAT Settelment";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Docuemnt Date"; Rec."Docuemnt Date")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Docuemt No"; Rec."Docuemt No")
                {
                    ApplicationArea = All;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field("Vendor Ledger Entry no"; Rec."Vendor Ledger Entry no")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = All;
                }
                field("SVAT Amount"; Rec."SVAT Amount")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Create Credit SVAT Voucher")
            {
                ApplicationArea = All;
                Image = Create;

                trigger OnAction()
                var
                    VendorLedgerEntry: Record "Vendor Ledger Entry";
                    UserSetup: Record "User Setup";
                    noseries: Codeunit NoSeriesManagement;
                begin
                    UserSetup.SetRange("User ID", UserId);
                    if UserSetup.FindFirst() then begin
                        if UserSetup."Create SVAT CR/DR Voucher" = true then begin
                            VendorLedgerEntry.SetRange("Entry No.", Rec."Vendor Ledger Entry no");
                            if VendorLedgerEntry.FindFirst() then begin
                                VendorLedgerEntry."SVAT Credit Voucher Created" := true;
                                noseries.InitSeries('SVAT-CRD-VO', xRec."No. Series Voucher", 0D, Rec."No.", Rec."No. Series Voucher");
                                VendorLedgerEntry."SVAT Credit Voucher No." := Rec."No.";
                                VendorLedgerEntry.Modify();
                                Message('Voucher has been Created Successfully Voucher No: %1 , Document No:  %2', Rec."No.", Rec."Docuemt No");
                            end;
                        end else
                            Message('User Are not Allowed to use this action');
                    end;
                end;
            }
            action("Apply Entry")
            {
                ApplicationArea = All;
                Image = ApplyEntries;
                trigger OnAction()
                var
                    VendLedgEntryRec, VendorLedgerEntry : Record "Vendor Ledger Entry";
                    VendorLedgerEntryPage: Page "Vendor Ledger Entries";
                    VendEntryApplyPostEntries: Codeunit "VendEntry-Apply Posted Entries";
                begin
                    VendLedgEntryRec.SetRange("Entry No.", Rec."Entry No");
                    if VendLedgEntryRec.FindFirst() then begin
                        VendorLedgerEntry.Copy(VendLedgEntryRec);
                        VendEntryApplyPostEntries.ApplyVendEntryFormEntry(VendorLedgerEntry);
                        VendorLedgerEntry.Get(VendorLedgerEntry."Entry No.");
                        VendLedgEntryRec := VendorLedgerEntry;
                        VendorLedgerEntryPage.Update();
                    end;
                end;
            }
        }
    }
}