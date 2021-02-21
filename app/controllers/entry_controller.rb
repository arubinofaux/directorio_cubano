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
    # read body
    data = request.body
    # parse it
    doc = Nokogiri::HTML(data, nil, 'ISO-8859-1')
    doc.encoding = 'UTF-8'

    foundEntries = []

    # find data inside table
    doc.css('tbody tr').each do |tr|
      name = ""
      phone = ""
      address = ""

      tr.css('td').each_with_index do |line, index|
        case index
        when 0
          name = line.text.split.each { |name| name.capitalize! }.join(' ')
        when 1
          phone = line.text.strip
      
          if phone.length == 10
            phone = phone[2..-1]
          end
        when 2
          address = line.text.split.each { |name| name.capitalize! }.join(' ')
        end
      end

      foundEntries << {
        name: name, phone: phone, address: address
      }
    end

    foundEntries.each do |d|
      if d[:phone].length == 8
        entry =  Entry.find_by_phone(d[:phone])
        comp = true

        comp = false if d[:name].length == 0
        comp = false if d[:address].length == 0

        if entry
          # remove partial entry
          if comp
            entry.update(
              name: d[:name],
              address: d[:address],
              completed: comp
            )
          else
            entry.destroy
          end
        else
          # create the entry
          unless comp == false
            Entry.create(
              name: d[:name],
              phone: d[:phone],
              address: d[:address],
              completed: comp
            )
          end
        end
      end
    end

    render json: {}
  end

  def random
    entry = Entry.where(completed: false).order("RANDOM()").first

    render json: entry
  end
end
