codeunit 80300 SalesAndPurchSVATCalculate
{
    // Calculate SVAT Amount in Vendor Ledger Entry PurchasOrderInvoiceSubscriber
    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyVendLedgerEntryFromGenJnlLine(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line");
    var
        PurchHeader: Record "Purchase Header";
    begin
        PurchHeader.SetRange("Posting Date", GenJournalLine."Posting Date");

        PurchHeader.SetRange("Buy-from Vendor No.", GenJournalLine."Account No.");
        if PurchHeader.FindFirst() then
            VendorLedgerEntry."Calculated SVAT amount" := PurchHeader."Calculated SVAT amount";
    end;


    // Calculate SVAT Amount in Posted Purchase Invoice 
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterModifyEvent', '', false, false)]
    local procedure GetSVATAmountPostedPurchInvoice(var Rec: Record "Purchase Header")
    var
        PostPurchInvoice: Record "Purch. Inv. Header";
    begin
        PostPurchInvoice.SetRange("Order No.", Rec."No.");
        if PostPurchInvoice.FindFirst() then begin
            PostPurchInvoice."Calculated SVAT Amount" := Rec."Calculated SVAT amount";
        end;
    end;

    // Calculate SVAT Amount in the Purchase Order invoice Card Page
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterModifyEvent', '', false, false)]
    local procedure CalculatedSVATAmountPurchHeader(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        TaxDetails: Record "Tax Detail";
        GenLedgerSetup: Record "General Ledger Setup";
        PurchLineAmountTotal: Decimal;
        SVATC: Code[20];
    begin
        GenLedgerSetup.Get();
        GenLedgerSetup.TestField("SVAT Code");
        TaxDetails.SetRange("Tax Jurisdiction Code", GenLedgerSetup."SVAT Code");
        if TaxDetails.FindFirst() then
            SVATC := TaxDetails."Tax Group Code";
        PurchLine.SetRange("Document Type", Rec."Document Type");
        PurchLine.SetRange("Document No.", Rec."Document No.");
        PurchLine.SetFilter("Tax Liable", '%1', true);
        PurchLine.SetFilter("Tax Group Code", '%1', SVATC);
        if PurchLine.FindSet() then begin
            PurchLineAmountTotal := 0;
            repeat
                //if (PurchLine."Tax Liable" = true) and (PurchLine."Tax Group Code" = SVATC) then
                //Use Amount LCY better field "Outstanding Amt. Ex. VAT (LCY)"
                PurchLineAmountTotal += PurchLine.Amount;
            until PurchLine.Next() = 0;
        end;
        PurchHeader.SetRange("Document Type", Rec."Document Type");
        PurchHeader.SetRange("No.", Rec."Document No.");
        if PurchHeader.FindFirst() then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField("SVAT Code");
            TaxDetails.SetRange("Tax Jurisdiction Code", GenLedgerSetup."SVAT Code");
            if TaxDetails.FindFirst() then begin
                PurchHeader."Calculated SVAT amount" := PurchLineAmountTotal * TaxDetails."SVAT %" / 100;
                PurchHeader.Modify(true)
            end;
        end;
    end;
    // Delete Line In Purchase Line 
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterDeleteEvent', '', false, false)]
    local procedure DeleteLineInPurchaseLine(var Rec: Record "Purchase Line")
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        TaxDetails: Record "Tax Detail";
        GenLedgerSetup: Record "General Ledger Setup";
        PurchLineAmountTotal: Decimal;
        SVATC: Code[20];
    begin
        GenLedgerSetup.Get();
        GenLedgerSetup.TestField("SVAT Code");
        TaxDetails.SetRange("Tax Jurisdiction Code", GenLedgerSetup."SVAT Code");
        if TaxDetails.FindFirst() then
            SVATC := TaxDetails."Tax Group Code";
        PurchLine.SetRange("Document Type", Rec."Document Type");
        PurchLine.SetRange("Document No.", Rec."Document No.");
        PurchLine.SetFilter("Tax Liable", '%1', true);
        PurchLine.SetFilter("Tax Group Code", '%1', SVATC);
        if PurchLine.FindSet() then begin
            PurchLineAmountTotal := 0;
            repeat
                //if (PurchLine."Tax Liable" = true) and (PurchLine."Tax Group Code" = SVATC) then
                //Use Amount LCY better field "Outstanding Amt. Ex. VAT (LCY)"
                PurchLineAmountTotal += PurchLine.Amount;
            until PurchLine.Next() = 0;
        end;
        PurchHeader.SetRange("Document Type", Rec."Document Type");
        PurchHeader.SetRange("No.", Rec."Document No.");
        if PurchHeader.FindFirst() then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField("SVAT Code");
            TaxDetails.SetRange("Tax Jurisdiction Code", GenLedgerSetup."SVAT Code");
            if TaxDetails.FindFirst() then begin
                PurchHeader."Calculated SVAT amount" := PurchLineAmountTotal * TaxDetails."SVAT %" / 100;
                PurchHeader.Modify(true)
            end;
        end;
    end;

    //-----------------------------------Sales ------------------------------------------------------

    // Calculate SVAT Amount in Customer Ledger Entry
    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line");
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Posting Date", GenJournalLine."Posting Date");
        SalesHeader.SetRange("Sell-to Customer No.", GenJournalLine."Account No.");
        if SalesHeader.FindFirst() then
            CustLedgerEntry."Calculated SVAT amount" := SalesHeader."Calculated SVAT amount";
    end;
    // Calculate SVAT Amount in Posted Sales Invoice 
    [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Header", 'OnBeforeModifyEvent', '', false, false)]
    local procedure MyProcedure(var Rec: Record "Sales Invoice Header")
    var
        SalesInvoice_Order: Record "Sales Header";
    begin
        SalesInvoice_Order.SetRange("No.", Rec."Pre-Assigned No.");
        if SalesInvoice_Order.FindFirst() then
            Rec."Calculated SVAT Amount1" := SalesInvoice_Order."Calculated SVAT amount";
    end;
    // [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    // local procedure GetSVATAmountPostedSalesInvoice(var Rec: Record "Sales Header")
    // var
    //     PostSalesInvoice: Record "Sales Invoice Header";
    // begin

    //     PostSalesInvoice.SetRange("Pre-Assigned No.", Rec."No.");
    //     if PostSalesInvoice.FindFirst() then begin
    //         Message('%1', Rec."Calculated SVAT amount");
    //         PostSalesInvoice."Calculated SVAT Amount1" := Rec."Calculated SVAT amount";
    //         PostSalesInvoice.Modify(true);
    //     end;
    // end;
    // Calculate SVAT Amount in the Sales Order Invoice Card Page
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterModifyEvent', '', false, false)]
    local procedure CalculatedSVATAmountSalesHeader(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TaxDetails: Record "Tax Detail";
        GenLedgerSetup: Record "General Ledger Setup";
        SalesLineLineAmountTotal: Decimal;
        SVATC: Code[20];
        Prcenta: Decimal;
    begin
        GenLedgerSetup.Get();
        GenLedgerSetup.TestField("SVAT Code");
        TaxDetails.SetRange("Tax Jurisdiction Code", GenLedgerSetup."SVAT Code");
        if TaxDetails.FindFirst() then
            SVATC := TaxDetails."Tax Group Code";
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."Document No.");
        //SalesLine.SetFilter("Tax Liable", '%1', true);
        SalesLine.SetFilter("Tax Group Code", '%1', SVATC);
        if SalesLine.FindSet() then begin
            SalesLineLineAmountTotal := 0;
            repeat
                //if (SalesLine."Tax Liable" = true) and (SalesLine."Tax Group Code" = SVATC) then
                SalesLineLineAmountTotal += SalesLine.Amount;
            until SalesLine.Next() = 0;
        end;
        SalesHeader.SetRange("Document Type", Rec."Document Type");
        SalesHeader.SetRange("No.", Rec."Document No.");
        if SalesHeader.FindFirst() then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField("SVAT Code");
            TaxDetails.SetRange("Tax Jurisdiction Code", GenLedgerSetup."SVAT Code");
            if TaxDetails.FindFirst() then begin
                SalesHeader."Calculated SVAT amount" := SalesLineLineAmountTotal * TaxDetails."SVAT %" / 100;
                SalesHeader.Modify(true);
            end;
        end;
    end;
}