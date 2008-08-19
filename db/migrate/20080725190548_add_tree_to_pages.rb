class AddTreeToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :parent_id, :integer
    add_column :pages, :event, :boolean
  end

  def self.down
    remove_column :pages, :event
    remove_column :pages, :parent_id
  end
end
