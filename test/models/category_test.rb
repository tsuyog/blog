require 'test_helper'
class CategoryTest < ActiveSupport::TestCase
  #key method, runs before every test case in this class
  def setup
    @category = Category.new(name: "Sports")
  end

  test "category Should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    cat = Category.new(name: "Sports")
    assert_not cat.valid?
  end
  test "name should not be too long" do
    @category.name = "T"*30
    assert_not @category.valid?

  end
  test "name should not be too short" do
    @category.name = "TT"
    assert_not @category.valid?
  end
end