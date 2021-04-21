class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :period_number
      t.integer :user_id
      t.integer :student_id
    end
  end
end
