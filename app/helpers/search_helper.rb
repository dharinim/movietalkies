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
            # Store in db if not exist in movie table

            @movies_list.push({
              poster: image_basepath + result["poster_path"],
              original_title: result["original_title"],
              movie_id: result["id"]
            })

            if @movies_list.length > max_limit - 1
              break
            end
        end
    end

    return @movies_list
  end
end
