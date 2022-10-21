class Author < ApplicationRecord
    has_many :posts
    has_many :likes
end
