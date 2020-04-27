class ProcessController < ApplicationController
  def index
    @id = (Time.now.to_f * 1000).to_i
    ProgressIncrementJob.perform_later(@id)
  end
end
