Meteor.publish 'recentQuestions', ()->
	Questions.find({}, {limit:15})