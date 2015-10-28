class Login < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :confirmado
  has_many :evento, through: :confirmados

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]         

  #def self.from_omniauth(auth)
   # where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
   #   login.provider = auth.provider
   #   login.uid = auth.uid
   #   login.nome = auth.info.name
   #   login.oauth_token = auth.credentials.token
   #   login.oauth_expires_at = Time.at(auth.credentials.expires_at)
   #   login.save!
  #  end
  #end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |login|
      login.email = auth.info.email
      login.access_token = Devise.friendly_token[0,20]
      login.nome = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
  end
end

def self.find_or_create_with_omniauth(auth)
  byebug
   login = self.find_or_create_by_provider_and_uid(auth.provider, auth.uid)
   login.assign_attributes({ name: auth.info.name, email: auth.info.email, photo_url: auth.info.image, access_token: auth.credentials.token })
   login.save!
   login
 end

def self.new_with_session(params, session)
  super.tap do |login|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      login.email = data["email"] if login.email.blank?
    end
  end
end

end
