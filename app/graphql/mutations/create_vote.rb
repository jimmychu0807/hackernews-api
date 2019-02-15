class Mutations::CreateVote < Mutations::BaseMutation
  argument :user_id, ID, required: true, loads: Types::User::UserNode
  argument :link_id, ID, required: true, loads: Types::Link::LinkNode

  field :vote, Types::Vote::VoteNode, null: true
  field :errors, [String], null: true

  def resolve(user:, link:)
    basic_ar_rescue do
      vote = user.votes.create!(link: link)
      return {
        vote: vote,
        errors: nil
      }
    end
  end
end
