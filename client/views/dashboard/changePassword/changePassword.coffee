Template.changePassword.events {
	'submit form': (e, target)->
		e.preventDefault()

		oldPassword = target.find('#currentPassword').value
		newPassword = target.find('#newPassword').value
		
		Accounts.changePassword oldPassword, newPassword, (Error)->
			if Error
				alert Error.reason
			else
				Router.go 'dashboard'
}