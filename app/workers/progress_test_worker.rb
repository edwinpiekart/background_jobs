class ProgressTestWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(*args)

    total 100 # by default

    # for example input big file lines
    (1..100).each do |counter|
      if counter < 95
        at counter, counter.to_s
      elsif counter < 99
        at counter, 'Almost done'
      else
        at counter, 'Done'
      end
      sleep 0.5
    end

  end

end
