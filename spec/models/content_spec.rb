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
require 'rails_helper'

RSpec.describe Content, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
