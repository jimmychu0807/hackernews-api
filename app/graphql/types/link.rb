class Types::Link < Types::BaseObject
  description "Link Type"

  field :id, ID, null: false
  field :url, String, null: false
  field :description, String, null: false

  field :user, Types::User, null: false
  field :votes, [Types::Vote], null: false

  field :createdAt,  GraphQL::Types::ISO8601DateTime, null: false
end
