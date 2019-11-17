defmodule FlokoisonTest do
  use ExUnit.Case

  test "Flokoison.get_website_body()" do
    assert Flokoison.get_website_body() == "You must give an url in parameter"
  end

  test "Flokoison.get_website_body(url)" do
    assert Flokoison.get_website_body("http://info.cern.ch/hypertext/WWW/TheProject.html") == :ok
  end

  test "Flokoison.scrape_text(url,css_selectors)" do
    assert Flokoison.scrape_text("https://elixir-lang.org/","div.news > h3 > a") == {:ok, "Elixir v1.9 released"}
  end

  test "Flokoison.scrape_link(url,css_selectors)" do
    assert Flokoison.scrape_link("https://elixir-lang.org/","div.news > h3 > a") == {:ok, ["/blog/2019/06/24/elixir-v1-9-0-released/"]}
  end

end
