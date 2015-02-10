class User < ActiveRecord::Base
	#validates :name, presence: true, length: {minimum: 7}
	#validates :email, presence: true, uniqueness: true
	#validates :password, presence: true, length: {minimum: 6}
before_create :encrypt_password
#before_save :encrypt_password
  def encrypt_password
    self.password=Digest::MD5.hexdigest(password)
  end
  def self.check_enc_password(email,password)
    @user=User.find_by_email_and_password(email,Digest::MD5.hexdigest(password))
  if @user.present?
     return @user
     else
     return nil 
  end
  end
def self.omniauth(auth)
  #byebug
    #where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
