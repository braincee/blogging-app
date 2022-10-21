class Post < ApplicationRecord
    belongs_to :author
    has_many :comments
    has_many :likes

    def post_update_counter
        author.post_counter = author.posts.count 
        Author.find(author.id).update(post_counter: author.posts.count)
    end
end