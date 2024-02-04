# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  country         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string
#  last_name       :string
#
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
