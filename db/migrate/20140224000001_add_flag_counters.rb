
class AddFlagCounters < ActiveRecord::Migration
  def change
    change_table :forem_posts do |t|
      t.integer :flags_count, default: 0, null: false
    end

    change_table :forem_topics do |t|\
      t.integer :flags_count, default: 0, null: false
    end
  end
end
