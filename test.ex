defmodule Test do
  @moduledoc """
  A collection of sample functions for benchmark testing.
  """

  @doc """
  Using `Enum` functions, convert a list of integers into strings and
  split them into their graphemes.
  """
  def enum_grapheme_list(limit \\ 1_000) do
    1..limit
    |> Enum.map(&Integer.to_string/1)
    |> Enum.map(&String.graphemes/1)
  end

  @doc """
  Using `Stream` functions with a final `Enum.to_list`, convert a list of
  integers into strings and split them into their graphemes.
  """
  def stream_grapheme_list(limit \\ 1_000) do
    1..limit
    |> Stream.map(&Integer.to_string/1)
    |> Stream.map(&String.graphemes/1)
    |> Enum.to_list
  end

  @doc """
  Using `Enum` functions, convert a list of integers into strings and
  split them into their graphemes.
  """
  def enum_grapheme_list_shortened(limit \\ 1_000, count \\ 5) do
    1..limit
    |> Enum.map(&Integer.to_string/1)
    |> Enum.map(&String.graphemes/1)
    |> Enum.take(count)
  end

  @doc """
  Using `Stream` functions with a final `Enum.to_list`, convert a list of
  integers into strings and split them into their graphemes.
  """
  def stream_grapheme_list_shortened(limit \\ 1_000, count \\ 5) do
    1..limit
    |> Stream.map(&Integer.to_string/1)
    |> Stream.map(&String.graphemes/1)
    |> Enum.take(count)
  end
end
