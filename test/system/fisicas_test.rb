require "application_system_test_case"

class FisicasTest < ApplicationSystemTestCase
  setup do
    @fisica = fisicas(:one)
  end

  test "visiting the index" do
    visit fisicas_url
    assert_selector "h1", text: "Fisicas"
  end

  test "creating a Fisica" do
    visit fisicas_url
    click_on "New Fisica"

    fill_in "Cpf", with: @fisica.cpf
    fill_in "Endereco", with: @fisica.endereco
    fill_in "Nome", with: @fisica.nome
    fill_in "Telefone", with: @fisica.telefone
    fill_in "Token", with: @fisica.token
    click_on "Create Fisica"

    assert_text "Fisica was successfully created"
    click_on "Back"
  end

  test "updating a Fisica" do
    visit fisicas_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @fisica.cpf
    fill_in "Endereco", with: @fisica.endereco
    fill_in "Nome", with: @fisica.nome
    fill_in "Telefone", with: @fisica.telefone
    fill_in "Token", with: @fisica.token
    click_on "Update Fisica"

    assert_text "Fisica was successfully updated"
    click_on "Back"
  end

  test "destroying a Fisica" do
    visit fisicas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fisica was successfully destroyed"
  end
end
