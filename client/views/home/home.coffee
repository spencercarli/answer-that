Template.home.rendered = ->

  #SEO Page Title & Description
  document.title = "Answer That."
  $("<meta>", { name: "description", content: "A new question to answer each day. Directly to your inbox." }).appendTo "head"

# Template.home.events {
# 	'submit form': (e, item)->
# 		e.preventDefault()

# 		email = item.find('#emailAddress').value
# 		Meteor.call 'signUp', email, (error, result) ->
# 			Router.go 'successfulSignup'
# }
