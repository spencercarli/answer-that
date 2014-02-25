Router.map ->
  @route 'home',
    path: '/'

  @route 'dashboard',
    path: '/dashboard'

  @route 'successfulSignup',
    path: '/successfulsignup'

  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end Handlebars.templates['404']()

  mustBeSignedIn = ->
    unless Meteor.user()
      @render "home"
      @stop()
    return

  Router.before mustBeSignedIn,
    except: [
      "home"
      "entrySignIn"
      "entrySignUp"
      "entryForgotPassword"
      "entryResetPassword"
    ]
