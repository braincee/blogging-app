class Author < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments

    def most_recent_post
        posts.last(3)
    end
end

