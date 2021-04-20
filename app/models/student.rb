class Student < ActiveRecord::Base
    validates :period_number, uniqueness: true
    belongs_to :section
end