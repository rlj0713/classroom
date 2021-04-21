class Student < ActiveRecord::Base
    validates :name, presence: true
    validates :score, presence: true
    belongs_to :user
    has_and_belongs_to_many :sections
end