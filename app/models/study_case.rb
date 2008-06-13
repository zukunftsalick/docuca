class StudyCase < ActiveRecord::Base
  has_many :events
  belongs_to :user
  
  has_many :comments, :as => :commentary
  
  #will_paginate 
  def self.per_page
      3
  end
  
  #types definition can be found in environment.rb
  def self.types
    return STUDY_CASE_TYPES
  end
end
