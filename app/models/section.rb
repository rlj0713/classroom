class Section < ActiveRecord::Base
    validates :period_number, presence: true
    validates :period_number, numericality: { only_integer: true }
    belongs_to :user
    has_many :students
end