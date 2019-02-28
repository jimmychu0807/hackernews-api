module Types
  module Comment
    # Need to define an empty class first to be used in CommentNode
    class CommentConnection < GraphQL::Types::Relay::BaseConnection; end

    class CommentNode < Types::BaseObject
      implements GraphQL::Relay::Node.interface
      description "Comment Type"

      global_id_field :id
      field :belongsTo, Types::Commentable, null: false
      field :content, String, null: false

      field :user, Types::User::UserNode, null: false
      field :votes, Types::Vote::VoteConnection, null: false
      field :comments, Types::Comment::CommentConnection, null: false

      field :createdAt, Types::DateTimeType, null: false
    end

    class CommentConnection < GraphQL::Types::Relay::BaseConnection
      edge_type(Types::Comment::CommentNode.edge_type)

      field :totalCount, Integer, null: false
      def total_count
        object.nodes.size
      end
    end

  end
end
