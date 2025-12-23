class CreateSkills < ActiveRecord::Migration[7.2]
  def change
    create_table :skills do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :name
      t.string :level
      t.integer :position

      t.timestamps
    end
  end
end
