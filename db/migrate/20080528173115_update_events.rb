class UpdateEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
    add_column :events, :link, :string
    add_column :events, :is_duration, :boolean , :default => false
    
  end

  def self.down
    remove_column :events, :is_duration
    remove_column :events, :link
    remove_column :events, :end_date
    remove_column :events, :start_date
  end
end
