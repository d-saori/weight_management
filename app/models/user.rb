class User < ApplicationRecord
  has_many :graphs, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :height, presence: true
  validates :weight, presence: true
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
