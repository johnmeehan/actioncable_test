class ProgressIncrementJob < ApplicationJob
  queue_as :default

  def perform(id)
    # pretend to do something
    10.times do |i|
      sleep rand()
      # send progress update
      ActionCable.server.broadcast("progress_#{id}", "#{(i +1) * 10}%")
    end
  end
end
