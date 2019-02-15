class Mutations::CreateLink < Mutations::BaseMutation
  argument :url, String, required: true
  argument :description, String, required: false
  argument :user_id, ID, required: true, loads: Types::User::UserNode

  field :link, Types::Link::LinkNode, null: true
  field :errors, [String], null: true

  def resolve(url:, description:, user:)
    basic_ar_rescue do
      link = user.links.create!(url: url, description: description)
      return {
        link: link,
        errors: nil
      }
    end
  end

end
