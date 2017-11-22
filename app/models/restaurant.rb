class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  before_validation :downcase_category

  validates :name, :address, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"], allow_nil: false }

  def downcase_category
    self.category.downcase! if self.category.present?
  end

end
