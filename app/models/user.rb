class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

         validates :email,presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
         validates :password, presence: true, length: {minimum:6}

         has_many :categories, dependent: :destroy
end
