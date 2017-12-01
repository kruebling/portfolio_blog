class Comment < ApplicationRecord
  belongs_to :article
  has_one :user, through: :article

  validates :user_id, :presence => true, numericality: { only_integer: true }
  validates :article_id, :presence => true, numericality: { only_integer: true }
  validates :body, :presence => true
end
