class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages, :force => true do |t|
      t.string :title
      t.string :permalink
      t.text :content
      t.integer :study_case_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
