class User < ApplicationRecord
  has_many :graphs, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[a-z\d]{6,23}+\z/i
  VALID_DATA_REGEX = /\A[-]?[0-9]+(\.[0-9]+)?\z/i

  validates :email,
            presence: true,
            uniqueness: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "は半角6~23文字英数小文字" }
  validates :username, presence: true, length: { maximum: 30 }
  validates :age, numericality: true, inclusion: { in: 0..150 }
  validates :gender, presence: true
  validates :height, numericality: true, format: { with: VALID_DATA_REGEX }
  validates :weight, numericality: true, format: { with: VALID_DATA_REGEX }
  validates :profile, length: { maximum: 1000 }
  # validates :target_weight, numericality: true, format: { with: VALID_DATA_REGEX }
  # validates :target_body, numericality: true, format: { with: VALID_DATA_REGEX } 

  mount_uploader :avatar, ImageUploader

  def self.guest
    # 指定のemailが見つからない場合createで新規レコード作成
    # !は例外を発生させる(!がないとログインされないままリダイレクトされる)
    find_or_create_by!(email: 'test@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "ゲスト"
      user.age = 20
      user.gender = "男"
      user.height = 160
      user.weight = 50
      # user.confirmed_at = Time.now
    end
  end

  # validate :password_complexity
  # def password_complexity
  #   return if password.blank? || password =~ /\A[a-z\d]{6,10}+\z/
  #   errors.add :password, 'の長さは6〜10文字英数小文字'
  # end
end
