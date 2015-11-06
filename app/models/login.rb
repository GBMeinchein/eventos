class Login < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :confirmado
  has_many :evento, through: :confirmados

    
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
    :omniauth_providers => [:facebook]

    #attr_accessible :nome, :email, :password, :password_confirmation, :oauth_token, :token_secret, :access_token, :uid, :provider

    validates_presence_of :email
    validates_uniqueness_of :email

    def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
        login = Login.where(:provider => auth.provider, :uid => auth.uid).first

        if login
          return login
        else
          registered_login = Login.where(:email => auth.info.email).first
          if registered_login
            return registered_login
          else
            login = Login.create(nome: auth.info.name,
                               provider: auth.provider,
                               uid: auth.uid,
                               email: auth.info.email,
                               #photo_url: auth.info.image,
                               oauth_token: auth.credentials.token,
                               token_secret: auth.credentials.secret,
                               password: Devise.friendly_token[0,20],
                              )
          end
        end
    end  

def self.from_omniauth(auth)
  byebug
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
  end
end         

end
