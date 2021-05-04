class UserReviewsPdf < Prawn::Document
    require "prawn/table"

    def initialize(comments)
        super(top_margin: 70)
        @comments = comments
        text "User's comments:", size: 40, style: :bold
        all_comments
    end

    def all_comments
        move_down 200
        table comment_rows
    end

    def comment_rows
        [["User", "Text", "Commented at"]] +
        @comments.each.map do |comment|
            [comment.user.email.to_s, comment.body.to_s, comment.created_at.to_s]
        end
    end
end