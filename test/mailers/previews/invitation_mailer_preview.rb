class InvitationMailerPreview < ActionMailer::Preview
  def invited
    user = User.first
    event = Event.last
    InvitationMailer.invited(user, event)
  end
end
