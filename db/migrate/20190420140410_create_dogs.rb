class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.timestamps
      t.string :url
      t.string :picture_id
      t.string :secret, unique: true
      t.integer :cuteness, default: 0
    end

    add_index :dogs, :picture_id, unique: true
  end
end
