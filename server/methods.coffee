Meteor.methods {
	deleteUser: (id) ->
		Meteor.users.remove(id);
}