class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.new_comment.subject
  #
  def new_comment(comment)
    @comment = comment
    @post = @comment.post
    @email = @post.user.email
    sleep 5 # to show insede sidekiq dashboard
    mail(to: @email,
    subject: "New post posted for #{ @post.title.truncate(10) }")
  end
end
