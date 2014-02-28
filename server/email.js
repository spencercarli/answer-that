emailUsers = function(question){
	Meteor.users.find().forEach(function(user){
		var address = user.emails[0].address;

		Email.send({
			to: address,
			from: 'spencer@handlebarlabs.com',
			subject: 'New Question from Answer That',
			html: "<h3>Time for a new question from Answer That...</h3> \n" + "<p>" + question + "</p>"
		});

	});
}

Meteor.setInterval(function(){
	var question = Questions.findOne();
	emailUsers(question.question);
}, 86400000);