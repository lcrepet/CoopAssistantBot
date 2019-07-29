module WithAuthenticatedUser
  def after_user_authenticated(event)
    user = User.find_by(messenger_id: event.conversation_id)

    if user
      yield user
    else
      SendLogin.new.execute(event)
    end
  end
end
