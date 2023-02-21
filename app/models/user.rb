class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one_attached :image
  has_many :posts
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable,
         authentication_keys:[:login]

  validates :username, presence: true, uniqueness: true,on: [:create, :update]
  validates :contact,format: { with: /\A\d{10,13}\z/},on: [:create, :update]
  validates :image, presence: true, content_type: ['image/png', 'image/jpeg','image/jpg']

  attr_accessor :login

  after_commit :add_default_cover, on: [:create, :update]

  private def add_default_cover
    unless image.attached?
      self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpeg")), filename: 'default.jpg' , content_type: "image/jpg")
    end
  end
  
  def login
    @login || self.username || self.email || self.contact
  end

  private
    def after_confirmation
      WelcomeMailer.send_notification(self).deliver_now
    end

  

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    if(login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username)= :value OR lower(email)= :value OR contact= :value",{value: login.downcase}]).first
    elsif conditions.has_key?(:username) || conditions.has_key(:email)
      where(conditions.to_h).first
    end
  end
end
