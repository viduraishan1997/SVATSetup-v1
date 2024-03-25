page 80301 CustomerSVATSettelment
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = CustomerSVATSettelment;

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
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
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
                field("Customer Ledger Entry no"; Rec."Customer Ledger Entry no")
                {
                    ApplicationArea = All;
                }
                field("SVAT Debit Voucher No."; Rec."SVAT Debit Voucher No.")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

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
                    CustomerLedgerEntry: Record "Cust. Ledger Entry";
                    UserSetUp: Record "User Setup";
                    noseries: Codeunit NoSeriesManagement;
                begin
                    UserSetUp.SetRange("User ID", UserId);
                    if UserSetUp.FindFirst() then
                        if UserSetUp."Create SVAT CR/DR Voucher" = true then begin
                            CustomerLedgerEntry.SetRange("Entry No.", Rec."Customer Ledger Entry no");
                            if CustomerLedgerEntry.FindFirst() then begin
                                CustomerLedgerEntry."SVAT Credit Voucher Created" := true;
                                noseries.InitSeries('SVAT-DR-VO', xRec."No. Series Voucher", 0D, Rec."SVAT Debit Voucher No.", Rec."No. Series Voucher");
                                CustomerLedgerEntry."SVAT Debit Voucher No." := Rec."SVAT Debit Voucher No.";
                                CustomerLedgerEntry.Modify();
                                Message('Voucher has been Created Successfully Voucher No: %1 , Document No:  %2', Rec."SVAT Debit Voucher No.", Rec."Docuemt No");
                            end;
                        end
                        else
                            Message('User Are not Allowed to use this action');
                end;
            }
        }
    }
}