# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  after_save :update_post_counter
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    Comment.limit(5).order(created_at: :desc).where(post: self)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
