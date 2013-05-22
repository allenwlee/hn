get '/' do
  @posts = Post.all
  # Look in app/views/index.erb
  erb :index
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end


