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
      argument :sort_by, String, required: false, default_value: "by_created_at"
      argument :desc, Boolean, required: false, default_value: true
    end
    def all_links(sort_by:, desc:)
      sort_by = sort_by.underscore
      raise "Unknown links sort type: #{sort_by}" unless \
        sort_by.in?(::Link::SORT_TYPES)
      ::Link.includes(:votes, :user).all.send("sort_#{sort_by}", desc)
    end

    field :getCommentsByCommentableId, Types::Comment::CommentConnection,
      null: false, connection: true do
      argument :commentable_id, ID, required: true
      argument :level_type, String, required: false, default_value: "top_level"
    end
    def get_comments_by_commentable_id(commentable_id:, level_type:)
      commentable = GraphqlTutorialSchema.object_from_id(commentable_id, context)
      case level_type
      when "top_level"; return commentable.comments
      else; raise "Unsupported comment level_type: ${level_type}"
      end
    end

  end
end
