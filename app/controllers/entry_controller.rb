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
    doc = Nokogiri::HTML(data)

    name = ""
    phone = ""
    address = ""

    # find data inside table
    doc.css('td').each_with_index do |line, index|
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

    logger.info("#{name}, #{phone}, #{address}")

    if phone.length == 8
      entry =  Entry.find_by_phone(phone)
      comp = true

      comp = false if name.length == 0
      comp = false if address.length == 0

      if entry
        # remove partial entry
        if comp
          entry.update(
            name: name,
            address: address,
            completed: comp
          )
        else
          entry.destroy
        end
      else
        # create the entry
        unless comp == false
          Entry.create(
            name: name,
            phone: phone,
            address: address,
            completed: comp
          )
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
