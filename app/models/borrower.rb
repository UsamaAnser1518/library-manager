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
class Borrower < ApplicationRecord
  validates :name, :card_title, :card_number, :card_number, :card_csv, presence: true
  
  has_many :library_borrowers
  has_many :libraries, through: :library_borrowers

  has_many :borrower_books, dependent: :destroy
  has_many :books, through: :borrower_books

  def books_with_due_date
    borrower_books.where(due_date: [...DateTime.now])
  end
end
