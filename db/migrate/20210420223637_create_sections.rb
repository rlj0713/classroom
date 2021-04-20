class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.integer :period_number
      t.integer :user_id
    end
  end
end
