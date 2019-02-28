class Types::Commentable < Types::BaseUnion
  description "Object which can be commented on"
  possible_types Types::Link::LinkNode, Types::Comment::CommentNode

  def self.resolve_type(object, context)

    return case object.class.to_s
    when "Link"; Types::Link::LinkNode
    when "Comment"; Types::Comment::CommentNode
    else; raise "Unknown object type: #{object.class.to_s}"
    end
  end
end
