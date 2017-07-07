class City < ApplicationRecord
  has_many :users, :dependent => :delete_all

  validates :name, presence: true
 end
