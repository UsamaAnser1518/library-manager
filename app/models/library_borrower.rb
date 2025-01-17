# == Schema Information
#
# Table name: library_borrowers
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  borrower_id :bigint           not null
#  library_id  :bigint           not null
#
# Indexes
#
#  index_library_borrowers_on_borrower_id  (borrower_id)
#  index_library_borrowers_on_library_id   (library_id)
#
# Foreign Keys
#
#  fk_rails_...  (borrower_id => borrowers.id)
#  fk_rails_...  (library_id => libraries.id)
#
class LibraryBorrower < ApplicationRecord
  belongs_to :library
  belongs_to :borrower
end
