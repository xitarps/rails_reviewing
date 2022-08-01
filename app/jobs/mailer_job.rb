class MailerJob < ApplicationJob
  queue_as :mailer

  def perform(comment)
    # send our email here
    CommentMailer.new_comment(comment).deliver
  end
end
