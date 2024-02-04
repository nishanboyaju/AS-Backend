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
class User < ApplicationRecord
    has_secure_password

    validates :email, :first_name, :last_name, :password_digest, presence: true
    validates :email, uniqueness: true
end
