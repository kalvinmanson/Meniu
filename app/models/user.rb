class User < ApplicationRecord

  acts_as_mappable :default_units => :kms,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  devise :omniauthable, :omniauth_providers => [:google_oauth2,:facebook]
         
  validates :email, presence: true
  validates :name, presence: true

  belongs_to  :city
  has_many    :tokens, :dependent => :delete_all
  has_many    :places, :dependent => :delete_all
  has_many    :quests, :dependent => :delete_all
  has_many    :visits, :dependent => :delete_all
  has_many    :tokens, :dependent => :delete_all
  has_many    :apps, :dependent => :delete_all

  before_create :init

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def init
    self.city_id  ||= City.first
    self.role       = "User"
  end

  def self.from_omniauth(auth)
    #where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    where(email: auth.info.email).first_or_create do |user|
      user.city = City.first
      user.role = "User"
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      #user.avatar = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
      #user.avatar = auth.info.image # assuming the user model has an image
      
      uri = URI.parse(auth.info.image)
      uri.scheme = 'https'
      user.update_attribute(:avatar, URI.parse(uri.to_s))
      user.skip_confirmation! 
    end
  end

end
