module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    null false

    def basic_ar_cancan_rescue(&block)
      block.call
    rescue ActiveRecord::ActiveRecordError, CanCan::AccessDenied => err
      errors = err.message.split(',').map{ |err| err.strip }
      return {
        errors: errors
      }
    end

    def check_ability!(role, obj)
      user = context[:current_user]
      Ability.new(user).authorize!(role, obj, message:
        "User is not authorized to perform this action")
    end
  end
end
