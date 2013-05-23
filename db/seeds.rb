User.create(username: 'allen', password: 'password')
Post.create(title: "hey", body: "this is my first post")
User.find(1).posts << Post.first
Comment.create(body: "my first comment")
Post.find(1).comments << Comment.first
User.find(1).comments << Comment.first

Post.find(1).votes << Vote.create
Vote.find(1).update_attributes(votecount: 1)

Comment.find(1).votes << Vote.create
Comment.find(1).votes.first.update_attributes(votecount: 1)
