require 'spec_helper'
require 'breakfast_app'

describe 'Breakfast App' do
  let(:price_list_file_location) { 'spec/files/price-list.json' }
  let(:orders_file_location) { 'spec/files/orders.json' }
  let(:output_file_path) { 'spec/results/change_results.json' }

  before do
    BreakfastApp.process_price_list(price_list_file_location, orders_file_location, output_file_path)
  end

  let(:result_json) do
    <<-JSON
    [
      { "name": "dave", "change": 2.0 },
      { "name": "jenny", "change": 3.0 }
    ]
    JSON
  end

  let(:parsed_result) { JSON.parse(File.read(output_file_path)) }

  it 'should match the expected result' do
    expect(parsed_result).to eq JSON.parse(result_json)
  end

  it 'should contain 2 records' do
    expect(parsed_result.count).to eq 2
  end

  it 'should provide the correct change' do
    expect(parsed_result[0]['change']).to eq 2.0
    expect(parsed_result[1]['change']).to eq 3.0
  end
end
