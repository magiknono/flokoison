defmodule FlokiWithPoisonTest do
  use ExUnit.Case

  test "FlokiWithPoison.get_website_body()" do
    assert FlokiWithPoison.get_website_body() == "You need to add a url in parameter"
  end

  test "FlokiWithPoison.get_website_body(url)" do
    assert FlokiWithPoison.get_website_body("http://info.cern.ch/hypertext/WWW/TheProject.html") == :ok
  end

  test "FlokiWithPoison.get_elixir_current_version" do
    assert FlokiWithPoison.get_elixir_current_version() == {:ok, "Elixir v1.9 released"}
  end

end
