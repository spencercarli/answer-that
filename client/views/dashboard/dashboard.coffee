Template.dashboard.helpers {
	currentUser: () ->
		return Meteor.user()
}

Template.dashboard.events {
	'click #delete': ->
		# alert Meteor.user()._id
		Meteor.call 'deleteUser', Meteor.user()

		Router.go 'home'
}