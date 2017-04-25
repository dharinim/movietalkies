require "httparty"
reqiure "rspec"


response = HTTParty.get('https://api.themoviedb.org/3/search/movie?api_key=bd68c036b87d2a4e8c836f04dd3a0a75&page=1&query=beauty')
res 
res= JSON.parse(response.body)
hasBeauty = false
res["results"].each do |r|
    puts r
    if beahc
    hasBead = trye
end

expect hasBEauty.to eq true
