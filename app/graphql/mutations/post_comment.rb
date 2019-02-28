class Mutations::PostComment < Mutations::BaseMutation
  argument :commentable_id, ID, required: true, loads: Types::Commentable
  argument :content, String, required: true

  field :comment, Types::Comment::CommentNode, null: true
  field :errors, [String], null: true

  def resolve(commentable:, content:)
    basic_ar_cancan_rescue do
      user = context[:current_user]
      check_ability!(:create, Comment)
      comment = commentable.post_comment(user: user, content: content)
      return { errors: nil, comment: comment }
    end
  end
end
