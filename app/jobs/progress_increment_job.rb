# frozen_string_literal: true

class ProgressIncrementJob < ApplicationJob
  queue_as :default

  def perform(id)
    # pretend to do something
    10.times do |i|
      sleep rand
      # send progress update
      ActionCable.server.broadcast("progress_#{id}", "#{(i + 1) * 10}%")
    end
    # Tell the world on another channel that the job finished
    ActionCable.server.broadcast('message_channel', message: "message_#{id} is finished")
  end
end
