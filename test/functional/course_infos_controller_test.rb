# coding: utf-8
require 'test_helper'

class CourseInfosControllerTest < ActionController::TestCase
   test "the truth" do
     assert true
   end

  test "index" do 
    3.times { Factory(:course_info) }
    get :index
    assert_response :success
    assert_equal 3, assigns[:course_info].count
  end
end
