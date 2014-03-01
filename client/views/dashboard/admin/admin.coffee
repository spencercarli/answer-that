Deps.autorun ()->
	Meteor.subscribe 'recentQuestions'

Template.admin.helpers {
	recentQuestions: ->
		Questions.find({ approved:true }, {sort: {submitted: -1}})

	messagesToBeApproved: () ->
		return Questions.find { approved: false }, {sort: {submitted: -1}}
}

Template.admin.events {
	'submit form': (e, target) ->
		e.preventDefault()

		question = target.find('#question')
		Meteor.call 'addNewQuestionFromAdmin', question.value
		question.value = ""

	'click .approve': (e, target) ->
		e.preventDefault()

		Meteor.call 'approveQuestion', this._id

	'click .deny': (e, target) ->
		e.preventDefault()

		Meteor.call 'denyQuestion', this._id
}