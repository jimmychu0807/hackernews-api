require 'factory_bot'

3.times do
  user = FactoryBot.create :user
  link = FactoryBot.create :link, user: user
end

second_user = User.second
first_link = Link.first
second_user.votes.create!(link: first_link)
