# == Schema Information
#
# Table name: votes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_votes_on_link_id              (link_id)
#  index_votes_on_user_id              (user_id)
#  index_votes_on_user_id_and_link_id  (user_id,link_id) UNIQUE
#

class Vote < ActiveRecord::Base
  belongs_to :user, validate: true
  belongs_to :link, validate: true, counter_cache: :votes_count

  validates :user_id, uniqueness: { scope: :link_id }
end
