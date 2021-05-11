require "test_helper"

class KoszyksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @koszyk = koszyks(:one)
  end

  test "should get index" do
    get koszyks_url
    assert_response :success
  end

  test "should get new" do
    get new_koszyk_url
    assert_response :success
  end

  test "should create koszyk" do
    assert_difference('Koszyk.count') do
      post koszyks_url, params: { koszyk: { Cena: @koszyk.Cena, Kod_Produktu: @koszyk.Kod_Produktu, Nazwa_Produktu: @koszyk.Nazwa_Produktu, Producent: @koszyk.Producent } }
    end

    assert_redirected_to koszyk_url(Koszyk.last)
  end

  test "should show koszyk" do
    get koszyk_url(@koszyk)
    assert_response :success
  end

  test "should get edit" do
    get edit_koszyk_url(@koszyk)
    assert_response :success
  end

  test "should update koszyk" do
    patch koszyk_url(@koszyk), params: { koszyk: { Cena: @koszyk.Cena, Kod_Produktu: @koszyk.Kod_Produktu, Nazwa_Produktu: @koszyk.Nazwa_Produktu, Producent: @koszyk.Producent } }
    assert_redirected_to koszyk_url(@koszyk)
  end

  test "should destroy koszyk" do
    assert_difference('Koszyk.count', -1) do
      delete koszyk_url(@koszyk)
    end

    assert_redirected_to koszyks_url
  end
end
