class AddPollOptions < ActiveRecord::Migration
  def change
    create_table :forem_poll_options do |t|
      t.references :forem_poll
      t.integer :votes, default: 0, null: false
      t.string :description
    end
  end
end
