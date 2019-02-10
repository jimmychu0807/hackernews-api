class Types::Vote < Types::BaseObject
  description "Vote Type"

  field :id, ID, null: false
  field :link, Types::Link, null: false
  field :user, Types::User, null: false
  field :createdAt,  GraphQL::Types::ISO8601DateTime, null: false
end
