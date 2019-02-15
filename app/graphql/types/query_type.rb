module Types
  class QueryType < BaseObject

    field :node, field: GraphQL::Relay::Node.field
    field :nodes, field: GraphQL::Relay::Node.plural_field

    field :allUsers, Types::User::UserConnection, null: false, connection: true do
      argument :type, String, required: false, default_value: "all"
    end
    def all_users(type:)
      ::User.send(type)
    end

    field :allLinks, Types::Link::LinkConnection, null: false, connection: true do
      argument :sort_by, String, required: false, default_value: "chronological"
    end
    def all_links(type:)
      ::Link.all
    end

  end
end
