class Mutations::CreateUser < Mutations::BaseMutation
  argument :name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::User::UserNode, null: true
  field :errors, [String], null: true

  def resolve(name:, email:, password:)
    basic_ar_cancan_rescue do
      user = User.create!(name: name, email: email, password: password)
      return {
        user: user,
        errors: nil
      }
    end
  end
end
