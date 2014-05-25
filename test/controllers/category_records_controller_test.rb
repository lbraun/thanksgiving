require 'test_helper'

class CategoryRecordsControllerTest < ActionController::TestCase
  setup do
    @category_record = category_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_record" do
    assert_difference('CategoryRecord.count') do
      post :create, category_record: { category: @category_record.category, recipient_id: @category_record.recipient_id }
    end

    assert_redirected_to category_record_path(assigns(:category_record))
  end

  test "should show category_record" do
    get :show, id: @category_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_record
    assert_response :success
  end

  test "should update category_record" do
    patch :update, id: @category_record, category_record: { category: @category_record.category, recipient_id: @category_record.recipient_id }
    assert_redirected_to category_record_path(assigns(:category_record))
  end

  test "should destroy category_record" do
    assert_difference('CategoryRecord.count', -1) do
      delete :destroy, id: @category_record
    end

    assert_redirected_to category_records_path
  end
end
