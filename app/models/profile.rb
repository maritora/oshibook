class Profile < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one_attached :image
  # 公開・非公開機能
  scope :published, -> {where(is_published_flag: true)}
  scope :unpublished, -> {where(is_published_flag: false)}

  validates :oshi_name, presence: true, length: { maximum:10 } 
  validates :call, presence: true, length: { maximum:10 } 
  validates :job, presence: true, length: { maximum:20 } 
  validates :favorite_point, presence: true, length: { maximum:20 } 
  validates :is_published_flag, inclusion: { in: [true, false] ,
    message: "は必須項目です"}
  def self.ransackable_associations(auth_object = nil)
     ["user"]
  end
  def self.ransackable_attributes(auth_object = nil)
     ["oshi_name"]
  end
end
