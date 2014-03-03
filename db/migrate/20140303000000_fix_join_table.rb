class FixJoinTable < ActiveRecord::Migration

  def up
    remove_index :forem_poll_options_users
    drop_table :forem_poll_options_users
    create_join_table :forem_polls, :users do |t|
      t.index :forem_poll_id
    end
    add_index :forem_polls_users, [:forem_poll_id, :user_id], unique: true
  end

  def down
    remove_index :forem_polls_users
    drop_table :forem_polls_users
    create_join_table :forem_poll_options, :users do |t|
      t.index :forem_poll_option_id
    end
    add_index :forem_poll_options_users, [:forem_poll_option_id, :user_id], unique: true, name: "forem_index_poll_options_users"
  end
end

