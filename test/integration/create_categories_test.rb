require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new form and create categories" do
    get new_category_path
    assert_template 'categories/new'
    #check whether the row has been inserted or not
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "Sports"}
    end
    assert_template 'categories/index'
    assert_match "Sports", response.body
  end
end