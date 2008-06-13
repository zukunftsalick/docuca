class UpdateStudyCases < ActiveRecord::Migration
  def self.up
    add_column :study_cases, :type, :string
  end

  def self.down
    remove_column :study_cases, :type
  end
end
