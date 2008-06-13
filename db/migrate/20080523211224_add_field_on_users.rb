class AddFieldOnUsers < ActiveRecord::Migration
  def self.up
      add_column :users, :state, :string, :null => :no, :default => 'passive'
  end

  def self.down
  end
end
