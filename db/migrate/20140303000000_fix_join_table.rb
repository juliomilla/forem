class FixJoinTable < ActiveRecord::Migration
  def up
    create_table :forem_polls_users do |t|
      t.references :poll
      t.references :user
    end
    add_index :forem_polls_users, [:poll_id, :user_id], unique: true
  end

  def down
    drop_table :forem_polls_users 
  end
end
