class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.boolean :democratic
      t.integer :year_founded

      t.timestamps
    end
  end
end
