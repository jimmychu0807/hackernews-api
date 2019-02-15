module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    null false

    def basic_ar_rescue(&block)
      block.call
    rescue ActiveRecord::ActiveRecordError => err
      errors = err.message.split(',').map{ |err| err.strip }
      return {
        errors: errors
      }
    end
  end
end
