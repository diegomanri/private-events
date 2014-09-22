class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.string :description
      t.datetime :date

      t.timestamps
    end
  end
end
