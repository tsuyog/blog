require 'test_helper'
class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Book")
    @categoryOne = Category.create(name: "Programming")
  end

  test "should show categories lists" do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@categoryOne), text: @categoryOne.name
  end
end