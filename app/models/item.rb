class Item < ApplicationRecord
  # attr_accessible :uid, :price, :name, :list_id, :list
  before_validation :generate_uid

  # before_create works if we don't have validation.
  # before_create :generate_uid

  belongs_to :list
  validates :uid, format: { with: /\A[A-Z]{3}\-[A-Z]{3}\-\d{3}/ }

  private

  def generate_uid
    a = ("A".."Z").to_a.sample(3).join
    b = ("A".."Z").to_a.shuffle[0,3].join
    c = (1..9).to_a.shuffle[0,3].join
    self.uid = "#{a}-#{b}-#{c}"
  end
end
