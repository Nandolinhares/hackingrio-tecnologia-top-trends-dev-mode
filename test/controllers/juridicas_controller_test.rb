require 'test_helper'

class JuridicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @juridica = juridicas(:one)
  end

  test "should get index" do
    get juridicas_url
    assert_response :success
  end

  test "should get new" do
    get new_juridica_url
    assert_response :success
  end

  test "should create juridica" do
    assert_difference('Juridica.count') do
      post juridicas_url, params: { juridica: { cnpj: @juridica.cnpj, endereco: @juridica.endereco, fantasia: @juridica.fantasia, razao: @juridica.razao, telefone: @juridica.telefone, token: @juridica.token } }
    end

    assert_redirected_to juridica_url(Juridica.last)
  end

  test "should show juridica" do
    get juridica_url(@juridica)
    assert_response :success
  end

  test "should get edit" do
    get edit_juridica_url(@juridica)
    assert_response :success
  end

  test "should update juridica" do
    patch juridica_url(@juridica), params: { juridica: { cnpj: @juridica.cnpj, endereco: @juridica.endereco, fantasia: @juridica.fantasia, razao: @juridica.razao, telefone: @juridica.telefone, token: @juridica.token } }
    assert_redirected_to juridica_url(@juridica)
  end

  test "should destroy juridica" do
    assert_difference('Juridica.count', -1) do
      delete juridica_url(@juridica)
    end

    assert_redirected_to juridicas_url
  end
end
