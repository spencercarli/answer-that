Meteor.startup(function(){
	if (Questions.find().count() === 0){
		Accounts.createUser({
			email: 'a@a.com',
			password: 'password',
			profile: {
				admin: true
			}
		});

		Questions.insert({
			question: "How old would you be if you didn't know how old you are?",
			submitted: new Date(),
			random: Math.random()
		});

		Questions.insert({
			question: "If you had the opportunity to get a message across to a large group of people, what would your message be?",
			submitted: new Date(),
			random: Math.random()
		});

		Questions.insert({
			question: "If not now, then when?",
			submitted: new Date(),
			random: Math.random()
		});

		Questions.insert({
			question: "Have you done anything lately worth remembering?",
			submitted: new Date(),
			random: Math.random()
		});
	}
});
