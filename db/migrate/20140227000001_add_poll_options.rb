class AddPollOptions < ActiveRecord::Migration
  def change
    create_table :poll_options do |t|
      t.references :poll
      t.integer :votes, default: 0, null: false
      t.string :description
    end
  end
end
