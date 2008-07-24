class Comment < ActiveRecord::Base
  belongs_to :commentary, :polymorphic => true
  validates_presence_of :comment, :on => :create, :message => "não pode ser em branco"

end
