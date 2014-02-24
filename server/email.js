emailUser = function(){
	Meteor.users.find().forEach(function(user){
		var userEmails = user.emails;

		console.log(userEmails[0]);
	});
}

Fiber = Npm.require('fibers');

// At a specific interval, email all the users a question
setInterval(function(){

	Fiber(function(){
		emailUser();
	}).run();

}, 2000);