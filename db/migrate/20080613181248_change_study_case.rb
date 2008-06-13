class ChangeStudyCase < ActiveRecord::Migration
  def self.up
    rename_column :study_cases, :type, :kind
  end

  def self.down
    rename_column :study_cases, :kind, :type
  end
end
