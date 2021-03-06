get '/' do
  @posts = Post.all
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  erb :_login
end

post '/login' do
  @user = User.find_by_username(params[:username])
  session[:id] = @user.id
  @posts = @user.posts
  erb :profile
end

get '/user/:user_id/profile' do
  @user = User.find(params[:user_id])
  @posts = @user.posts
  erb :profile
end


get '/post/create' do
  erb :post_create
end

post '/post/create' do
  @post = Post.create(title: params[:title], body: params[:body], user_id: current_user.id)
  redirect "post/#{@post.id}"
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end


get '/signup' do
  erb :_signup
end

post '/signup' do
  @user = User.create(username: params[:username], password: params[:password])
  session[:id] = @user.id
  erb :profile
end



post '/post/:post_id/comment/create' do
  @post = Post.find(params[:post_id])
  @comment = Comment.create(body: params[:comment])
  @post.comments << @comment
  current_user.comments << @comment
  redirect "/post/#{@post.id}"

end

get '/logout' do
  session.clear
  redirect '/'
end

get '/post/:post_id/upvote' do
  @post = Post.find(params[:post_id])
  @vote = Vote.create(votecount: 1)
  @post.votes << @vote
  redirect "/"
end

get '/post/:post_id/downvote' do
  @post = Post.find(params[:post_id])
  @vote = Vote.create(votecount: -1)
  @post.votes << @vote
  redirect "/"
end

get '/post/:post_id/comment/:comment_id/upvote' do
  @post = Post.find(params[:post_id])
  @vote = Vote.create(votecount: 1)
  @comment = Comment.find(params[:comment_id])
  @comment.votes << @vote
  redirect "/post/#{@post.id}"
end

get '/post/:post_id/comment/:comment_id/downvote' do
  @post = Post.find(params[:post_id])
  @vote = Vote.create(votecount: 1)
  @comment = Comment.find(params[:comment_id])
  @comment.votes << @vote
  redirect "/post/#{@post.id}"
end






