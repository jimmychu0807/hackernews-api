class GraphqlTutorialSchema < GraphQL::Schema
  query Types::QueryType
  mutation Types::MutationType

  default_max_page_size 25

  def self.id_from_object(object, type_definition, query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  def self.object_from_id(id, query_ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    type_name.send :find, item_id
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
