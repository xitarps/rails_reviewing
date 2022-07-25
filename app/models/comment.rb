class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  after_save -> () { CommentMailer.new_comment(self).deliver_now }
end
