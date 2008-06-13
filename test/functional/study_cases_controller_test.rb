require File.dirname(__FILE__) + '/../test_helper'
require 'study_cases_controller'

# Re-raise errors caught by the controller.
class StudyCasesController; def rescue_action(e) raise e end; end

class StudyCasesControllerTest < Test::Unit::TestCase
  fixtures :study_cases

  def setup
    @controller = StudyCasesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:study_cases)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_study_case
    old_count = StudyCase.count
    post :create, :study_case => { }
    assert_equal old_count+1, StudyCase.count
    
    assert_redirected_to study_case_path(assigns(:study_case))
  end

  def test_should_show_study_case
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_study_case
    put :update, :id => 1, :study_case => { }
    assert_redirected_to study_case_path(assigns(:study_case))
  end
  
  def test_should_destroy_study_case
    old_count = StudyCase.count
    delete :destroy, :id => 1
    assert_equal old_count-1, StudyCase.count
    
    assert_redirected_to study_cases_path
  end
end
