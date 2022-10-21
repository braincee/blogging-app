class Post < ApplicationRecord
    belongs_to :author
    has_many :comments
    has_many :likes

    def post_update_counter
       author.increment!(:posts_counter)
    end

    def recent_comments
        comments.order(created_at: desc).limit(5)
    end
end

