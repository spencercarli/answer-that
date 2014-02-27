Meteor.methods {
	deleteUser: (user) ->
		Meteor.users.remove(user._id);
		Email.send {
			to: user.emails[0].address
			from: 'spencer@handlebarlabs.com'
			subject: 'Unsubscribed from Answer That'
			text: 'Sorry to see you go. If you ever want to get daily questions to answer again, sign up again at alsdkjf.com!'
		}
}