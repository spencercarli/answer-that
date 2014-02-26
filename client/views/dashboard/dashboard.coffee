Template.dashboard.helpers {
	currentUser: () ->
		return Meteor.user()
}

Template.dashboard.events {
	'click #delete': ->
		# alert Meteor.user()._id
		Meteor.call 'deleteUser', Meteor.user()._id
		Router.go 'home'
}