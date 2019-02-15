class Mutations::CreateLink < Mutations::BaseMutation
  argument :url, String, required: true
  argument :description, String, required: false

  field :link, Types::Link::LinkNode, null: true
  field :errors, [String], null: true

  def resolve(url:, description:)
    basic_ar_cancan_rescue do
      check_ability!(:create, Link)

      user = context[:current_user]
      link = user.links.create!(url: url, description: description)
      return {
        link: link,
        errors: nil
      }
    end
  end

end
