require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "should not save without phone" do
    restaurant = restaurants(:restaurant_no_phone)
	assert !restaurant.save
  end
  
  test "should not save without name" do
    restaurant = restaurants(:restaurant_no_name)
	assert !restaurant.save
  end
end
