class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.timestamps
      t.string :url
      t.string :picture_id
      t.string :secret
      t.integer :cuteness
    end
  end
end
