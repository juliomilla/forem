class LetsFixSomeReferences < ActiveRecord::Migration
  
  def self.up
    rename_column :forem_flags, :forem_flaggable_type, :flaggable_type
    rename_column :forem_flags, :forem_flaggable_id, :flaggable_id
    rename_column :forem_poll_options, :forem_poll_id, :poll_id
    rename_column :forem_poll, :forem_topic_id, :topic_id
    rename_column :forem_poll_options_users, :forem_poll_option_id, :poll_option_id
  end

  def self.down
    rename_column :forem_flags, :flaggable_type, :forem_flaggable_type
    rename_column :forem_flags, :flaggable_id, :forem_flaggable_id
    rename_column :forem_poll_options, :poll_id, :forem_poll_id
    rename_column :forem_poll, :topic_id, :forem_topic_id
    rename_column :forem_poll_options_users, :poll_option_id, :forem_poll_option_id
  end
end
