# == Schema Information
#
# Table name: contents
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ContentSerializer
  include JSONAPI::Serializer
  attributes :title, :body, :created_at, :updated_at
end
