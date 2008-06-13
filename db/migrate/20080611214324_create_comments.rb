class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.references :commentary, :polymorphic => true
      t.string :comment
      t.integer :user_id
      t.integer :study_case_id
      t.timestamps
      
    end
  end

  def self.down
    drop_table :comments
  end
end
