Template.admin.helpers {
	admin: ->
		user = Meteor.user()
		return true  if user.profile.admin  if user
		false
}

Template.admin.events {
	'submit form': (e, target) ->
		e.preventDefault();

		question = target.find('#question')
		Meteor.call 'addNewQuestion', question.value
		question.value = ""
}