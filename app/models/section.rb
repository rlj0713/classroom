class Section < ActiveRecord::Base
    validates :period_number, uniqueness: true
    belongs_to :user
    has_many :students
end