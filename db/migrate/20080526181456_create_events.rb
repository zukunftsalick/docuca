class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events, :force => true do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :study_case_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
