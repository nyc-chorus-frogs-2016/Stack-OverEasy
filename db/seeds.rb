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

10.times do
  user = User.create!(username:Faker::Internet.user_name, email:Faker::Internet.safe_email, password: 'pw123456', password_confirmation:'pw123456')
  3.times do
    question = Question.create!(title: Faker::Hacker.say_something_smart, content: Faker::Hacker.say_something_smart,questioner: user
     )
    3.times do
      answer = Answer.create!(content:Faker::Hacker.say_something_smart, question:question,responder:user)
    end
  end
end

number_of_comments = (1..10).to_a

questions = Question.all
users = User.all
answers = Answer.all

50.times do
  question = questions.sample
  number_of_comments.sample.times do
    Comment.create!(content: Faker::Hacker.say_something_smart, commenter: users.sample, commentable: question)
  end
end

50.times do
  answer = answers.sample
  number_of_comments.sample.times do
    Comment.create!(content: Faker::Hacker.say_something_smart, commenter: users.sample, commentable: answer)
  end
end

number_of_votes = (1..15).to_a
vote_val = [-1, 1]
50.times do
  vote = vote_val.sample
  answer = answers.sample
  number_of_votes.sample.times do
    Vote.create!(value: vote, voter: users.sample, votable: answer)
  end
end

50.times do
  vote = vote_val.sample
  question = questions.sample
  number_of_votes.sample.times do
    Vote.create!(value: vote, voter: users.sample, votable: question)
  end
end
