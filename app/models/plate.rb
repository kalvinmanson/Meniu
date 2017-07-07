class Plate < ApplicationRecord
  
  acts_as_paranoid
  
  belongs_to 	:place
  has_many		:visits, :dependent => :delete_all

  validates :name, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :tags, presence: true
  validates :options, presence: true
  validates :diners, numericality: { only_integer: true }

  has_attached_file :picture, styles: { medium: "800x600#", thumb: "400x300#" }, default_url: "/images/:style/plate.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

end
