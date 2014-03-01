Meteor.methods {
	deleteUser: (user) ->
		Meteor.users.remove(user._id);
		Email.send {
			to: user.emails[0].address
			from: 'spencer@handlebarlabs.com'
			subject: 'Unsubscribed from Answer That'
			text: 'Sorry to see you go. If you ever want to get daily questions to answer again, sign up again at alsdkjf.com!'
		}

	addNewQuestionFromAdmin: (question) ->
		Questions.insert {
			question: question
			submitted: new Date(),
			random: Math.random(), 
			sent: false,
			approved: true
		}

	addNewQuestionFromUser: (question) ->
		Questions.insert {
			question: question
			submitted: new Date(),
			random: Math.random(), 
			sent: false,
			approved: false
		}

	approveQuestion: (question) ->
		Questions.update question, {
				$set: {
					approved: true
				}
			}

	denyQuestion: (question) ->
		Questions.remove question
}