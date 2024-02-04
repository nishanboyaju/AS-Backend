class UserSerializer
  include JSONAPI::Serializer
  attribute :name do |object|
    "#{object.first_name} #{object.last_name}"
  end

  attributes :email, :country, :created_at, :updated_at

  attribute :token do |user, params|
    params[:token]
  end

end
