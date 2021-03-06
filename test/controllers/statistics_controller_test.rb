require 'test_helper'

class StatisticsControllerTest < ActionController::TestCase
  test 'user with viewer rights should succeed in viewing statistics' do
    @request.session[:user] = users(:one).id
    users(:one).roles = [Role.default, Role.find_by_name('Viewer')]
    get :index, {}, set_session_user
    assert_response :success
  end

  test 'user with viewer rights should succeed in requesting statistics data via ajax' do
    @request.session[:user] = users(:one).id
    users(:one).roles = [Role.default, Role.find_by_name('Viewer')]
    get :show, {:id => 'operatingsystem', :format=>'json'}, set_session_user
    assert_response :success
  end
end
