class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { in: 1..255 }
  validates :content, presence: true, length: { in: 1..255 }

  default_scope { order('created_at DESC') }

end
