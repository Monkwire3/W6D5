require 'action_view'
# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birthdate   :date             not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string           not null
#

CAT_COLORS = 
[
    'white',
    'black',
    'grey',
    'orange',
    'cream'
]


class Cat < ApplicationRecord

    include ActionView::Helpers::DateHelper

    validate :birth_date_cannot_be_future
    validates :birthdate, :color, :sex, :name, presence: true
    validates :color, inclusion:{ in: CAT_COLORS, message: "Not a valid color"}
    validates :sex, inclusion:{ in: ['M','F'], message: "Not a valid gender"}
    

    def birth_date_cannot_be_future
        
        if birthdate > Date.today
            errors.add(:birthdate, "can't be in the future")
        end 
    end


    def age

    end

end
