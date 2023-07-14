require 'json'

task :default => [:run]

desc 'load the price list and orders!'
task 'run' do
  $LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), 'lib')))
  require 'breakfast_app'

  # file paths
  price_list_file_location = 'files/price-list.json'
  orders_file_location = 'files/orders.json'
  output_file_path = 'results/change_results.json'

  # call the app to process orders and price list
  BreakfastApp.process_price_list(price_list_file_location, orders_file_location, output_file_path)

  # read the results 
  result_json = File.read(output_file_path)
  result = JSON.parse(result_json)

  # print the output
  puts 'Total:'
  puts sprintf('%-10s%-11s', 'name', 'change')
  puts sprintf('--------')
  result.each do |r|
    puts sprintf('%-10s$%-10.2f', r['name'], r['change'])
  end
end