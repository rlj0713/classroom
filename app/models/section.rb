class Section < ActiveRecord::Base
    validates :period_number, presence: true
    validates :period_number, numericality: true
    belongs_to :user
    has_and_belongs_to_many :students
end