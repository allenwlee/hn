User.create(username: 'allen', password: 'password')
Post.create(title: "hey", body: "this is my first post")
User.find(1).posts << Post.first
Comment.create(body: "my first comment")
Post.find(1).comments << Comment.first
User.find(1).comments << Comment.first
