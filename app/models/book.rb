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
class Book < ApplicationRecord
  validates :title, :isbn, :author, presence: true
  
  belongs_to :library

  has_many :borrower_books, dependent: :destroy
  has_many :borrower, through: :borrower_books

  scope :global_search, -> (search_text) { ransack(title_cont: search_text).result }
  
  scope :search_by_title, -> (search_text, library_id) do
    ransack(title_cont: search_text, library_id_eq: library_id).result
  end

  def self.perform_search(params)
    if params[:global_search_flag]
      global_search(params[:search_text])
    else
      search_by_title(params[:search_text], params[:library_id])
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "isbn", "author", "copies", "is_available", "library_id", "created_at", "updated_at"]
  end
    
  def is_available?
    copies > 0
  end
end
