class Student < ActiveRecord::Base
    validates :name, presence: true
    validates :section_id, presence: true
    belongs_to :section
end