emailUsers = function(question){
	Meteor.users.find().forEach(function(user){
		var address = user.emails[0].address;

		Email.send({
			to: address,
			from: 'answerthat@mailinator.com',
			subject: 'New Question from Answer That',
			html: Handlebars.templates['sendQuestion']({ question: question })
		});

	});
}

Meteor.setInterval(function(){

	// Select some random question from the collection of questions
	var rand = Math.random();
	var qFound = true;
	var question = Questions.findOne({sent: false, approved: true, random : { $gte : rand }});

	// If there are no questions with a random number greater than rand then check for less than
	if (question == null){
		question = Questions.findOne({sent: false, approved: true, random: {$lte : rand }});
	}
	// If there are no questions left that haven't already been sent
	if (question == null){
		question = {
			question: "There are no questions left that have never been sent out... that's a problem."
		};
		qFound = false;
	}

	// If we did find an unused question in the db then mark it as sent.
	if (qFound){
		Questions.update(question._id, { sent:true });
	}

	emailUsers(question.question);

}, 86400000);
