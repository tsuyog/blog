require 'test_helper'
class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create(name: "Sports")
  end
  test "should get index" do
    get :index
    assert_response :success
  end
  test "should get new" do
    get :new
    assert_response :success
  end
  test "should get show" do
    #if you do not provide Id for item then it will fail everytime, so i did following, temp: first create setup method
    #get :show
    get(:show, {'id' => @category.id})
    assert_response :success
  end
end