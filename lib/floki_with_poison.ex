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

  def get_website_body(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end

  end
end
