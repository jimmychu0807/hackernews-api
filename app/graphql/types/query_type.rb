module Types
  class QueryType < BaseObject
    field :allUsers, [Types::User], null: false
    def all_users
      ::User.all
    end
  end
end
