Deps.autorun ()->
	Meteor.subscribe 'recentQuestions'

Template.admin.helpers {
	admin: ->
		user = Meteor.user()
		return true  if user.profile.admin  if user
		false
	recentQuestions: ->
		Questions.find({}, {sort: {submitted: -1}})
}

Template.admin.events {
	'submit form': (e, target) ->
		e.preventDefault();

		question = target.find('#question')
		Meteor.call 'addNewQuestion', question.value
		question.value = ""
}