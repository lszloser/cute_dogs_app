class TestJob
    include Sidekiq::Worker
    def perform(name, count)
      logger.info "#{name} says the count is #{count}"
    end
  end
  
  20.times do |index|
    MyWorker.perform_in(index, "Bobby", index)
  end