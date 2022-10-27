class Employee < ApplicationRecord
  belongs_to :department
  has_many :addresses
  has_many :leaves, class_name: "Leave", dependent: :destroy
  has_one :assign_leave , dependent: :destroy
  accepts_nested_attributes_for :addresses
   acts_as_paranoid
   has_one_attached :avatar
 # validates :name,:contact,:email ,:password, presence: { message: "must be given please" }
 # validates :email, uniqueness: { message: "email is allready presence" }
 # validates :password, uniqueness: { message: "password is allready presence" }
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github, :google_oauth2]
  def self.search(search)
    if search 
        where(["name LIKE ?","%#{search}%"])
    else
        all
    end
  end 

   def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create  do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end


end

