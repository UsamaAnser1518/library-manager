# == Schema Information
#
# Table name: borrower_books
#
#  id          :bigint           not null, primary key
#  due_date    :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :bigint           not null
#  borrower_id :bigint           not null
#
# Indexes
#
#  index_borrower_books_on_book_id      (book_id)
#  index_borrower_books_on_borrower_id  (borrower_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (borrower_id => borrowers.id)
#
class BorrowerBook < ApplicationRecord
  belongs_to :book
  belongs_to :borrower
end
