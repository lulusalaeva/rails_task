class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { in: 1..255 }

  default_scope { order('created_at DESC') }

end
