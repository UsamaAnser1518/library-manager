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
require 'rails_helper'

RSpec.describe LibraryAdmin, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
