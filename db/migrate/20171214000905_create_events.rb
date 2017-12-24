class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :registeredapp, foreign_key: true
      t.timestamps
    end
  end
end
