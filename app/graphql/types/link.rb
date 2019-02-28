module Types
  module Link
    class LinkNode < Types::BaseObject
      implements GraphQL::Relay::Node.interface
      description "Link Type"

      global_id_field :id
      field :url, String, null: false
      field :description, String, null: false

      field :submitter, Types::User::UserNode, null: false, method: :user
      field :votes, Types::Vote::VoteConnection, null: false
      field :votesCount, Integer, null: false
      def votes_count
        object.votes.size
      end

      field :loginUserVoted, Boolean, null: false
      def login_user_voted
        user = context[:current_user]
        return false unless user
        object.votes.find_by(user: user) != nil
      end

      field :createdAt,  Types::DateTimeType, null: false
    end

    class LinkConnection < GraphQL::Types::Relay::BaseConnection
      edge_type(Types::Link::LinkNode.edge_type)

      field :totalCount, Integer, null: false
      def total_count
        object.nodes.size
      end
    end
  end
end
