module Types
  class MutationType < BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_link, mutation: Mutations::CreateLink
    field :create_vote, mutation: Mutations::CreateVote
  end
end
