require 'net/http'
require 'json'

# Make a GET request to the Rick and Morty API to get all episodes
class HttpRequestHandler
  attr_reader :result

  def initialize
    @result = []
    @pages = -1
  end

  def get_characters(episode)
    puts 'iterating over the episodes'
    characters = []
    episode['characters'].each do |character_url|
      character_response = Net::HTTP.get(URI(character_url))
      character = JSON.parse(character_response)
      characters << character
    end
    characters
  end

  def get_json_response(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)

    JSON.parse(response)
  end

  def update_characters(response)
    episodes = response['results']
    episodes.each do |episode|
      episode['characters'] = get_characters(episode)
    end
    episodes
  end

  def episodes(url, pages = -1)
    return if pages.zero?

    response = get_json_response(url)

    pages = response['info']['pages'] if pages == -1

    pages -= 1

    @result += update_characters(response)

    episodes(response['info']['next'], pages)
  end
end

request_handler = HttpRequestHandler.new
request_handler.episodes('https://rickandmortyapi.com/api/episode')

p request_handler.result
