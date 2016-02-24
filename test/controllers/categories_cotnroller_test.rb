require 'test_helper'
class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create(name: "Sports")
    @user = User.create(username: "James", email: "james@test.com", password: "123456", admin: true)
  end
  test "should get index" do
    get :index
    assert_response :success
  end
  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  test "should get show" do
    #if you do not provide Id for item then it will fail everytime, so i did following, temp: first create setup method
    #get :show
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  test "should redirect create when admin is not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "Sports"}
    end
    assert_redirected_to categories_path
  end
end