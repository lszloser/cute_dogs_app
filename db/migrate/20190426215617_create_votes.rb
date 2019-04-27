class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :dog_id
      t.timestamps
    end

    add_index :votes, [:user_id, :dog_id], unique: true
  end
end
