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

FactoryBot.define do
  factory :link do
    user
    sequence(:url) { |i| "http://example#{i}.com" }
    sequence(:description) { |i| "Link #{i} description" }
  end
end
