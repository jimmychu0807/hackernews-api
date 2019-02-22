module Types
  module User
    class UserNode < Types::BaseObject
      implements GraphQL::Relay::Node.interface
      description "User Type"

      global_id_field :id
      field :name, String, null: false
      field :email, String, null: true
      field :createdAt, Types::DateTimeType, null: false

      field :links, Types::Link::LinkConnection, null: false
      field :votes, Types::Vote::VoteConnection, null: false
    end

    class UserConnection < GraphQL::Types::Relay::BaseConnection
      edge_type(Types::User::UserNode.edge_type)

      field :totalCount, Integer, null: false
      def total_count
        object.nodes.size
      end
    end

  end
end
