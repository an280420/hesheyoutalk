jQuery(document).on 'turbolinks:load', ->
  App.user_status = App.cable.subscriptions.create "UserStatusChannel",
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log('Connected to UserStatusChannel')

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log('Disconnected to UserStatusChannel')

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      users = data['users'].map (i) -> i['nickname']
      $('#online-users').text(users.join(', '))



    # status: ->
      # @perform 'status'
