# == Schema Information
#
# Table name: libraries
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Library < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_length_of :name, in: 5..50

  has_many :books

  has_many :library_borrowers, dependent: :destroy
  has_many :borrowers, through: :library_borrowers
end
