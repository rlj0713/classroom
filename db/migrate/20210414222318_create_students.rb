class CreateStudents < ActiveRecord::Migration[5.1]
  def change
      create_table :students do |t|
        t.string :name
        t.integer :section
        t.integer :score
        t.integer :user_id
      end
  end
end
