class CreateRegisteredapps < ActiveRecord::Migration
  def change
    create_table :registeredapps do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end
