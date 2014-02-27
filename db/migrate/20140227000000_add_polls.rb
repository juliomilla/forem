class AddPolls < ActiveRecord::Migration
  def change
    create_table :forem_polls do |t|
      t.references :topic
      t.string :question
    end
  end
end
