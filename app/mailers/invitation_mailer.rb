class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invited.subject
  #

  def invited(invitations, event)
    @event = event
    @invitations = invitations.where(role: "guest", event: event, sent: nil)
    @invitations.each do |invitation|
      @user = invitation.user
      mail(to: @user.email, subject: "You've been invited")
    end
  end
end
