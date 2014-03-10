class AddTags < ActiveRecord::Migration
  def change
    create_table :forem_tags do |t|
      t.string :name
    end
    create_table :forem_taggings do |t|
      t.references :tag
      t.references :topic
    end
    add_index :forem_taggings, [:tag_id, :topic_id], unique: true
  end
end
