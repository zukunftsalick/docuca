class Comment < ActiveRecord::Base
  belongs_to :commentary, :polymorphic => true
  #validates_presence_of :comment, :on => :create, :message => "não pode ser em branco"
  validates_length_of :comment, :within => 5..255, :message => "deve ter entre 5 e 255 caracteres"
end
