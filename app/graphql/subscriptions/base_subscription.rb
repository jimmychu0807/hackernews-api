class Subscriptions::BaseSubscription < GraphQL::Schema::Subscription
  # Hook up base classes
  object_class Types::BaseObject
end
