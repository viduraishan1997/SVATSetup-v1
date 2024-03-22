pageextension 80305 SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field("Calculated SVAT amount"; Rec."Calculated SVAT amount")
            {

            }
        }
    }

    actions
    {
        // addfirst(Approval)
        // {
        //     action("Calculate SVAT")
        //     {
        //         ApplicationArea = All;

        //         trigger OnAction()
        //         var
        //             SalesHeader: Record "Sales Header";
        //             TaxDetails: Record "Tax Detail";
        //             GenLedgerSetup: Record "General Ledger Setup";
        //         begin
        //             SalesHeader.SetRange("Document Type", Rec."Document Type"::Order);
        //             SalesHeader.SetRange("No.", Rec."No.");
        //             if SalesHeader.FindFirst() then begin
        //                 GenLedgerSetup.Get();
        //                 GenLedgerSetup.TestField("SVAT Code");
        //                 TaxDetails.SetRange("Tax Jurisdiction Code", GenLedgerSetup."SVAT Code");
        //                 if TaxDetails.FindFirst() then begin
        //                     if SalesHeader.CalcFields(Amount) then begin
        //                         SalesHeader."Calculated SVAT amount" := SalesHeader.Amount * TaxDetails."SVAT %" / 100;
        //                         SalesHeader.Modify(true)
        //                     end;
        //                 end;
        //             end
        //         end;
        //     }
        // }
    }
}