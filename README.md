# FlokiWithPoison

**elixir exo**

Get body response of an http|https request with the given url in parameter
Scrap text of a given url with given css selectors of a html node

# basic test 
mix test

## examples with http or https

```elixir
FlokiWithPoison.get_website_body("https://elixir-lang.org/")
FlokiWithPoison.scrape_me("https://elixir-lang.org/","div.news > h3 > a")

```
# generated doc

![screenshot](https://raw.githubusercontent.com/magiknono/flokoison/master/capture.png)

## Resources
- [start with mix](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html)
- [github HTTPoison](https://github.com/edgurgel/httpoison)
- [github Floki](https://github.com/philss/floki)
- [elixir with](https://elixirschool.com/en/lessons/basics/control-structures/#with)

## Docs
- [mix](https://hexdocs.pm/mix/Mix.html)
- [floki](https://hexdocs.pm/floki/Floki.html)
- [HTTPoison](https://hexdocs.pm/httpoison/HTTPoison.html)
- [elixir with](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1)

## Guides and Parentheses...
- [elixir syntax reference](https://hexdocs.pm/elixir/syntax-reference.html)
- [elixir style guide](https://github.com/christopheradams/elixir_style_guide)
- [create doc](https://elixirschool.com/en/lessons/basics/documentation/)

# todo & learn:
- with & understand parentheses 

--- auto generated readme ---

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `flokoison` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:flokoison, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/flokoison](https://hexdocs.pm/flokoison).

