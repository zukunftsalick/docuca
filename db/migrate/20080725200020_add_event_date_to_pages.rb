class AddEventDateToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :event_start, :datetime
    add_column :pages, :event_end, :datetime
  end

  def self.down
    remove_column :pages, :event_end
    remove_column :pages, :event_start
  end
end
