Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :id, types.ID
  field :email_address, types.String
  field :role_id, types.Int
end
