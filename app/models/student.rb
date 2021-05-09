class Student < ActiveRecord::Base
    validates :name, presence: true
    validates :score, presence: true
    belongs_to :sections
end