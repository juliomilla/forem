class AddFlags < ActiveRecord::Migration
  def change
    create_table :forem_flags do |t|
      t.references :user
      t.string :forem_flaggable_type
      t.references :forem_flaggable
    end
  end
end
