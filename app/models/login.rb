class Login < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :confirmado
  has_many :evento, through: :confirmados

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]         

def self.from_omniauth(auth)
  byebug
  where(provider: auth.provider, uid: auth.uid).first_or_create do |login|
    login.email = auth.info.email
    login.password = Devise.friendly_token[0,20]
    login.nome = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end
end

  def self.new_with_session(params, session)
    byebug
    super.tap do |login|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        login.email = data["email"] if login.email.blank?
        login.password = data["password"]
      end
    end
  end  

   def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    byebug
        login = Login.where(:provider => auth.provider, :uid => auth.uid).first
        if login
          return login
        else
          byebug
          registered_login = Login.where(:email => auth.info.email).first
          if registered_login
            return registered_login
          else
            login = Login.create(nome: auth.info.first_name,
                               provider: auth.provider,
                               uid: auth.uid,
                               email: auth.info.email,
                               oauth_token: auth.credentials.token,
                               token_secret: auth.credentials.secret,
                                         #oauth_expires_at = Time.at(auth.credentials.expires_at.to_s)
                                         #oauth_expires_at: DateTime.current >> 2,
                               password: Devise.friendly_token[0,20],
                              )
            end
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
