class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.string :name
      t.boolean :employed
      t.integer :age
      t.references :country, null: false, foreign_key: true


      t.timestamps
    end
  end
end
