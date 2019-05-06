require 'flickr'

class FlickrWorker
  include Sidekiq::Worker

  def perform
    saveCount = 0
    page = 1
    flickr = Flickr.new
    while saveCount < 100 do
      list = flickr.photos.search(content_type: 1, safe_search: 1, tags: [:dog, :cute, :animal], tag_mode: :all, per_page: 100 - saveCount, page: page)
      list.reject { |dog| Dog.all.pluck(:picture_id).include? dog.id}.each do |obj|
        url = Flickr.url obj
        dog = Dog.new(url: url, picture_id: obj.id, secret: obj.secret, cuteness: 0)
        if dog.save
          saveCount += 1
        end
      end
      page += 1
    end
  end
end