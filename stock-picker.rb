puts "Enter an Array of stock prices across a set of days chronologically separated by commas:"

def stock_picker(stock_array)
  best_yield = Array.new(2)
  best_value = 0
  stock_array.each_with_index do|buying_day_value,buying_day_index|
    for selling_day_index in buying_day_index+1..stock_array.length-1 do
      current_value = stock_array[selling_day_index].to_i - buying_day_value.to_i
      if current_value > best_value
        best_value = current_value
        best_yield[0] = buying_day_index
        best_yield[1] = selling_day_index
      end
    end
  end
  p "Buying on day #{best_yield[0]} & selling on day #{best_yield[1]} results in the best ROI of $#{best_value}"
  best_yield
end
# stock_picker("17,3,6,9,15,8,6,1,10")
stock_picker(gets.chomp.split(","))