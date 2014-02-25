Meteor.methods {
	signUp: (email)->
		check email, String
		x = Accounts.createUser {
			email: email
		}

		Accounts.sendEnrollmentEmail x
		
		return x
}