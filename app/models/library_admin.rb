# == Schema Information
#
# Table name: library_admins
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class LibraryAdmin < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
