require "application_system_test_case"

class JuridicasTest < ApplicationSystemTestCase
  setup do
    @juridica = juridicas(:one)
  end

  test "visiting the index" do
    visit juridicas_url
    assert_selector "h1", text: "Juridicas"
  end

  test "creating a Juridica" do
    visit juridicas_url
    click_on "New Juridica"

    fill_in "Cnpj", with: @juridica.cnpj
    fill_in "Endereco", with: @juridica.endereco
    fill_in "Fantasia", with: @juridica.fantasia
    fill_in "Razao", with: @juridica.razao
    fill_in "Telefone", with: @juridica.telefone
    fill_in "Token", with: @juridica.token
    click_on "Create Juridica"

    assert_text "Juridica was successfully created"
    click_on "Back"
  end

  test "updating a Juridica" do
    visit juridicas_url
    click_on "Edit", match: :first

    fill_in "Cnpj", with: @juridica.cnpj
    fill_in "Endereco", with: @juridica.endereco
    fill_in "Fantasia", with: @juridica.fantasia
    fill_in "Razao", with: @juridica.razao
    fill_in "Telefone", with: @juridica.telefone
    fill_in "Token", with: @juridica.token
    click_on "Update Juridica"

    assert_text "Juridica was successfully updated"
    click_on "Back"
  end

  test "destroying a Juridica" do
    visit juridicas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Juridica was successfully destroyed"
  end
end
