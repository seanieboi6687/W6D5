# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  description :text
#  name        :string           not null
#  sex         :string(1)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    CAT_COLORS = ["White", "Black", "Brown", "Orange"]

    validates_presence_of :name, :color, :birth_date, :sex
    validates :color, inclusion: { in: CAT_COLORS}
    validates :sex, inclusion: { in: %w(M F)}
    
end
