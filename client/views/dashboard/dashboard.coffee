Template.dashboard.helpers {
	currentUser: () ->
		return Meteor.user()

	admin: () ->
		return Meteor.user().profile.admin
}

Template.dashboard.events {
	'click #delete': ->
		# alert Meteor.user()._id
		Meteor.call 'deleteUser', Meteor.user()

		Router.go 'home'

	'submit form': (e, target) ->
		e.preventDefault()

		question = target.find('#question')
		Meteor.call 'addNewQuestionFromUser', question.value
		question.value = ""
}