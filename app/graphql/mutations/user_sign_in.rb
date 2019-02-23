class Mutations::UserSignIn < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::User::UserNode, null: true
  field :token, String, null: true
  field :errors, [String], null: true

  def resolve(email:, password:)
    user = User.find_by(email: email)&.authenticate(password)
    return { user: nil, token: nil, errors: ["Invalid user login."] } \
      unless user

    token = AuthToken.token_for_user(user)
    return { user: user, token: token, errors: nil }
  end
end
