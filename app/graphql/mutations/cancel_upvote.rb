class Mutations::CancelUpvote < Mutations::BaseMutation
  argument :link_id, ID, required: true, loads: Types::Link::LinkNode

  field :link, Types::Link::LinkNode, null: true
  field :errors, [String], null: true

  def resolve(link:)
    basic_ar_cancan_rescue do
      user = context[:current_user]
      vote = link.votes.find_by(user: user)
      check_ability!(:destroy, vote)
      vote.destroy!
      return { link: link, errors: nil }
    end
  end
end
