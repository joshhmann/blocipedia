class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_initialize :default_to_standard
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis
  enum role: [:standard, :premium]
  
  after_save do
    if role == 'standard'
      wikis.where(private:true).each do |j|
        j.private = false
        j.save
      end
    end
  end
         
  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def default_to_standard
    self.role = 'standard' if self.role.nil?
  end
end