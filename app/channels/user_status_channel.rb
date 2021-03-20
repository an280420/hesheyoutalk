class UserStatusChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    current_user.update(status: true)
    stream_from "user_status_channel"
    render_users
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_user.update(status: false)
    stream_from "user_status_channel"
    render_users
  end

  def render_users
    ActionCable.server.broadcast "user_status_channel",
    users: User.online
  end
end
