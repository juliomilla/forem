class AddPolls < ActiveRecord::Migration
  def change
    create_table :forem_polls do |t|
      t.references :forem_topic
      t.string :question
    end
  end
end
