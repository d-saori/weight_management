class User < ApplicationRecord
  has_many :graphs, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_DATA_REGEX = /\A[a-z0-9]+\z/i

  validates :email,
            presence: true,
            uniqueness: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, length: { maximum: 30 }
  validates :age, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..150 }
  validates :gender, presence: true
  validates :height, presence: true, format: { with: VALID_DATA_REGEX }
  validates :weight, presence: true, format: { with: VALID_DATA_REGEX }
  validates :profile, length: { maximum: 1000 }

  mount_uploader :avatar, ImageUploader

  def self.guest
    # 指定のemailが見つからない場合createで新規レコード作成
    # !は例外を発生させる(!がないとログインされないままリダイレクトされる)
    find_or_create_by!(email: 'test@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
    end
  end
end
