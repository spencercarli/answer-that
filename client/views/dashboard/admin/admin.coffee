Template.admin.helpers {
	admin: ->
		user = Meteor.user()
		return true  if user.profile.admin  if user
		false
}