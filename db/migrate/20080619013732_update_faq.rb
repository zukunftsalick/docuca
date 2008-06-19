class UpdateFaq < ActiveRecord::Migration
  def self.up
    remove_column :faq_categories, :faq_id
    add_column    :faqs, :faq_category_id, :integer
  end

  def self.down
    add_column :faq_categories, :faq_id, :integer
    remove_column :faqs, :faq_category_id
  end
end
