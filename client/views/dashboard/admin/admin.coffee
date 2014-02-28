Deps.autorun ()->
	Meteor.subscribe 'recentQuestions'

Template.admin.helpers {
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