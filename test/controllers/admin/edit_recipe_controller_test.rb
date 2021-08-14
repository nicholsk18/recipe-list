require "test_helper"

class Admin::EditRecipeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_edit_recipe_index_url
    assert_response :success
  end
end
