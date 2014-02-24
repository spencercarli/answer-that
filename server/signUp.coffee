Meteor.methods {
	signUp: (email)->
		check email, String
		console.log 'waiting'
		x = Accounts.createUser {
			email: email
		}
		console.log 'success'
		
}