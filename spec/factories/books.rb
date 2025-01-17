# == Schema Information
#
# Table name: books
#
#  id           :bigint           not null, primary key
#  author       :string           not null
#  copies       :integer          default(1)
#  is_available :boolean          default(TRUE)
#  isbn         :string           not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  library_id   :bigint
#
# Indexes
#
#  index_books_on_library_id  (library_id)
#
require 'faker'

FactoryBot.define do 
  factory :book do 
    title { Faker::Book.title }
    isbn { Faker::Code.isbn }
    author { Faker::Book.author }
    copies { Faker::Number.between(from: 1, to: 10) }
    is_available { Faker::Boolean.boolean }
    library
  end
end
