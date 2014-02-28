Router.map ->
  @route 'home',
    path: '/'

  @route 'dashboard',
    path: '/dashboard'

  @route 'admin',
    path: '/admin'
    data: ->
      Meteor.subscribe 'recentQuestions'
    before: ->
      console.log Meteor.user()
      if Meteor.loggingIn()
        return @stop()
      if Meteor.user().profile.admin
        true
      else
        @redirect '/dashboard'
        

  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end Handlebars.templates['404']()

  mustBeSignedIn = ->
    if not Meteor.user()
      @redirect '/'

  Router.before mustBeSignedIn,
    except: [
      "home"
      "entrySignIn"
      "entrySignUp"
      "entryForgotPassword"
      "entryResetPassword"
    ]
