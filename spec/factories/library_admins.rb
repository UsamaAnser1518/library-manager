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
FactoryBot.define do
  factory :library_admin do
    name { "MyString" }
    username { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
  end
end
