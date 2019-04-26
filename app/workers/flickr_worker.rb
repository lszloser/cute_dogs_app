require 'flickr'

class FlickrWorker
  include Sidekiq::Worker
  def perform(who, message)
    dogs = []
    flickr = Flickr.new
    list   = flickr.photos.search(tags: [:dog, :cute], tag_mode: :all, per_page: 100, page: 1)
    list.each do |dog|
      url = Flickr.url dog
      dogs << Dog.new(url: url, picture_id: dog.id, secret: dog.secret)
    end
    Dog.import dogs
    logger.info Flickr.url list[0]
  end
end