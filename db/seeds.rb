require 'factory_bot'

GENERATED_LINKS = 55

3.times do
  user = FactoryBot.create :user
  link = FactoryBot.create :link, user: user
end

second_user = User.second
first_link = Link.first
second_user.votes.create!(link: first_link)

first_user = User.first
(GENERATED_LINKS - 3).times do |i|
  FactoryBot.create :link, user: first_user
end
