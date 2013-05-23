helpers do 
  def current_user 
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

  def sort_by_votes(posts)
    posts.sort { |a,b| count_votes(a) <=> count_votes(b) }.reverse
  end

  def count_votes(post)
    if post.votes.map { |v| v.votecount }.inject(:+) == nil
      0
    else
      post.votes.map { |v| v.votecount }.inject(:+)
    end
  end
end
