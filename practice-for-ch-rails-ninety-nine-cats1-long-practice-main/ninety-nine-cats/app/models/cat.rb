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
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: { in: %w(M F) }
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        val = self.birth_date <=> Date.today
        if val == 1
            errors.add(:birth_date, "Birth date can't be in the future.")
        end
    end

    def age
        dob = self.birth_date
        today = Date.today # get current date

        # did the cat have its birthday this year?
        had_birthday = ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? true : false) 

        # if yes, then subtract this year from birthday year, if not then also subtract 1 to get how many full years old they are
        years = now.year - dob.year - (had_birthday ? 0 : 1)

        # get the month difference from birthday month and today's month.
        # if the cat have not had their birthday yet, then subtract the difference from 12(months)
        months = had_birthday ? now.month - dob.month : 12 - (now.month - dob.month)

        # for <1 year old
        if years == 0
            return months > 1 ? months.to_s + " months old" : months.to_s + " month old"  

        # for =1 year old
        elsif years == 1
            return months > 1 ? years.to_s + " year and " + months.to_s + " months old" : years.to_s + " year and " + months.to_s + " month old" 

        # for >1 year old
        else
            return months > 1 ? years.to_s + " years and " + months.to_s + " months old" : years.to_s + " years and " + months.to_s + " month old"
        end
    end
end
