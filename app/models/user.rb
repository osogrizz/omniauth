class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
  end

  def create_from_omniauth
    create! do |user|
      user.provider = auth["provider"]
      user.provider = auth["uid"]
      user.provider = auth["info"]["nickname"] ? auth["info"]["nickname"] : auth["info"]["name"]
    end
  end
end
