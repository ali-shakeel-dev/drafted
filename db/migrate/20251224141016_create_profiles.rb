class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :name
      t.string :profession
      t.string :email
      t.string :phone
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
