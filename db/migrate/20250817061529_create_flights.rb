class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :duration
      t.references :arrival_airport, foreign_key: { to_table: :airports }
      t.references :departure_airport, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
