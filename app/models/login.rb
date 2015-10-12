class Login < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      login.provider = auth.provider
      login.uid = auth.uid
      login.nome = auth.info.name
      login.oauth_token = auth.credentials.token
      login.oauth_expires_at = Time.at(auth.credentials.expires_at)
      login.save!
    end
  end

  def self.find_or_create_with_omniauth(auth)
    byebug
     login = self.find_or_create_by_provider_and_uid(auth.provider, auth.uid)
     login.assign_attributes({ name: auth.info.name, email: auth.info.email, photo_url: auth.info.image, access_token: auth.credentials.token })
     login.save!
     login
   end

end
