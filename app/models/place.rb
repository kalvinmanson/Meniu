class Place < ApplicationRecord

  acts_as_paranoid
  
  belongs_to 	:user
  belongs_to 	:city
  has_many		:plates, :dependent => :delete_all
  has_many		:visits, :dependent => :delete_all

  
  acts_as_mappable :default_units => :kms,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  validates :name, presence: true
  validate :expiration_date_cannot_be_in_the_past
  validates :address, presence: true
  validates :description, presence: true
  validates :phone, presence: true

  has_attached_file :picture, styles: { medium: "1200x500#", thumb: "400x350#" }, default_url: "/images/:style/place.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  def expiration_date_cannot_be_in_the_past
    if expires_at.present? && expires_at < Date.today
      errors.add(:expires_at, "can't be in the past")
    end
  end

end
