class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :score
      t.integer :section_id
      t.integer :user_id
    end
  end
end
