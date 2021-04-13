class CreateSections < ActiveRecord::Migration[5.1]
  def change
    def up
      create_table :sections do |t|
        t.string :name
      end
    end
    
    def down
      drop_table :sections
    end
  end
end
