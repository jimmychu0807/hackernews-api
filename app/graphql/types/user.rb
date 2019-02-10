class Types::User < Types::BaseObject
  description "User Type"

  field :id, ID, null: false
  field :name, String, null: false
  field :email, String, null: false

  field :createdAt,  GraphQL::Types::ISO8601DateTime, null: false

  field :links, [Types::Link], null: false
  field :votes, [Types::Vote], null: false
end
