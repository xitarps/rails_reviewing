class AlertMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.alert_mailer.new_comment.subject
  #
  def new_comment(comment = Comment.last)
    @comment = comment
    @post = @comment.post

    mail to: @post.user.email, subject: 'Um assunto'
  end
end
