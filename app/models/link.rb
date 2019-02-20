class Link < ActiveRecord::Base
  # --- relationships ---
  belongs_to :user, validate: true
  has_many :votes, dependent: :destroy

  SORT_TYPES = %w(by_created_at by_votes_count)

  # ---- scopes ---
  scope :sort_by_created_at, ->(desc = true) { order(created_at: (desc ? :desc : :asc)) }
  scope :sort_by_votes_count, ->(desc = true) {
    select("links.*", "count(votes.link_id) as total").left_joins(:votes).group("links.id")
      .order("total #{desc ? "DESC" : "ASC"}, links.created_at DESC")
  }
  scope :like, ->(field, value) { where arel_table[field].matches("%#{value}%") }

  # ---- AR lifecycle methods ---
  validates :url, presence: true, url: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
end
