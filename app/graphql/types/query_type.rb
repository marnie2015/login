require 'digest/sha1'

Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :signIn, types[Types::UserType] do
    argument :email_address, !types.String
    argument :password, !types.String
    resolve ->(obj, args, ctx) {
      User.where(email_address: args[:email_address], password: encrypt_pass(args[:password]))
    }

    def encrypt_pass(val)
      Digest::MD5.hexdigest(val)
    end
  end
end
