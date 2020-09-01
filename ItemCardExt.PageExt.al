pageextension 80002 ItemCardExt extends "Item Card"
{
    layout
    {
        addafter("Purchasing Code")
        {
            field(VideoURL; VideoURL)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Video Url, such as youtube.';
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action(PlayVideo)
            {
                Caption = 'Play Video';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                image = Picture;

                trigger OnAction()
                var
                    VideoCod: Codeunit Video;
                begin
                    VideoCod.Play(VideoURL);
                end;
            }
        }
    }
}