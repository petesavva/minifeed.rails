class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :feed

  delegate :category, to: :feed, allow_nil: true

  validates :user,         presence: true
  validates :external_id,  presence: true
  validates :name,         presence: true
  validates :published_at, presence: true
  validates :is_read,      inclusion: {in: [true, false]}
  validates :is_starred,   inclusion: {in: [true, false]}

  default_scope -> {
    order(published_at: :desc)
  }

  scope :unread,  -> { where(is_read: false)   }
  scope :starred, -> { where(is_starred: true) }

  scope :with_category_id, -> (category_id) {
    joins(:feed).where(feeds: {category_id: category_id})
  }

  def is_unread?
    !is_read?
  end
end
