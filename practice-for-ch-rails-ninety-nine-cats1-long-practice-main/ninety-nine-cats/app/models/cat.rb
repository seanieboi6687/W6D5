class Cat < ApplicationRecord
    validates_presence_of :name, :color, :birth_date, :sex
end
