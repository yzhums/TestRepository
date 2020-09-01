tableextension 80000 ItemExt extends Item
{
    fields
    {
        field(50000; VideoURL; Text[100])
        {
            Caption = 'Video URL';
            Description = 'Embed video';
            DataClassification = CustomerContent;
        }
    }
}