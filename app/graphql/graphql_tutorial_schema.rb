class GraphqlTutorialSchema < GraphQL::Schema
  query Types::QueryType
  mutation Types::MutationType
  subscription Types::SubscriptionType

  default_max_page_size 25

  def self.id_from_object(object, type_definition, query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  def self.object_from_id(id, query_ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    raise StandError.new if type_name.nil? || item_id.nil?
    type = type_name.gsub(/Node$/, '')
    type.constantize&.send :find, item_id
  rescue StandardError => err
    query_ctx.errors << { id_error: "Cannot resolve id:#{id} to object" }
    raise GraphQL::ExecutionError, "id_error"
  end

  def self.resolve_type(type, obj, ctx)
    case obj
    when ::User; Types::User::UserNode
    when ::Link; Types::Link::LinkNode
    when ::Vote; Types::Vote::VoteNode
    else; raise "Unknown type: #{type}"
    end
  end
end
