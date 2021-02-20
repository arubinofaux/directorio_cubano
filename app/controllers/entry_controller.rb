class EntryController < ApplicationController
  def tracking
    entries = Entry.all

    payload = {
      completed: entries.where(completed: true).count,
      non_completed: entries.where(completed: false).count,
      count: entries.count
    }

    render json: payload
  end

  def read
    render json: {"hi": ":)"}
  end
end
