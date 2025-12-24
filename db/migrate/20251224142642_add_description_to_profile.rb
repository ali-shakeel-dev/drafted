class AddDescriptionToProfile < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :description, :text
  end
end
