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
	// Select some random question from the collection of questions
	var rand = Math.random();
	var question = Questions.findOne({random : { $gte : rand }});
	if (question == null){
		question = Question.findOne({random: {$lte : rand }});
	}
	emailUsers(question.question);
}, 86400000);