class List < ApplicationRecord
  # attr_accessible :description, :name
  validates :name,  :presence => true

  has_many :items, :dependent => :destroy
end
