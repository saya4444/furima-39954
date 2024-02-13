class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :password        , format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
        validates :name            , presence: true
        validates :last_name       , presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角文字を使用してください' }
        validates :first_name      , presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角文字を使用してください' }
        validates :last_name_kana  , presence: true
        validates :last_name_kana  ,format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }, if: :last_name_kana_present?
        validates :first_name_kana , presence: true
        validates :first_name_kana , format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }, if: :last_name_kana_present?
        validates :birthday        , presence: true


        def last_name_kana_present?
          last_name_kana.present?
        end

        end
