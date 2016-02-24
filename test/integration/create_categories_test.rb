require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "James", email: "james@test.com", password: "123456", admin: true)
  end
  test "get new form and create categories" do
    sign_in_as(@user, "123456")
    get new_category_path
    assert_template 'categories/new'
    #check whether the row has been inserted or not
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "Sports"}
    end
    assert_template 'categories/index'
    assert_match "Sports", response.body
  end
  test "incalid category submission failure" do
    sign_in_as(@user, "123456")
    get new_category_path
    assert_template 'categories/new'
    #check whether the row has been inserted or not
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
    end
    assert_template 'categories/new'
    assert_select 'div.panel-title'
    assert_select 'div.panel-body'
  end
end