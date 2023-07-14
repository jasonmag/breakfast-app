require 'json'
require_relative 'file_reader'
require_relative 'json_saver'

module BreakfastApp
  include FileReader
  include JsonSaver

  def self.find_price(item_id, price_list)
    price_list.each do |item|
      return item['price'] if item['id'] == item_id
    end
    nil
  end

  def self.process_price_list(price_list_file_location, orders_file_location, output_file_path)
    price_list = FileReader.read_file(price_list_file_location)
    return unless price_list

    orders_list = FileReader.read_file(orders_file_location)
    return unless orders_list

    results = []

    orders_list.each do |order|
      total_price = 0.0
      change = 0.0

      order['items'].each do |item_id|
        price = find_price(item_id, price_list)
        if price.nil?
          puts "Item ID '#{item_id}' not found in price list."
        else
          total_price += price
        end
      end

      if total_price <= order['money']
        change = order['money'] - total_price
      end

      results << {
        name: order['name'],
        change: change
      }
    end

    JsonSaver.save_to_file(output_file_path, results)
  end
end
