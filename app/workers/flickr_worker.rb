require 'flickr'

class FlickrWorker
  include Sidekiq::Worker
  def perform
    dogs = []
    flickr = Flickr.new
    list   = flickr.photos.search(tags: [:dog, :cute], tag_mode: :all, per_page: 100, page: 1)
    list.each do |dog|
      url = Flickr.url dog
      dogs << Dog.new(url: url, picture_id: dog.id, secret: dog.secret, cuteness: 0)
    end
    Dog.import dogs, validate_uniqueness: true
  end
end