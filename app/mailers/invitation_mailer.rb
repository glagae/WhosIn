class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invited.subject
  #

  def invited(invitation, event)
    @event = event
      @user = invitation.user
      mail(to: @user.email, subject: "You've been invited")
  end
end
