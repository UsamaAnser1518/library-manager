# == Schema Information
#
# Table name: borrowers
#
#  id                     :bigint           not null, primary key
#  card_csv               :string           not null
#  card_number            :string           not null
#  card_title             :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_borrowers_on_email                 (email) UNIQUE
#  index_borrowers_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'faker'

FactoryBot.define do 
  factory :borrower do 
    name { Faker::Name.name }
    card_csv { Faker::Number.number(digits: 3) }
    card_title { Faker::Name.prefix }
    card_number { Faker::Number.number(digits: 16) }
  end
end
