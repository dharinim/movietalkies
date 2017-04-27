module SearchHelper
  def search_movie_list(query="beauty")
    if !query
      query = "beauty"
    end

    response = HTTParty.get('https://api.themoviedb.org/3/search/movie?api_key=bd68c036b87d2a4e8c836f04dd3a0a75&page=1&query='+ query)
    res = JSON.parse(response.body)

    @movies_list = []
    image_basepath = "https://image.tmdb.org/t/p/w300"
    max_limit = 9;

    if res["results"]
        results = res["results"]
        results.each do |result|
            m = Movie.find_by(the_movie_db_id: result["id"])

            if !result["poster_path"]
              next
            end
            
            if m.nil?
              m =   Movie.create(poster_path: image_basepath + result["poster_path"],
                original_title: result["original_title"],
                the_movie_db_id: result["id"])
               @movies_list.push({
                poster: image_basepath + result["poster_path"],
                original_title: result["original_title"],
                movie_id: m.id             })
            else
             @movies_list.push({
                poster: image_basepath + result["poster_path"],
                original_title: result["original_title"],
                movie_id: m.id           })
            end

            if @movies_list.length > max_limit - 1
              break
            end

        end
    end

    return @movies_list
  end
end
