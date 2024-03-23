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
}