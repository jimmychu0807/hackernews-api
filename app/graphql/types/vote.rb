module Types
  module Vote
    class VoteNode < Types::BaseObject
      implements GraphQL::Relay::Node.interface
      description "Vote Type"

      global_id_field :id
      field :link, Types::Link::LinkNode, null: false
      field :user, Types::User::UserNode, null: false
      field :createdAt,  GraphQL::Types::ISO8601DateTime, null: false
    end

    class VoteConnection < GraphQL::Types::Relay::BaseConnection
      edge_type(Types::Vote::VoteNode.edge_type)

      field :totalCount, Integer, null: false
      def total_count
        object.nodes.size
      end
    end

  end
end
