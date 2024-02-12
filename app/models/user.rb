class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :name      , presence: true
        validates :fast      , presence: true
        validates :last      , presence: true
        validates :fast_read , presence: true
        validates :last_read , presence: true
        validates :birth     , presence: true

        end
