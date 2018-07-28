require 'test_helper'

class SociosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @socio = socios(:one)
  end

  test "should get index" do
    get socios_url
    assert_response :success
  end

  test "should get new" do
    get new_socio_url
    assert_response :success
  end

  test "should create socio" do
    assert_difference('Socio.count') do
      post socios_url, params: { socio: { administrador: @socio.administrador, fisica_id: @socio.fisica_id, juridica_id: @socio.juridica_id, token: @socio.token } }
    end

    assert_redirected_to socio_url(Socio.last)
  end

  test "should show socio" do
    get socio_url(@socio)
    assert_response :success
  end

  test "should get edit" do
    get edit_socio_url(@socio)
    assert_response :success
  end

  test "should update socio" do
    patch socio_url(@socio), params: { socio: { administrador: @socio.administrador, fisica_id: @socio.fisica_id, juridica_id: @socio.juridica_id, token: @socio.token } }
    assert_redirected_to socio_url(@socio)
  end

  test "should destroy socio" do
    assert_difference('Socio.count', -1) do
      delete socio_url(@socio)
    end

    assert_redirected_to socios_url
  end
end
