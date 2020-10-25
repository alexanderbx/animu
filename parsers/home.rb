html = Nokogiri.HTML(content)
series = html.css('.ListEpisodios > li')

series.each do |new_episode|
    name = new_episode.css('.Title').first.text
    episode = new_episode.css('.Capi').first.text
    url_rel = new_episode.css('.fa-play').first['href'] 
    image_rel = new_episode.css('.Image img').first['src']
    url = "https://www3.animeflv.net#{url_rel}"
    image = "https://www3.animeflv.net#{image_rel}"

    outputs << {
        _collection: 'premire',
        name: name,
        episode: episode,
        url: url,
        image: image
    }

    pages << {
        url: image,
        page_type: 'image'
    }
end
