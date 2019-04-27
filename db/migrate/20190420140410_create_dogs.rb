class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.timestamps
      t.string :url
      t.string :picture_id, unique: true
      t.string :secret, unique: true
      t.integer :cuteness, default: 0
    end
  end
end
