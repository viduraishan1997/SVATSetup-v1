pageextension 80300 TaxDetailsExt extends "Tax Details"
{
    layout
    {
        addafter("Tax Group Code")
        {
            field("SVAT %"; Rec."SVAT %")
            {
                ApplicationArea = All;
            }
        }
    }
}