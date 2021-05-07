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
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "は半角6文字以上23文字以下英数小文字" }
  validates :username, length: { maximum: 30 }, allow_blank: true
  validates :age, numericality: true, inclusion: { in: 0..150 }, allow_blank: true
  validates :height, numericality: true, format: { with: VALID_DATA_REGEX }, allow_blank: true
  validates :weight, numericality: true, format: { with: VALID_DATA_REGEX }, allow_blank: true
  validates :profile, length: { maximum: 1000 }, allow_blank: true
  validates :target_weight, numericality: true, format: { with: VALID_DATA_REGEX }, allow_blank: true
  validates :target_body, numericality: true, format: { with: VALID_DATA_REGEX }, allow_blank: true

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
      user.weight = 55
      user.profile = "ご覧いただきありがとうございます！\r\n健康の為にダイエットを決意いたしました！一緒に頑張りましょう！"
      user.target_weight = 50
      user.target_body = 20
      # user.confirmed_at = Time.now
    end
  end

  # validate :password_complexity
  # def password_complexity
  #   return if password.blank? || password =~ /\A[a-z\d]{6,10}+\z/
  #   errors.add :password, 'の長さは6〜10文字英数小文字'
  # end
end
