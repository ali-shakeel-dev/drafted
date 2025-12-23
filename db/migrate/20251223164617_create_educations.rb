class CreateEducations < ActiveRecord::Migration[7.2]
  def change
    create_table :educations do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :institution
      t.string :degree
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
