table 80300 "Vendor SVAT Settelment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date"; Date)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(3; "Docuemnt Date"; Date)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        // field(4; "Document Type"; Option)
        // {
        //     Editable = false;
        //     DataClassification = ToBeClassified;
        //     OptionMembers = "","Payment","Invoice","Credit Memo","Finance Charge Memo","Reminder","Refund";
        // }
        field(5; "Docuemt No"; Code[20])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(6; "Vendor No"; Code[20])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(7; "Vendor Name"; Text[100])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(8; Amount; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(9; "Amount LCY"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(10; "SVAT Amount"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(11; "Vendor Ledger Entry no"; Integer)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(12; "No. Series Voucher"; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(13; "No."; Code[20])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}