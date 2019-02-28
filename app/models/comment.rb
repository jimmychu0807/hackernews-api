class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true, counter_cache: :comments_count
  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  # --- AR lifecycle methods ---

  # --- instance methods ---
  def post_comment(hsh)
    comments.create!(hsh)
  end
end
