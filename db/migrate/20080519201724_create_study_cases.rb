class CreateStudyCases < ActiveRecord::Migration
  def self.up
    create_table :study_cases, :force => true do |t|
      t.string :name
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :study_cases
  end
end
