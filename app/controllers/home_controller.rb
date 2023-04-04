class HomeController < MoviesController
  # before_action :require_user_login!
  
  def index
    @movies = Movie.last(5)
    @users = User.all
    @reviews = Review.find_by_sql(" select * from reviews order by rate desc ")
  end

end
