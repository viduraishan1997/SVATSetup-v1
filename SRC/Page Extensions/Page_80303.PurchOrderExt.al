pageextension 80303 PurchOrderExt extends "Purchase Order"
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
}