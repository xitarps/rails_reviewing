class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  # after_save -> () { CommentMailer.new_comment(self).deliver_now }
  # after_save -> { AlertMailer.new_comment(self).deliver_now }
  after_save -> { MailerJob.perform_later(self) }

end
