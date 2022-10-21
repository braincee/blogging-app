class Comment < ApplicationRecord
    belongs_to :posts
    belongs_to :author
end