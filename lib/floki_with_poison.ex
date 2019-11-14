defmodule FlokiWithPoison do
  @moduledoc """
  Documentation for FlokiWithPoison.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FlokiWithPoison.hello()
      :world

  """
  def hello do
    :world
  end

  @help_website_body "You need to suffix this method with _http or _https"

  def get_website_body, do: ~s(#{@help_website_body} with a url in parameter)
  def get_website_body(url), do: "#{@help_website_body}, ex: FlokiWithPoison.get_website_body_https('" <> url <> "')"


  def get_website_body_http(url) do
    case HTTPoison.get("http://" <> url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def get_website_body_https(url) do
    case HTTPoison.get("https://" <> url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
