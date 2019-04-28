require 'flickr'

class FlickrWorker
  include Sidekiq::Worker
  def perform
    flickr = Flickr.new
    list = flickr.photos.search(content_type: 1, safe_search: 1, tags: [:dog, :cute, :animal], tag_mode: :all, per_page: 300, page: 1)
    list.reject { |dog| Dog.all.pluck(:picture_id).include? dog.id}.first(100).each do |obj|
      url = Flickr.url obj
      dog = Dog.new(url: url, picture_id: obj.id, secret: obj.secret, cuteness: 0)
      dog.save
    end
  end
end