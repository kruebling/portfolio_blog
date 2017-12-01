class Article < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  acts_as_votable
  belongs_to :user

  validates :user_id, :presence => true, numericality: { only_integer: true }
  validates :title, :presence => true
  validates :body, :presence => true
end
