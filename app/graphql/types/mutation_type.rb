module Types
  class MutationType < BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_link, mutation: Mutations::CreateLink
    field :create_vote, mutation: Mutations::CreateVote
    field :user_sign_in, mutation: Mutations::UserSignIn
    field :cancel_upvote, mutation: Mutations::CancelUpvote
    field :post_comment, mutation: Mutations::PostComment
  end
end
