class Mutations::CreateVote < Mutations::BaseMutation
  argument :link_id, ID, required: true, loads: Types::Link::LinkNode

  field :vote, Types::Vote::VoteNode, null: true
  field :errors, [String], null: true

  def resolve(link:)
    basic_ar_cancan_rescue do
      check_ability!(:create, Vote)

      user = context[:current_user]
      vote = user.votes.create!(link: link)
      return {
        vote: vote,
        errors: nil
      }
    end
  end
end
