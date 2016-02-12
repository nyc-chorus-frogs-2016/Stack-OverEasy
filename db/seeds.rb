denna = User.create(username:'Denna', password:'password', email:'Denna@gmail.com')

jan = User.create(username:'Jan', password:'password', email:'Jan@gmail.com')

scott = User.create(username:'Scott', password:'password', email:'Scott@gmail.com')

q1 = Question.create(title:'What is the best cohort?', content:'jk, I know it is the Island Foxes, but feel free to give other answers', questioner: jan)

q2 = Question.create(title:'How to use the .sort enumerable?', content:'I am trying to sort a group of Sports Team array, here is my code', questioner: scott)

a1 = Answer.create(content:'Chorus Frogs are the best imo', question_id: q1.id, responder: denna)

a2 = Answer.create(content:'Crabs are the best imo', question_id: q1.id, responder: jan)

c1 = Comment.create(content:'no they\'re not', commenter: scott, commentable: q1)

v1 = Vote.create(value:1, voter:denna, votable:q1)
v1 = Vote.create(value:1, voter:jan, votable:q1)
