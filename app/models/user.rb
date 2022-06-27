class User < ApplicationRecord
  has_many :sentences

  validates :email, :name, presence: true, uniqueness: true
  scope :active, -> { where(active: true) }

  def last_sentence
    sentences.order("created_at ASC").last
  end
end
