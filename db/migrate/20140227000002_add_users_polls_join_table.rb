class AddUsersPollsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :forem_poll_options, :users do |t|
      t.index :forem_poll_option_id
    end
    add_index :forem_poll_options_users, [:forem_poll_option_id, :user_id], unique: true
  end
end
