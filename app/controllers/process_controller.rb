# frozen_string_literal: true

class ProcessController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js do
        # give each job an id
        @id = (Time.now.to_f * 1000).to_i
        ProgressIncrementJob.perform_later(@id)
      end
    end
  end
end
