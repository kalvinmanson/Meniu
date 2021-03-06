require 'test_helper'

class PlatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plate = plates(:one)
  end

  test "should get index" do
    get plates_url
    assert_response :success
  end

  test "should get new" do
    get new_plate_url
    assert_response :success
  end

  test "should create plate" do
    assert_difference('Plate.count') do
      post plates_url, params: { plate: { active: @plate.active, category: @plate.category, content: @plate.content, deleted_at: @plate.deleted_at, diners: @plate.diners, favored: @plate.favored, name: @plate.name, options: @plate.options, place_id: @plate.place_id, tags: @plate.tags } }
    end

    assert_redirected_to plate_url(Plate.last)
  end

  test "should show plate" do
    get plate_url(@plate)
    assert_response :success
  end

  test "should get edit" do
    get edit_plate_url(@plate)
    assert_response :success
  end

  test "should update plate" do
    patch plate_url(@plate), params: { plate: { active: @plate.active, category: @plate.category, content: @plate.content, deleted_at: @plate.deleted_at, diners: @plate.diners, favored: @plate.favored, name: @plate.name, options: @plate.options, place_id: @plate.place_id, tags: @plate.tags } }
    assert_redirected_to plate_url(@plate)
  end

  test "should destroy plate" do
    assert_difference('Plate.count', -1) do
      delete plate_url(@plate)
    end

    assert_redirected_to plates_url
  end
end
