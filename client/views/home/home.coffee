Template.home.rendered = ->

  #SEO Page Title & Description
  document.title = "My New Meteor App"
  $("<meta>", { name: "description", content: "Page description for My New Meteor App" }).appendTo "head"

Template.home.events {
	'submit form': (e, item)->
		e.preventDefault()

		email = item.find('#emailAddress').value
		Meteor.call 'signUp', email, (error, result) ->
			Router.go 'successfulSignup'
}
