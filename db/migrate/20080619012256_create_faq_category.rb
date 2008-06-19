class CreateFaqCategory < ActiveRecord::Migration
  def self.up
    create_table :faq_categories, :force => true do |t|
      t.string :name
      t.integer :faq_id
      t.timestamps
    end
  end

  def self.down
    drop_table :faq_categories
  end
end
