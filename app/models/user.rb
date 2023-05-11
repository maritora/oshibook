class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :profiles
  has_many :likes
  validates :name, presence: true, length: { maximum: 10 }

  def liked_by?(profile_id)
    likes.where(profile_id: profile_id).exists?
  end
  def self.guest
    find_or_create_by!(email: 'guest@guest.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'ゲスト'
    end
  end
  def self.ransackable_associations(auth_object = nil)
    ["profile"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
