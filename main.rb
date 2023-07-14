require_relative 'lib/breakfast_app'

price_list_file_location = 'files/price-list.json'
orders_file_location = 'files/orders.json'
output_file_path = 'results/change_results.json'

BreakfastApp.process_price_list(price_list_file_location, orders_file_location, output_file_path)
