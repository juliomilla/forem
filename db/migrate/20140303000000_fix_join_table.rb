class FixJoinTable < ActiveRecord::Migration
  def up
    drop_table :forem_poll_options_users
    create_join_table :forem_polls, :users do |t|
      t.index :forem_poll_id
    end
    add_index :forem_polls_users, [:forem_poll_id, :user_id], unique: true
  end
end

