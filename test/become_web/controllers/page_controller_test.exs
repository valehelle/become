defmodule BecomeWeb.PageControllerTest do
  use BecomeWeb.ConnCase


  describe "index/2" do
    test "Render the page", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Welcome to Phoenix!"
    end
    test "Have CSV file input", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Select CSV"
    end
  end


  describe "convert/2" do
    test "Get the CSV file"
    test "Check the file is in CSV format"
    test "Convert CSV file into Elixir object."
    test "Recursively go through it and convert it into JPY, THB, USD, BTC currency"
    test "Display the result"
    test "Returns an error and if the file is not a csv format or have uneven order"
  end


end
