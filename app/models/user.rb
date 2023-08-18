class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :genToken  
  after_update :genToken 

  has_many :authored_messages, class_name: "Message", foreign_key: "author_id"
  def genToken 
    self.cabletoken = BCrypt::Password.create("self.id.to_s + self.encrypted_password")
  end
end
