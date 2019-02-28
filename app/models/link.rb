# == Schema Information
#
# Table name: links
#
#  id             :bigint(8)        not null, primary key
#  comments_count :integer          default(0)
#  description    :text             not null
#  url            :string           not null
#  votes_count    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          not null
#
# Indexes
#
#  index_links_on_user_id  (user_id)
#

class Link < ActiveRecord::Base
  # --- relationships ---
  belongs_to :user, validate: true
  has_many :votes, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  SORT_TYPES = %w(by_created_at by_votes_count)

  # ---- scopes ---
  scope :sort_by_created_at, ->(desc = true) { order(created_at: (desc ? :desc : :asc)) }
  scope :sort_by_votes_count, ->(desc = true) {
    order(votes_count: (desc ? :desc : :asc), created_at: :desc)
  }
  scope :like, ->(field, value) { where arel_table[field].matches("%#{value}%") }

  # ---- AR lifecycle methods ---
  validates :url, presence: true, url: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }

  # --- instance methods ---
  def upvoted?(user)
    votes.find_by(user: user) != nil
  end

  def upvote!(user)
    votes.create!(user: user)
  end

  def cancel_upvote!(user)
    votes.find_by(user: user)&.destroy!
  end

  def post_comment(hsh)
    comments.create!(hsh)
  end
end
