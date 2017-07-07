class App < ApplicationRecord
  belongs_to 	:user
  has_many		:tokens, :dependent => :delete_all

  validates :domain, presence: true

  before_create :generate_personal_keys

  private
  def generate_personal_keys
  	begin
  		self.public_key = SecureRandom.hex
  	end while App.where(public_key: self.public_key).any?
  	begin
  		self.private_key = SecureRandom.hex
  	end while App.where(private_key: self.private_key).any?
  end
end
