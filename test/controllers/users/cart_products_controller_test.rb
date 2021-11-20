require "test_helper"

class Users::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_cart_products_index_url
    assert_response :success
  end

  test "should get create" do
    get users_cart_products_create_url
    assert_response :success
  end

  test "should get destroy" do
    get users_cart_products_destroy_url
    assert_response :success
  end
end
