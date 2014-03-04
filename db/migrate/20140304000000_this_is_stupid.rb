class ThisIsStupid < ActiveRecord::Migration
  def up
    drop_table :forem_polls_users
    create_table :forem_votes do |t|
      t.references :poll
      t.references :user
    end
    add_index :forem_votes, [:poll_id, :user_id], unique: true
  end
end
