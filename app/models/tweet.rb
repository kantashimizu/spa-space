class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :text, presence: true
  belongs_to :user, optional: true
  belongs_to :area
  has_many :comment


  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end
end
