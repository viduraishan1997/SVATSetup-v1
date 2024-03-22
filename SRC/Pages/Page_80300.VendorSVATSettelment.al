page 80300 "Vendor SVAT Settelment"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
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
                field("Posting Date"; Rec."Docuemnt Date")
                {
                    ApplicationArea = All;
                }
                field("Docuemnt Date"; Rec."Docuemnt Date")
                {
                    ApplicationArea = All;
                }
                // field("Document Type"; Rec."Document Type")
                // {
                //     ApplicationArea = All;
                // }
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
                    noseries: Codeunit NoSeriesManagement;
                begin
                    VendorLedgerEntry.SetRange("Entry No.", Rec."Vendor Ledger Entry no");
                    if VendorLedgerEntry.FindFirst() then begin
                        VendorLedgerEntry."SVAT Credit Voucher Created" := true;
                        noseries.InitSeries('SVAT-CRD-VO', xRec."No. Series Voucher", 0D, Rec."No.", Rec."No. Series Voucher");
                        VendorLedgerEntry."SVAT Credit Voucher No." := Rec."No.";
                        VendorLedgerEntry.Modify();
                        Message('Voucher has been Created Successfully Voucher No: %1 , Document No:  %2', Rec."No.", Rec."Docuemt No");
                    end;
                end;
            }
        }
    }
}