class AddUsersPollsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :poll_options, :users do |t|
      t.index :poll_option_id
    end
    add_index :poll_options_users, [:poll_option_id, :user_id], unique: true
  end
end
